/**
 * @file soft_ap.c
 * @author Oscar Mercado omercadorico@gmail.com
 * @brief This file contains the definition of functions related to the soft AP operation of the board.
 */
/*******************************************************************************
 * Includes.
 ******************************************************************************/
#include "soft_ap.h"
#include "socket_task.h"
#include "lwip/apps/mdns.h"
#include "wm_net.h"

/*******************************************************************************
 * Global data.
 ******************************************************************************/
board_wifi_control WiFi_Control;

/*******************************************************************************
 * Functions.
 ******************************************************************************/
/**
 * @brief WiFi connection status change callback.
 * 
 * @param linkState current connection status.
 */
void LinkStatusChangeCallback( bool linkState )
{
    static uint8_t retries = 0;

    if ( linkState == false )
    {
        /* -------- LINK LOST -------- */
        /* DO SOMETHING */
        PRINTF( "-------- LINK LOST --------\r\n" );
        
        //Clean connection and reset.
        CleanUpClient();       
    
        if ( reset_saved_wifi_credentials( CONNECTION_INFO_FILENAME ) != 0 )
        {
            PRINTF( "[!] Error occured during resetting of saved credentials!\r\n" );
            while (1)
            __BKPT(0);
        }
        
        else
        {
            // Reset back to AP mode
            PRINTF( "[i] Restarting board.\r\n" );
            NVIC_SystemReset();           
        }
    }

    else
    {
        /* -------- LINK REESTABLISHED -------- */
        /* DO SOMETHING */
        PRINTF( "-------- LINK REESTABLISHED --------\r\n" );
    }
}

/*!
 * @brief Callback function to generate TXT mDNS record for HTTP service.
 */
 static void http_srv_txt( struct mdns_service *service, void *txt_userdata )
 {
    mdns_resp_add_service_txtitem( service, "echo", 4 );
 }

/**
 * @brief This function sets the board as a soft AP to obtain a WiFi network credentials.
 * 
 * @retval result of operation.
 */
uint8_t SetBoardToAP( void )
{
    uint8_t result;
    char ip[16];

    //Set AP default credentials.
    strcpy( WiFi_Control.SSID, WIFI_SSID );
    strcpy( WiFi_Control.Pswd, WIFI_PASSWORD );

    //Start the access point.
    PRINTF( "Starting Access Point: SSID: %s, Chnl: %d\r\n", WiFi_Control.SSID, WIFI_AP_CHANNEL );
    //result = WPL_Start_AP( WiFi_Control.SSID, WiFi_Control.Pswd, WIFI_AP_CHANNEL );

    if ( result != WPLRET_SUCCESS )
    {
        PRINTF( "[!] Failed to start access point\r\n" );
        while ( 1 )
            __BKPT( 0 );
    }

    WiFi_Control.Connected = true;

    //Temporal, Showing board IP for TCP client.
//    WPL_GetIP( ip, 0 );
//    PRINTF(" Now join that network on your device and connect to this IP: %s\r\n", ip );

    //MDNS service announcment.
    LOCK_TCPIP_CORE();
    mdns_resp_init();
    mdns_resp_add_netif( net_get_uap_handle(), "RW612_board" );
    mdns_resp_add_service( net_get_uap_handle(), "RW612_board", "_echo", DNSSD_PROTO_TCP, 10001, http_srv_txt, NULL );
    UNLOCK_TCPIP_CORE();

    //Initializing TCP server.
    if ( socket_task_init( 1, NULL, "10001" ) < 0 )
    {
    	PRINTF( "Failed to start the TCP echo server!\r\n" );
    }

    return result;
}

/**
 * @brief This function cleans up the AP of the board.
 * 
 * @param ssid Pointer to array with WiFi AP SSID.
 * @param pswd Pointer to array with WiFi AP PSWD.
 * 
 * @retval result of operation.
 */
uint8_t CleanUpAP( char *ssid, char *pswd )
{
    PRINTF( "[i] Storing WiFi credentials in mflash\r\n" );
    
    save_wifi_credentials( CONNECTION_INFO_FILENAME, ssid, pswd, DEFAULT_WIFI_SECURITY );

    PRINTF( "[i] Stopping AP!\r\n" );

    if ( WPL_Stop_AP() != WPLRET_SUCCESS )
    {
        PRINTF( "Error while stopping AP\r\n" );
        while ( 1 )
            __BKPT( 0 );
    }

    PRINTF( "[i] Restarting board.\r\n" );
    NVIC_SystemReset();

    return 0;
}

/**
 * @brief This function sets the board as a WiFi client, connecting it to an existing WiFi network.
 * 
 * @retval result of operation. 
 */
uint8_t SetBoardToClient( void )
{
    uint8_t result;

    // If we are already connected, skip the initialization
    if ( !WiFi_Control.Connected )
    {
        //Add Wi-Fi network
        if ( strstr( WiFi_Control.Security, "WPA3_SAE ") )
        {
            result = WPL_AddNetworkWithSecurity( WiFi_Control.SSID, WiFi_Control.Pswd, WIFI_NETWORK_LABEL, WPL_SECURITY_WPA3_SAE );
        }

        else
        {
            result = WPL_AddNetworkWithSecurity( WiFi_Control.SSID, WiFi_Control.Pswd, WIFI_NETWORK_LABEL, WPL_SECURITY_WILDCARD );
        }

        if ( result == WPLRET_SUCCESS )
        {
            PRINTF( "Connecting as client to ssid: %s with password %s\r\n", WiFi_Control.SSID, WiFi_Control.Pswd );
            result = WPL_Join( WIFI_NETWORK_LABEL );
        }

        if ( result != WPLRET_SUCCESS )
        {
            PRINTF( "[!] Cannot connect to Wi-Fi\r\n[!]ssid: %s\r\n[!]passphrase: %s\r\n", WiFi_Control.SSID, WiFi_Control.Pswd );
            WiFi_Control.Connected = false;
        }

        else
        {
            PRINTF( "[i] Connected to Wi-Fi\r\nssid: %s\r\n[!]passphrase: %s\r\n", WiFi_Control.SSID, WiFi_Control.Pswd );
            WiFi_Control.Connected = true;
        }
    }

    return result;
}

/**
 * @brief This function cleans and finishes the WiFi Client connection.
 * 
 * @retval result of operation. 
 */
uint8_t CleanUpClient( void )
{
    //Leave the external AP.
    if ( WPL_Leave() != WPLRET_SUCCESS )
    {
        PRINTF( "[!] Error Leaving from Client network.\r\n" );
        __BKPT( 0 );
    }

    //Remove the network profile.
    if ( WPL_RemoveNetwork( WIFI_NETWORK_LABEL ) != WPLRET_SUCCESS )
    {
        PRINTF( "[!] Failed to remove network profile.\r\n" );
        __BKPT( 0 );
    }

    return 0;
}

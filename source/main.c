/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2023 NXP
 * All rights reserved.
 *
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "lwip/tcpip.h"
#include "lwip/apps/mqtt.h"

#include "board.h"
#include "app.h"
#include "wpl.h"
#include "timers.h"

#include "fsl_debug_console.h"
#include "soft_ap.h"
#include "cred_flash_storage.h"
#include "mqtt_freertos.h"
#include "rgb_controller.h"
#include <stdio.h>

#include "mqtt/include/mqtt_freertos.h"

#include "FreeRTOS.h"

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
static void connect_to_mqtt(void *ctx);
/*******************************************************************************
 * Definitions
 ******************************************************************************/
/*! @brief MQTT server host name or IP address. */
#define EXAMPLE_MQTT_SERVER_HOST "broker.hivemq.com"

/*! @brief MQTT server port number. */
#define EXAMPLE_MQTT_SERVER_PORT 1883

/*! @brief Stack size of the temporary lwIP initialization thread. */
#define INIT_THREAD_STACKSIZE 1024

/*! @brief Priority of the temporary lwIP initialization thread. */
#define INIT_THREAD_PRIO DEFAULT_THREAD_PRIO

/*! @brief Stack size of the temporary initialization thread. */
#define APP_THREAD_STACKSIZE 1024

/*! @brief Priority of the temporary initialization thread. */
#define APP_THREAD_PRIO DEFAULT_THREAD_PRIO

#define MQTT_EXPECTED_RECEIVE_MSGS  6   //Number of expected messages to receive.


/*******************************************************************************
 * Variables
 ******************************************************************************/
extern board_wifi_control WiFi_Control;


/*! @brief MQTT client data. */
static mqtt_client_t *mqtt_client;

/*! @brief MQTT client ID string. */
static char client_id[40];

/*! @brief MQTT client information. */
static const struct mqtt_connect_client_info_t mqtt_client_info = {
    .client_id   = (const char *)&client_id[0],
    .client_user = NULL,
    .client_pass = NULL,
    .keep_alive  = 100,
    .will_topic  = NULL,
    .will_msg    = NULL,
    .will_qos    = 0,
    .will_retain = 0,
#if LWIP_ALTCP && LWIP_ALTCP_TLS
    .tls_config = NULL,
#endif
};

/*! @brief MQTT broker IP address. */
static ip_addr_t mqtt_addr;

/*! @brief Indicates connection to MQTT broker. */
static volatile bool connected = false;

/*******************************************************************************
 * Code
 ******************************************************************************/

/*!
 * @brief Called when subscription request finishes.
 */
static void mqtt_topic_subscribed_cb(void *arg, err_t err)
{
    const char *topic = (const char *)arg;

    if (err == ERR_OK)
    {
        PRINTF("Subscribed to the topic \"%s\".\r\n", topic);
    }
    else
    {
        PRINTF("Failed to subscribe to the topic \"%s\": %d.\r\n", topic, err);
    }
}

/*!
 * @brief Called when there is a message on a subscribed topic.
 */
static void mqtt_incoming_publish_cb(void *arg, const char *topic, u32_t tot_len)
{
    LWIP_UNUSED_ARG(arg);

    PRINTF("Received %u bytes from the topic \"%s\": \"", tot_len, topic);
}

/*!
 * @brief Called when recieved incoming published message fragment.
 */
static void mqtt_incoming_data_cb(void *arg, const u8_t *data, u16_t len, u8_t flags)
{
    static const uint8_t *Expected_messages[] = { "Up", "Down", "Level 1", "Level 2", "Level 3", "Level 4" };
    uint8_t i;

    LWIP_UNUSED_ARG( arg );

    for ( i = 0; i < len; i++ )
    {
        if ( isprint( data[i] ) )
        {
            PRINTF( "%c", ( char ) data[i] );
        }
        else
        {
            PRINTF( "\\x%02x", data[i] );
        }
    }

    if ( flags & MQTT_DATA_FLAG_LAST )
    {
        PRINTF( "\"\r\n" );
    }

    //Analizing message received.
    for ( i = 0; i < MQTT_EXPECTED_RECEIVE_MSGS; i++ )
    {
        if ( memcmp( Expected_messages[i], data, len ) == 0 )
        {
            break;
        }
    }

    //Proccesing data.
    switch ( i )
    {
        case 0: //Up RGB color.
            RGB_Set_Color_Cb( COLOR_UP );
        break;

        case 1: //Down RGB color.
            RGB_Set_Color_Cb( COLOR_DOWN );
        break;

        case 2: //Level 1 RGB toggle.
            RGB_Set_Toggle_Delay_Cb( LEVEL_1_1000_MS );
        break;

        case 3: //Level 2 RGB toggle.
            RGB_Set_Toggle_Delay_Cb( LEVEL_2_500_MS );
        break;

        case 4: //Level 3 RGB toggle.
            RGB_Set_Toggle_Delay_Cb( LEVEL_3_200_MS );
        break;

        case 5: //Level 4 RGB toggle.
            RGB_Set_Toggle_Delay_Cb( LEVEL_4_100_MS );
        break;

        default:
        break;
    }
}

/*!
 * @brief Subscribe to MQTT topics.
 */
static void mqtt_subscribe_topics( mqtt_client_t *client )
{
    #ifdef BOARD_1
        static const char *Sub_topics[] = { "MQTT/K64F/Board2/BTN1", "MQTT/K64F/Board2/BTN2", "MQTT/K64F/Board2/POT" };
    #else
        static const char *Sub_topics[] = { "MQTT/K64F/Board1/BTN1", "MQTT/K64F/Board1/BTN2", "MQTT/K64F/Board1/POT" };
    #endif

    uint8_t QoS[] = { 1, 1, 1 };
    err_t err;
    int i;

    //Setting input callbacks.
    mqtt_set_inpub_callback( client, mqtt_incoming_publish_cb, mqtt_incoming_data_cb, LWIP_CONST_CAST( void *, &mqtt_client_info ) );

    //Subscribing to topics.
    for ( i = 0; i < ARRAY_SIZE( Sub_topics ); i++ )
    {
        err = mqtt_subscribe( client, Sub_topics[i], QoS[i], mqtt_topic_subscribed_cb, LWIP_CONST_CAST( void *, Sub_topics[i] ) );

        if ( err == ERR_OK )
        {
            PRINTF( "Subscribing to the topic \"%s\" with QoS %d...\r\n", Sub_topics[i], QoS[i] );
        }

        else
        {
            PRINTF( "Failed to subscribe to the topic \"%s\" with QoS %d: %d.\r\n", Sub_topics[i], QoS[i], err );
        }
    }
}

/*!
 * @brief Called when connection state changes.
 */
static void mqtt_connection_cb(mqtt_client_t *client, void *arg, mqtt_connection_status_t status)
{
    const struct mqtt_connect_client_info_t *client_info = (const struct mqtt_connect_client_info_t *)arg;

    connected = (status == MQTT_CONNECT_ACCEPTED);

    switch (status)
    {
        case MQTT_CONNECT_ACCEPTED:
            PRINTF("MQTT client \"%s\" connected.\r\n", client_info->client_id);
            mqtt_subscribe_topics(client);
            break;

        case MQTT_CONNECT_DISCONNECTED:
            PRINTF("MQTT client \"%s\" not connected.\r\n", client_info->client_id);
            /* Try to reconnect 1 second later */
            sys_timeout(1000, connect_to_mqtt, NULL);
            break;

        case MQTT_CONNECT_TIMEOUT:
            PRINTF("MQTT client \"%s\" connection timeout.\r\n", client_info->client_id);
            /* Try again 1 second later */
            sys_timeout(1000, connect_to_mqtt, NULL);
            break;

        case MQTT_CONNECT_REFUSED_PROTOCOL_VERSION:
        case MQTT_CONNECT_REFUSED_IDENTIFIER:
        case MQTT_CONNECT_REFUSED_SERVER:
        case MQTT_CONNECT_REFUSED_USERNAME_PASS:
        case MQTT_CONNECT_REFUSED_NOT_AUTHORIZED_:
            PRINTF("MQTT client \"%s\" connection refused: %d.\r\n", client_info->client_id, (int)status);
            /* Try again 10 seconds later */
            sys_timeout(10000, connect_to_mqtt, NULL);
            break;

        default:
            PRINTF("MQTT client \"%s\" connection status: %d.\r\n", client_info->client_id, (int)status);
            /* Try again 10 seconds later */
            sys_timeout(10000, connect_to_mqtt, NULL);
            break;
    }
}

/*!
 * @brief Starts connecting to MQTT broker. To be called on tcpip_thread.
 * @note Connects the client with the MQTT broker.
 */
static void connect_to_mqtt(void *ctx)
{
    LWIP_UNUSED_ARG(ctx);

    PRINTF("Connecting to MQTT broker at %s...\r\n", ipaddr_ntoa(&mqtt_addr));

    mqtt_client_connect(mqtt_client, &mqtt_addr, EXAMPLE_MQTT_SERVER_PORT, mqtt_connection_cb,
                        LWIP_CONST_CAST(void *, &mqtt_client_info), &mqtt_client_info);
}

/*!
 * @brief Called when publish request finishes.
 */
static void mqtt_message_published_cb(void *arg, err_t err)
{
    const char *topic = (const char *)arg;

    if (err == ERR_OK)
    {
        PRINTF("Published to the topic \"%s\".\r\n", topic);
    }
    else
    {
        PRINTF("Failed to publish to the topic \"%s\": %d.\r\n", topic, err);
    }
}

/*!
 * @brief Publishes a message. To be called on tcpip_thread.
 */
static void publish_message(void *ctx)
{
    static const char *topic   = "lwip_topic/100";
    static const char *message = "message from board";

    LWIP_UNUSED_ARG(ctx);

    PRINTF("Going to publish to the topic \"%s\"...\r\n", topic);

    mqtt_publish(mqtt_client, topic, message, strlen(message), 1, 0, mqtt_message_published_cb, (void *)topic);
}

/*******************************************************************************
 * Code
 ******************************************************************************/
/*!
 * @brief The main task function
 */
static void main_task( void *arg )
{
    uint32_t result = 1;
    char ssid[WPL_WIFI_SSID_LENGTH];
    char password[WPL_WIFI_PASSWORD_LENGTH];
    char security[WIFI_SECURITY_LENGTH];
    uint8_t i = 0;

    PRINTF( "\r\n""Starting RW612 WIFI MQTT project\r\n" );

    init_flash_storage( CONNECTION_INFO_FILENAME );

    //Analize if there are WiFi network credentials available in mflash.
    PRINTF( "[i] Verifying available WiFi credentials.\r\n" );
    reset_saved_wifi_credentials(CONNECTION_INFO_FILENAME);
   
    result = get_saved_wifi_credentials( CONNECTION_INFO_FILENAME, ssid, password, security );

    if ( result == 0 && strcmp( ssid, "" ) != 0 )
    {   //Credentials available.
        PRINTF( "[i] WiFi credentials found\r\n" );
        WiFi_Control.WifiState = WIFI_STATE_CLIENT;

        strcpy( WiFi_Control.SSID, ssid );
        strcpy( WiFi_Control.Pswd, password );
        strcpy( WiFi_Control.Security, security );
    }

    else
    {   //Credentials not available.
        PRINTF( "[i] WiFi credentials not available\r\n" );

        strcpy( WiFi_Control.SSID, WIFI_SSID );
        strcpy( WiFi_Control.Pswd, WIFI_PASSWORD );
        WiFi_Control.WifiState = WIFI_STATE_AP;
    }

    WiFi_Control.Connected = false;

    //Initialize wifi module.
    PRINTF( "[i] Initializing Wi-Fi module... \r\n" );

    result = WPL_Init();
    if ( result != WPLRET_SUCCESS )
    {
        PRINTF( "[!] WPL Init failed: %d\r\n", ( uint32_t ) result );
        __BKPT( 0 );
    }

    result = WPL_Start( LinkStatusChangeCallback );
    if ( result != WPLRET_SUCCESS )
    {
        PRINTF( "[!] WPL Start failed %d\r\n", ( uint32_t ) result );
        __BKPT( 0 );
    }

    PRINTF( "[i] Successfully initialized Wi-Fi module\r\n" );

    //Verify board WiFi state.
    while ( true )
    {
        //Check connection retries.
        if ( i > MAX_CONNECTION_ATTEMPTS )
        {   //Set to AP mode.
            WiFi_Control.WifiState = WIFI_STATE_AP;
        }

        if ( WiFi_Control.WifiState == WIFI_STATE_CLIENT )
        {
            SetBoardToClient();

            //Verifying if board was able to connect.
            if ( WiFi_Control.Connected = true )
            {
                mqtt_freertos_run_thread( netif_default );  //run mqtt task.
                break;
            }

            i++;
        }

        else
        {   //AP mode.
            SetBoardToAP();
            break;
        }
    }

    vTaskDelete( NULL );

}

/*!
 * @brief Main function.
 */


int main( void )
{
    /* Initialize the hardware */
    BOARD_InitHardware();
    GPIO_PortInit(GPIO, 0U);

    /* Create the main Task */
    if ( xTaskCreate( main_task, "main_task", 2048, NULL, configMAX_PRIORITIES - 4, NULL ) != pdPASS )
    {
        PRINTF( "[!] MAIN Task creation failed!\r\n" );
        while ( 1 )
            ;
    }

    /* Run RTOS */
    vTaskStartScheduler();

    /* Should not reach this statement */
    for ( ;; )
        ;
}

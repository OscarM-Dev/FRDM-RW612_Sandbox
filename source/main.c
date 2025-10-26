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
#include "board.h"
#include "app.h"
#include "wpl.h"
#include "timers.h"

#include "fsl_debug_console.h"
#include "soft_ap.h"
#include "cred_flash_storage.h"
#include "mqtt_freertos.h"

#include <stdio.h>

#include "FreeRTOS.h"

/*******************************************************************************
 * Prototypes
 ******************************************************************************/


/*******************************************************************************
 * Definitions
 ******************************************************************************/


/*******************************************************************************
 * Variables
 ******************************************************************************/
extern board_wifi_control WiFi_Control;

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

/**
 * @file soft_ap.h
 * @author Oscar Mercado omercadorico@gmail.com
 * @brief This header contains the declaration of macros and functions related to the soft AP and WiFi operation of the board.
 * @version 0.1
 * @date 2025-10-25
 * 
 * @copyright Copyright (c) 2025
 * 
 */
#ifndef SOFT_AP_H
#define SOFT_AP_H
/*******************************************************************************
 * Includes.
 ******************************************************************************/
#include <stdint.h>
#include <stdio.h>
#include "fsl_debug_console.h"
#include "cred_flash_storage.h"
#include "wpl.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define WIFI_SECURITY_LENGTH  63

//AP credentials.
#ifndef WIFI_SSID
    #define WIFI_SSID "RW612_Soft_AP"
#endif

#ifndef WIFI_PASSWORD
    #define WIFI_PASSWORD "NXP0123456789"
#endif

//AP configuration macros.
#define WIFI_AP_CHANNEL 1
#define CONNECTION_INFO_FILENAME ( "connection_info.dat" )

#define WIFI_NETWORK_LABEL "MyWifi"

/*******************************************************************************
 * Types.
 ******************************************************************************/
/**
 * @brief WiFi states enum.
 * 
 */
typedef enum
{
    WIFI_STATE_CLIENT,
    WIFI_STATE_AP
} board_wifi_states;

/**
 * @brief Control struct for WiFi operation.
 * 
 */
typedef struct 
{
    board_wifi_states WifiState;
    char SSID[WPL_WIFI_SSID_LENGTH];
    char Pswd[WPL_WIFI_PASSWORD_LENGTH];
    char Security[WIFI_SECURITY_LENGTH];
    bool Connected;
} board_wifi_control;

/*******************************************************************************
 * Function prototypes.
 ******************************************************************************/
void LinkStatusChangeCallback( bool linkState );
uint8_t SetBoardToAP( void );
uint8_t CleanUpAP( void );
uint8_t SetBoardToClient( void );
uint8_t CleanUpClient( void );

#endif

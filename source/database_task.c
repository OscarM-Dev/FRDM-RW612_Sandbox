/*
 * Copyright (c) 2001-2003 Swedish Institute of Computer Science.
 * All rights reserved. 
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission. 
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED 
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING 
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY 
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 * 
 * Author: Adam Dunkels <adam@sics.se>
 *
 */

//phpmyadmin user:root pwd:udooer

#include "lwip/opt.h"
#include "event_groups.h"
#include "queue.h"
#include "timers.h"
#include "stdio.h"
#include <stdbool.h>
#include <string.h>
#include "public_macros.h"
#include "board.h"

//Test from the web browser
//	http://192.168.1.2:1031/datalog.php?frdm_id=FRMD-Profe&sensor=acc&data=123123
//	http://192.168.1.2:1031/nfcauth.php?tagid=4474c7a1e4e81
//	http://192.168.1.2:1031/nfcreg.php?tagid=4474c7a1e4e81&name=Luis&lastname=Garabito&access=Mortal
//	http://192.168.1.2:1031/nfcreg.php?tagid=0638040324&name=Luis&lastname=Garabito&access=Mortal
//Test from the web browser

extern QueueHandle_t servo_queue;
extern QueueHandle_t database_queue;
extern EventGroupHandle_t event_group;


#if LWIP_NETCONN

#include "lwip/sys.h"

extern TimerHandle_t ledOffTimer;

#define LOCAL_DB_MAX_TAGS      2
#define LOCAL_DB_TAGID_LENGTH  20

static char s_localTagStorage[LOCAL_DB_MAX_TAGS][LOCAL_DB_TAGID_LENGTH] = {0};
static char *s_registeredTags[LOCAL_DB_MAX_TAGS] = {0};
static uint8_t s_registeredTagsCount = 0;

// Returns true if the tag is already present in the local simulated DB.
static bool local_db_is_tag_registered(const char *tagID)
{
	uint8_t i;

	for (i = 0; i < s_registeredTagsCount; i++)
	{
		if ((s_registeredTags[i] != NULL) && (strcmp(s_registeredTags[i], tagID) == 0))
		{
			return true;
		}
	}

	return false;
}

// Registers a new tag in the local simulated DB if there is space.
static bool local_db_register_tag(const char *tagID)
{
	char *slot;

	if (s_registeredTagsCount >= LOCAL_DB_MAX_TAGS)
	{
		return false;
	}

	slot = s_localTagStorage[s_registeredTagsCount];
	strncpy(slot, tagID, LOCAL_DB_TAGID_LENGTH - 1U);
	slot[LOCAL_DB_TAGID_LENGTH - 1U] = '\0';

	s_registeredTags[s_registeredTagsCount] = slot;
	s_registeredTagsCount++;

	return true;
}

/*-----------------------------------------------------------------------------------*/
// Main database task: receives tag IDs and handles register/auth modes.
void database_task(void *pvParameters)
{
	char tagID[20];
	char servocmd = 0;
	EventBits_t tcpipBits;

	//Wait until TCPIP stack is up and running
	tcpipBits = xEventGroupWaitBits( event_group, LWIP_READY_FLAG, pdFALSE, pdTRUE, portMAX_DELAY );
		
	LWIP_ASSERT("database_task(): LED timer creation failed.", ledOffTimer != NULL);

	TS_PRINTF("Database Task Started.\n\r");
	
	//Wait for new tagID to authenticate or register.
	while ( xQueueReceive( database_queue, &tagID, portMAX_DELAY ) )
	{
		//Check mode of operation: authentication or registration.
		if ( xEventGroupGetBits( event_group ) & REGISTER_TAG_FLAG )
		{
			//Register ID.
			TS_PRINTF( "Received a tagID to Register: %s\n\r" , tagID );

			// Simulated local validation/register flow (no HTTP requests).
			// sprintf(HTTPrequest, "GET /nfcauth.php?tagid=%s HTTP/1.0\r\n\r\n", tagID);
			// err = netconn_write(conn, HTTPrequest, strlen(HTTPrequest), NETCONN_COPY);
			// while ((err = netconn_recv(conn, &buf)) == ERR_OK)

			if (local_db_is_tag_registered(tagID))
			{
				// Tag was already registered previously.
				TS_PRINTF("User already registered in local DB.\n\r");
				LED_RED_ON();
				LED_BLUE_ON();
				LED_GREEN_ON();
				xTimerReset( ledOffTimer, 0 );
			}
			else
			{
				// Tag not found; try to register it in local DB.
				// sprintf(HTTPrequest, "GET /nfcreg.php?tagid=%s&name=... HTTP/1.0\r\n\r\n", tagID);
				// err = netconn_write(conn, HTTPrequest, strlen(HTTPrequest), NETCONN_COPY);

				if (local_db_register_tag(tagID))
				{
					TS_PRINTF( "User Registered in local DB\n" );
					LED_RED_ON();
					LED_BLUE_ON();
					LED_GREEN_ON();
					xTimerReset( ledOffTimer, 0 );
				}
				else
				{
					TS_PRINTF( "Local DB is full, cannot register user\n" );
					LED_RED_ON();
					LED_BLUE_ON();
					xTimerReset( ledOffTimer, 0 );
				}
			}

			xEventGroupClearBits( event_group, REGISTER_TAG_FLAG );
		}

		else
		{
			//Authenticate ID.
			TS_PRINTF( "Received a tagID to Authenticate: %s\n\r" , tagID );

			// Simulated local authentication flow (no HTTP requests).
			// sprintf(HTTPrequest, "GET /nfcauth.php?tagid=%s HTTP/1.0\r\n\r\n", tagID);
			// err = netconn_write(conn, HTTPrequest, strlen(HTTPrequest), NETCONN_COPY);
			// while ((err = netconn_recv(conn, &buf)) == ERR_OK)

			if (local_db_is_tag_registered(tagID))
			{
				// Valid user; open servo.
				TS_PRINTF("User exists in local DB.\n\r");

				//Send a message to the servo task to open the door
				servocmd = OPEN_SERVO_CMD;
				xQueueSend( servo_queue, &servocmd, portMAX_DELAY );
				LED_GREEN_ON();
				xTimerReset( ledOffTimer, 0 );
			}
			else
			{
				// Unknown user; deny access.
				TS_PRINTF("User does NOT exist in local DB.\n\r");
				LED_RED_ON();
				xTimerReset( ledOffTimer, 0 );
			}
		}
	}

	vTaskSuspend(NULL);
}
/*-----------------------------------------------------------------------------------*/

#endif /* LWIP_NETCONN */

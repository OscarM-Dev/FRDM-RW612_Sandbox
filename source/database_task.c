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
#include "lwip/api.h"

static void led_off_timer_callback(TimerHandle_t xTimer)
{
	LED_RED_OFF();
	LED_GREEN_OFF();
	LED_BLUE_OFF();
}

/*-----------------------------------------------------------------------------------*/
void database_task(void *pvParameters)
{
	struct netconn *conn;
	err_t err;
	int result;
	char* charptr;
	ip4_addr_t ipaddr;
	char HTTPrequest[100] = {0};
	struct netbuf *buf;
	void *data;
	u16_t len;
	char tagID[20];
	char servocmd = 0;
	EventBits_t tcpipBits;
	TimerHandle_t ledOffTimer;

	//Wait until TCPIP stack is up and running
	tcpipBits = xEventGroupWaitBits( event_group, LWIP_READY_FLAG, pdFALSE, pdTRUE, portMAX_DELAY );

	ledOffTimer = xTimerCreate( "ledOffTimer",  LED_DELAY_MS,  pdFALSE, NULL, led_off_timer_callback );
	
	LWIP_ASSERT("database_task(): LED timer creation failed.", ledOffTimer != NULL);

	PRINTF("Database Task Started.\n\r");
	
	//Wait for new tagID to authenticate or register.
	while ( xQueueReceive( database_queue, &tagID, portMAX_DELAY ) )
	{
		PRINTF( "Received a tagID to Authenticate: %s\n\r" , tagID );
			
		//Connect to database.
		// Create a TCP client socket for one authentication transaction.
		conn = netconn_new(NETCONN_TCP);

		// Local source port is 7; remote destination port is configured below (1031).
		netconn_bind(conn, IP_ADDR_ANY, 7);

		LWIP_ERROR("tcpecho: invalid conn", (conn != NULL), return;);

		// PHP server endpoint in LAN.
		IP4_ADDR(&ipaddr, 192,168,1,2);
		netconn_connect(conn, &ipaddr, 1031);

		// Authenticate user by sending tag ID as query string to nfcauth.php.
		PRINTF( "Authenticate user\n\r" );
			
		// HTTP GET line: server script will validate tagid and return text response.
		sprintf(HTTPrequest, "GET /nfcauth.php?tagid=%s HTTP/1.0\r\n\r\n", tagID);
		PRINTF("HTTPrequest to database: %s\n\r", HTTPrequest);
		err = netconn_write(conn, HTTPrequest, strlen(HTTPrequest), NETCONN_COPY);

		// netconn_recv may return multiple netbuf fragments for one HTTP response.
		while ((err = netconn_recv(conn, &buf)) == ERR_OK)
		{
			do {
				// data/len points to current payload fragment from lwIP pbuf chain.
				netbuf_data(buf, &data, &len);
				//PRINTF("Received: %s\n", data);
			} while (netbuf_next(buf) >= 0);

			// At this point, data points to the last fragment visited in the loop above.
			PRINTF("Received: %s\n", data);
			
			// Very simple validation: look for expected marker in HTTP body/text payload.
			charptr = strstr((const char *)data, "tag_id: ");
			
			if (charptr)
			{
				PRINTF("User does exists.\n\r");
					
				//Send a message to the servo task to open the door
				servocmd = OPEN_SERVO_CMD;
				xQueueSend( servo_queue, &servocmd, portMAX_DELAY );
				LED_GREEN_ON();
				xTimerReset( ledOffTimer, 0 );
			}
			
			else
			{
				PRINTF("User does NOT exists.\n\r");
				LED_RED_ON();
				xTimerReset( ledOffTimer, 0 );
			}
			netbuf_delete(buf);
		}


		//	PRINTF("Register new user\n\r");
		//	//register new user
		//	sprintf(HTTPrequest, "GET /nfcreg.php?tagid=4474c7a1e4e81&name=Luis&lastname=Garabito&access=Mortal HTTP/1.0\r\n\r\n");
		//	err = netconn_write(conn, HTTPrequest, strlen(HTTPrequest), NETCONN_COPY);
		//	while ((err = netconn_recv(conn, &buf)) == ERR_OK)
		//	{
		//		do {
		//			netbuf_data(buf, &data, &len);
		//			PRINTF("Received: %s\n", data);
		//		} while (netbuf_next(buf) >= 0);
		//		//PRINTF("Received: %s\n", data);
		//		result = strncmp("HTTP/1.1 200 OK", data, 15);
		//		if (result == 0)
		//		{
		//			PRINTF("User Registered\n");
		//		}
		//		netbuf_delete(buf);
		//	}

		//	PRINTF("Authenticate user\n\r");
		//	//authenticate user
		//	sprintf(HTTPrequest, "GET /nfcauth.php?tagid=4474c7a1e4e81 HTTP/1.0\r\n\r\n");
		//	err = netconn_write(conn, HTTPrequest, strlen(HTTPrequest), NETCONN_COPY);
		//	PRINTF("Authenticate user1\n\r");
		//	while ((err = netconn_recv(conn, &buf)) == ERR_OK)
		//	{
		//		PRINTF("Authenticate user2\n\r");
		//		do {
		//			netbuf_data(buf, &data, &len);
		//			PRINTF("Received: %s\n", data);
		//		} while (netbuf_next(buf) >= 0);
		//		//PRINTF("Received: %s\n", data);
		//		result = strstr(data, "4474c7a1e4e81");
		//		if (result == 0)
		//		{
		//			PRINTF("User exists\n");
		//		}
		//		netbuf_delete(buf);
		//	}
		netconn_close(conn);
		netconn_delete(conn);
	}

	vTaskSuspend(NULL);
}
/*-----------------------------------------------------------------------------------*/

#endif /* LWIP_NETCONN */

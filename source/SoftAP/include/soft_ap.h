/*
 * Copyright 2020-2023 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef SOFT_AP_H
#define SOFT_AP_H

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/* @TEST_ANCHOR */

#define WIFI_SECURITY_LENGTH  63

/* Common Wi-Fi parameters */
#ifndef WIFI_SSID
#define WIFI_SSID "nxp_configuration_access_point"
#endif

#ifndef WIFI_PASSWORD
#define WIFI_PASSWORD "NXP0123456789"
#endif

#define WIFI_NETWORK_LABEL "MyWifi"

/* Parameters that apply to AP mode only */
#ifndef WIFI_AP_CHANNEL
#define WIFI_AP_CHANNEL 1
#endif

#define CONNECTION_INFO_FILENAME ("connection_info.dat")

#define WEBCONFIG_DEBUG

#ifdef WEBCONFIG_DEBUG
#define WC_DEBUG(__fmt__, ...) PRINTF(__fmt__, ##__VA_ARGS__)
#else
#define WC_DEBUG(...)
#endif

#endif /* _WEBCONFIG_H_ */

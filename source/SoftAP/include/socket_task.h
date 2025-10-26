/*
 * Copyright 2022, 2025 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef SOCKET_TASK_H
#define SOCKET_TASK_H

#include "lwip/sockets.h"

int socket_task_init(int is_tcp, const char *ip_str, const char *port_str);
void socket_task_terminate(void);

#endif /* SOCKET_TASK_H */

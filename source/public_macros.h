#ifndef PUBLIC_MACROS_H
#define PUBLIC_MACROS_H

#include "FreeRTOS.h"
#include "semphr.h"
#include "fsl_debug_console.h"

extern SemaphoreHandle_t printf_mutex;

//Macros.
//Event group flags.
#define LWIP_READY_FLAG ( 1 << 0 )
#define REGISTER_TAG_FLAG ( 1 << 1 )

//Servo control macros.
#define OPEN_SERVO_CMD    'o'
#define CLOSE_SERVO_CMD   'c'

//LEDs control macros.
#define LED_DELAY_MS pdMS_TO_TICKS( 2000 )

//USB NFC task macros.
#define NFC_TASK_DELAY pdMS_TO_TICKS( 250 )

//Printf safe thread safe macro.
#define TS_PRINTF(...)                                                       \
    {                                                                        \
        if (printf_mutex != NULL)                                            \
        {                                                                    \
            (void)xSemaphoreTake(printf_mutex, portMAX_DELAY);               \
        }                                                                    \
        PRINTF(__VA_ARGS__);                                                 \
        if (printf_mutex != NULL)                                            \
        {                                                                    \
            (void)xSemaphoreGive(printf_mutex);                              \
        }                                                                    \
    }


#endif /* PUBLIC_MACROS_H */
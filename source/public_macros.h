#ifndef PUBLIC_MACROS_H
#define PUBLIC_MACROS_H

//Macros.
//Event group flags.
#define LWIP_READY_FLAG ( 1 << 0 )

//Servo control macros.
#define OPEN_SERVO_CMD    'o'
#define CLOSE_SERVO_CMD   'c'

//LEDs control macros.
#define LED_DELAY_MS pdMS_TO_TICKS( 2000 )

//USB NFC task macros.
#define NFC_TASK_DELAY pdMS_TO_TICKS( 250 )

#endif /* PUBLIC_MACROS_H */
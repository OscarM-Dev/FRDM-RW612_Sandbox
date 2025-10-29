/**
 * @file rgb_controller.h
 * @author Oscar Mercado omercadorico@gmail.com
 * @brief This header contains the declaration of macros, control structures and functions related to the RGB remote controller driver.
 * 
 */
#ifndef RGB_CONTROLLER_H
#define RGB_CONTROLLER_H

#include "pin_mux.h"
#include "clock_config.h"
#include "board.h"
#include "fsl_debug_console.h"
#include "fsl_gpio.h"
#include "timers.h"

/*******************************************************************************
 * Macros.
 ******************************************************************************/
#define RGB_CHANNEL_ENABLED     0
#define RGB_CHANNEL_DISABLED    1
#define RGB_RED_BLUE_DISABLED   0x00600000
#define RGB_GREEN_DISABLED      0x04000000
#define RGB_TOGGLE_CHANNEL      1 << RGB_LED.RGB_pins_conf[RGB_LED.RGB_color].Pin
#define RGB_TOGGLE_LEVEL_1_COUNTS   10
#define RGB_TOGGLE_LEVEL_2_COUNTS   5
#define RGB_TOGGLE_LEVEL_3_COUNTS   2
#define RGB_TOGGLE_LEVEL_4_COUNTS   1


#define PORT_0						0U
/*******************************************************************************
 * Enums.
 ******************************************************************************/
/**
 * @brief RGB colors.
 * 
 */
typedef enum
{
    RED,
    GREEN,
    BLUE
} RGB_colors;

/**
 * @brief RGB updates.
 * 
 */
typedef enum
{
    COLOR_UP,
    COLOR_DOWN
} RGB_color_update;

/**
 * @brief RGB toggle levels.
 * 
 */
typedef enum
{
    LEVEL_1_1000_MS,
    LEVEL_2_500_MS,
    LEVEL_3_200_MS,
    LEVEL_4_100_MS
} RGB_toggle_levels;

/*******************************************************************************
 * Structs.
 ******************************************************************************/
/**
 * @brief Configuration structure for each RGB pin. 
 * 
 */
typedef struct
{
    GPIO_Type *Gpio;                //Ptr to GPIO base add.
    uint8_t Pin;                    //Pin number.
    gpio_pin_config_t Pin_config;   //Pin initial configuration.
} RGB_config;

/**
 * @brief Control structure for RGB LED.
 * 
 */
typedef struct
{
    RGB_config RGB_pins_conf[3];
    RGB_colors RGB_color;
    RGB_toggle_levels RGB_toggle_level;
    uint8_t RGB_toggle_timer_counts;
} RGB_control;


static RGB_control RGB_LED =
{
    .RGB_pins_conf =
    {
        //Red channel
        {
            .Gpio = BOARD_LED_RED_GPIO,
            .Pin = BOARD_LED_RED_GPIO_PIN,
            .Pin_config =
            {
                .pinDirection = kGPIO_DigitalOutput,
                .outputLogic = RGB_CHANNEL_ENABLED
            }
        },
        //Green channel
        {
            .Gpio = BOARD_LED_GREEN_GPIO,
            .Pin = BOARD_LED_GREEN_GPIO_PIN,
            .Pin_config =
            {
                .pinDirection = kGPIO_DigitalOutput,
                .outputLogic = RGB_CHANNEL_DISABLED
            }
        },
        //Blue channel.
        {
            .Gpio = BOARD_LED_BLUE_GPIO,
            .Pin = BOARD_LED_BLUE_GPIO_PIN,
            .Pin_config =
            {
                .pinDirection = kGPIO_DigitalOutput,
                .outputLogic = RGB_CHANNEL_DISABLED
            }
        }
    },
    .RGB_color = RED,
    .RGB_toggle_level = LEVEL_1_1000_MS,
    .RGB_toggle_timer_counts = RGB_TOGGLE_LEVEL_1_COUNTS
};
/*******************************************************************************
 * RGB related functions.
 ******************************************************************************/
bool RGB_Init( void );
bool RGB_Set_Color_Cb( RGB_color_update Color_update );
bool RGB_Set_Toggle_Delay_Cb( RGB_toggle_levels level );
void vRGB_Timer_Cb( TimerHandle_t xTimer );

/*******************************************************************************
 * Buttons related functions.
 ******************************************************************************/


/*******************************************************************************
 * Potentiometer related functions.
 ******************************************************************************/

#endif

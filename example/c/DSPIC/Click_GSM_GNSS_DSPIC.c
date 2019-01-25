/*
Example for GSM_GNSS Click

    Date          : jan 2019.
    Author        : Katarina Perendic

Test configuration dsPIC :
    
    MCU                : P33FJ256GP710A
    Dev. Board         : EasyPIC Fusion v7
    dsPIC Compiler ver : v7.1.0.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes all necessary GPIO pins, UART used for
the communcation with GSM/GNSS module and UART used for infromation logging
- Application Initialization - Initializes driver, power on module and sends few
command for the default module configuration
- Application Task - running in parallel core state machine and checks for call flag. 
If call detected parser will hang up call. 
Every 3 seconds calls NMEA - GGA command to receive the current position

Additional Functions :

All additional functions such as timer initialization and default handler. 

Notes :

- Echo must be turned off for succefull parsing. ( ATE0 )
- UART polling works much better with HFC enabled.
- In case of usage of other MCUs Timer initialization must be adjusted according to your MCU.

*/

#include "Click_GSM_GNSS_types.h"
#include "Click_GSM_GNSS_config.h"
#include "Click_GSM_GNSS_timer.h"

  
static char GSM_CMD_AT[3]    = "AT";
static char GSM_CMD_ATI[4]   = "ATI";
static char GSM_CMD_ATE[5]   = "ATE0";
static char GSM_CMD_IFC[12]  = "AT+IFC=2,2";
static char GSM_CMD_CMGF[10] = "AT+CMGF=1";
static char GSM_CMD_ATH[4]   = "ATH";
static char GSM_CMD_CLCC[8]  = "AT+CLCC";
static char GNSS_CMD_QGNSSC[15]  = "AT+QGNSSC=1";
static char GNSS_CMD_QGNSSRD[25] = "AT+QGNSSRD=\"NMEA/GGA\"";


void gsmgnss_default_handler( uint8_t *rsp, uint8_t *evArgs )
{
    char *tmp;
    tmp = rsp;
    
    mikrobus_logWrite( tmp, _LOG_TEXT );
}

void systemInit()
{
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_INPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
    
    mikrobus_uartInit( _MIKROBUS1, &_GSMGNSS_UART_CFG[0] );
    mikrobus_logInit( _LOG_USBUART_B, 9600 );
    mikrobus_logWrite("---- Start Init ----", _LOG_LINE);
}

void applicationInit()
{
// TIMER INIT
    gsmgnss_configTimer();

// DRIVER INIT
    gsmgnss_uartDriverInit((T_GSMGNSS_P)&_MIKROBUS1_GPIO, (T_GSMGNSS_P)&_MIKROBUS1_UART);
    gsmgnss_coreInit( gsmgnss_default_handler, 1500 );

// MODULE POWER ON
    gsmgnss_hfcEnable( 1 );
    gsmgnss_modulePower( 1 );

// GSM INIT
    gsmgnss_cmdSingle( &GSM_CMD_AT[0] );
    gsmgnss_cmdSingle( &GSM_CMD_ATI[0] );
    gsmgnss_cmdSingle( &GSM_CMD_ATE[0] );
    gsmgnss_cmdSingle( &GSM_CMD_IFC[0] );
    gsmgnss_cmdSingle( &GSM_CMD_CMGF[0] );
    mikrobus_logWrite("---- GSM Init done ---", _LOG_LINE);
    
    gsmgnss_cmdSingle( &GNSS_CMD_QGNSSC[0] );
    Delay_ms( 3000 );
    
    mikrobus_logWrite("---- GNSS Init done ---", _LOG_LINE);
    mikrobus_logWrite("---- Please, call me :) ----", _LOG_LINE);
}

void applicationTask()
{
// CORE STATE MACHINE
    gsmgnss_process();

    if (0 == gsmgnss_chackRing())
    {
        gsmgnss_cmdSingle( &GSM_CMD_CLCC[0] );
        mikrobus_logWrite("--- Call detected ---", _LOG_LINE);
        gsmgnss_cmdSingle( &GSM_CMD_ATH[0] );
        Delay_ms( 3000 );
    }
    
    if(timerCounter > 3000)
    {
        gsmgnss_cmdSingle( &GNSS_CMD_QGNSSRD[0] );
        timerCounter = 0;
    }
}

void main()
{
    systemInit();
    applicationInit();

    while (1)
    {
        applicationTask();
    }
}

/* -------------------------------------------------------------------------- */
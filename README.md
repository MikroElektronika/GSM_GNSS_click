![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# GSM_GNSS Click

- **CIC Prefix**  : GSMGNSS
- **Author**      : Katarina Perendic
- **Verison**     : 1.0.0
- **Date**        : jan 2019.

---

### Software Support

We provide a library for the GSM_GNSS Click on our [LibStock](https://libstock.mikroe.com/projects/view/1990/gsm-gnss-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

Library carries generic command parser adopted for GSM/NMEA command based modules. 
Generic parser 

Key functions :

- ``` gsmgnss_cmdSingle ``` - Sends provided command to the module
- ``` gsmgnss_setHandler ``` - Handler assignation to the provied command
- ``` gsmgnss_modulePower ``` - Turn on module

**Examples Description**

The application is composed of three sections :

- System Initialization - Initializes all necessary GPIO pins, UART used for
the communcation with GSM/GNSS module and UART used for infromation logging
- Application Initialization - Initializes driver, power on module and sends few
command for the default module configuration
- Application Task - running in parallel core state machine and checks for call flag. 
If call detected parser will hang up call. 
Every 3 seconds calls NMEA - GGA command to receive the current position

```.c
// MODULE POWER ON
    gsmgnss_hfcEnable( 1 );
    gsmgnss_modulePower( 1 );

// GSM INIT
    gsmgnss_cmdSingle( &GSM_CMD_AT[0] );
    gsmgnss_cmdSingle( &GSM_CMD_ATI[0] );
    gsmgnss_cmdSingle( &GSM_CMD_ATE[0] );
    gsmgnss_cmdSingle( &GSM_CMD_IFC[0] );
    gsmgnss_cmdSingle( &GSM_CMD_CMGF[0] );
	
// GNSS INIT
    gsmgnss_cmdSingle( &GNSS_CMD_QGNSSC[0] );
```

Additional Functions :

All additional functions such as timer initialization and default handler. 

Alongside with the demo application timer initialization functions are provided.
Note that timer is configured acording to default develoment system and 
MCUs, changing the system or MCU may require update of timer init and timer ISR 
functions.

The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/1990/gsm-gnss-click) page.

Other mikroE Libraries used in the example:

- String
- Conversion

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---

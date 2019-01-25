/*

Use mikroE Timer Calculator to generate proper timer configuration
and timer ISR.

https://www.mikroe.com/timer-calculator

*/
#include "Click_GSM_GNSS_types.h"

#define __GSM_GNSS_TIMER__

static void gsmgnss_configTimer()
{


    // Configure Timer
}

void Timer_interrupt()
{
    gsmgnss_tick();
    // Reset Flag
}
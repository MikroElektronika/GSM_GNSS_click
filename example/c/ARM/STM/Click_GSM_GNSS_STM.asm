Click_GSM_GNSS_STM_gsmgnss_configTimer:
;click_gsm_gnss_timer.h,17 :: 		static void gsmgnss_configTimer()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_gsm_gnss_timer.h,19 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;click_gsm_gnss_timer.h,20 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;click_gsm_gnss_timer.h,21 :: 		TIM2_PSC = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;click_gsm_gnss_timer.h,22 :: 		TIM2_ARR = 35999;
MOVW	R1, #35999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;click_gsm_gnss_timer.h,23 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;click_gsm_gnss_timer.h,24 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
_SX	[R0, ByteOffset(TIM2_DIER+0)]
;click_gsm_gnss_timer.h,25 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;click_gsm_gnss_timer.h,26 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;click_gsm_gnss_timer.h,27 :: 		}
L_end_gsmgnss_configTimer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Click_GSM_GNSS_STM_gsmgnss_configTimer
_Timer_interrupt:
;click_gsm_gnss_timer.h,29 :: 		void Timer_interrupt() iv IVT_INT_TIM2
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_gsm_gnss_timer.h,31 :: 		gsmgnss_tick();
BL	_gsmgnss_tick+0
;click_gsm_gnss_timer.h,32 :: 		timerCounter++;
MOVW	R1, #lo_addr(_timerCounter+0)
MOVT	R1, #hi_addr(_timerCounter+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;click_gsm_gnss_timer.h,33 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
_SX	[R0, ByteOffset(TIM2_SR+0)]
;click_gsm_gnss_timer.h,34 :: 		}
L_end_Timer_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer_interrupt
_gsmgnss_default_handler:
;Click_GSM_GNSS_STM.c,55 :: 		void gsmgnss_default_handler( uint8_t *rsp, uint8_t *evArgs )
; rsp start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; rsp end address is: 0 (R0)
; rsp start address is: 0 (R0)
;Click_GSM_GNSS_STM.c,60 :: 		mikrobus_logWrite( tmp, _LOG_TEXT );
MOVS	R1, #1
; rsp end address is: 0 (R0)
BL	_mikrobus_logWrite+0
;Click_GSM_GNSS_STM.c,61 :: 		}
L_end_gsmgnss_default_handler:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _gsmgnss_default_handler
_systemInit:
;Click_GSM_GNSS_STM.c,63 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_GSM_GNSS_STM.c,65 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_GSM_GNSS_STM.c,66 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #6
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_GSM_GNSS_STM.c,67 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_GSM_GNSS_STM.c,68 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #1
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_GSM_GNSS_STM.c,69 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_GSM_GNSS_STM.c,71 :: 		mikrobus_uartInit( _MIKROBUS1, &_GSMGNSS_UART_CFG[0] );
MOVW	R0, #lo_addr(__GSMGNSS_UART_CFG+0)
MOVT	R0, #hi_addr(__GSMGNSS_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_uartInit+0
;Click_GSM_GNSS_STM.c,72 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
MOVW	R1, #9600
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_GSM_GNSS_STM.c,73 :: 		mikrobus_logWrite("---- Start Init ----", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_GSM_GNSS_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_GSM_GNSS_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GSM_GNSS_STM.c,74 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_GSM_GNSS_STM.c,76 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_GSM_GNSS_STM.c,79 :: 		gsmgnss_configTimer();
BL	Click_GSM_GNSS_STM_gsmgnss_configTimer+0
;Click_GSM_GNSS_STM.c,82 :: 		gsmgnss_uartDriverInit((T_GSMGNSS_P)&_MIKROBUS1_GPIO, (T_GSMGNSS_P)&_MIKROBUS1_UART);
MOVW	R1, #lo_addr(__MIKROBUS1_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS1_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_gsmgnss_uartDriverInit+0
;Click_GSM_GNSS_STM.c,83 :: 		gsmgnss_coreInit( gsmgnss_default_handler, 1500 );
MOVW	R0, #lo_addr(_gsmgnss_default_handler+0)
MOVT	R0, #hi_addr(_gsmgnss_default_handler+0)
MOVW	R1, #1500
BL	_gsmgnss_coreInit+0
;Click_GSM_GNSS_STM.c,86 :: 		gsmgnss_hfcEnable( 1 );
MOVS	R0, #1
BL	_gsmgnss_hfcEnable+0
;Click_GSM_GNSS_STM.c,87 :: 		gsmgnss_modulePower( 1 );
MOVS	R0, #1
BL	_gsmgnss_modulePower+0
;Click_GSM_GNSS_STM.c,90 :: 		gsmgnss_cmdSingle( &GSM_CMD_AT[0] );
MOVW	R0, #lo_addr(Click_GSM_GNSS_STM_GSM_CMD_AT+0)
MOVT	R0, #hi_addr(Click_GSM_GNSS_STM_GSM_CMD_AT+0)
BL	_gsmgnss_cmdSingle+0
;Click_GSM_GNSS_STM.c,91 :: 		gsmgnss_cmdSingle( &GSM_CMD_ATI[0] );
MOVW	R0, #lo_addr(Click_GSM_GNSS_STM_GSM_CMD_ATI+0)
MOVT	R0, #hi_addr(Click_GSM_GNSS_STM_GSM_CMD_ATI+0)
BL	_gsmgnss_cmdSingle+0
;Click_GSM_GNSS_STM.c,92 :: 		gsmgnss_cmdSingle( &GSM_CMD_ATE[0] );
MOVW	R0, #lo_addr(Click_GSM_GNSS_STM_GSM_CMD_ATE+0)
MOVT	R0, #hi_addr(Click_GSM_GNSS_STM_GSM_CMD_ATE+0)
BL	_gsmgnss_cmdSingle+0
;Click_GSM_GNSS_STM.c,93 :: 		gsmgnss_cmdSingle( &GSM_CMD_IFC[0] );
MOVW	R0, #lo_addr(Click_GSM_GNSS_STM_GSM_CMD_IFC+0)
MOVT	R0, #hi_addr(Click_GSM_GNSS_STM_GSM_CMD_IFC+0)
BL	_gsmgnss_cmdSingle+0
;Click_GSM_GNSS_STM.c,94 :: 		gsmgnss_cmdSingle( &GSM_CMD_CMGF[0] );
MOVW	R0, #lo_addr(Click_GSM_GNSS_STM_GSM_CMD_CMGF+0)
MOVT	R0, #hi_addr(Click_GSM_GNSS_STM_GSM_CMD_CMGF+0)
BL	_gsmgnss_cmdSingle+0
;Click_GSM_GNSS_STM.c,95 :: 		mikrobus_logWrite("---- GSM Init done ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr2_Click_GSM_GNSS_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_GSM_GNSS_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GSM_GNSS_STM.c,97 :: 		gsmgnss_cmdSingle( &GNSS_CMD_QGNSSC[0] );
MOVW	R0, #lo_addr(Click_GSM_GNSS_STM_GNSS_CMD_QGNSSC+0)
MOVT	R0, #hi_addr(Click_GSM_GNSS_STM_GNSS_CMD_QGNSSC+0)
BL	_gsmgnss_cmdSingle+0
;Click_GSM_GNSS_STM.c,98 :: 		Delay_ms( 3000 );
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_applicationInit0:
SUBS	R7, R7, #1
BNE	L_applicationInit0
NOP
NOP
NOP
;Click_GSM_GNSS_STM.c,100 :: 		mikrobus_logWrite("---- GNSS Init done ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr3_Click_GSM_GNSS_STM+0)
MOVT	R0, #hi_addr(?lstr3_Click_GSM_GNSS_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GSM_GNSS_STM.c,101 :: 		mikrobus_logWrite("---- Please, call me :) ----", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr4_Click_GSM_GNSS_STM+0)
MOVT	R0, #hi_addr(?lstr4_Click_GSM_GNSS_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GSM_GNSS_STM.c,102 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_GSM_GNSS_STM.c,104 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_GSM_GNSS_STM.c,107 :: 		gsmgnss_process();
BL	_gsmgnss_process+0
;Click_GSM_GNSS_STM.c,109 :: 		if (0 == gsmgnss_chackRing())
BL	_gsmgnss_chackRing+0
CMP	R0, #0
IT	NE
BNE	L_applicationTask2
;Click_GSM_GNSS_STM.c,111 :: 		gsmgnss_cmdSingle( &GSM_CMD_CLCC[0] );
MOVW	R0, #lo_addr(Click_GSM_GNSS_STM_GSM_CMD_CLCC+0)
MOVT	R0, #hi_addr(Click_GSM_GNSS_STM_GSM_CMD_CLCC+0)
BL	_gsmgnss_cmdSingle+0
;Click_GSM_GNSS_STM.c,112 :: 		mikrobus_logWrite("--- Call detected ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr5_Click_GSM_GNSS_STM+0)
MOVT	R0, #hi_addr(?lstr5_Click_GSM_GNSS_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_GSM_GNSS_STM.c,113 :: 		gsmgnss_cmdSingle( &GSM_CMD_ATH[0] );
MOVW	R0, #lo_addr(Click_GSM_GNSS_STM_GSM_CMD_ATH+0)
MOVT	R0, #hi_addr(Click_GSM_GNSS_STM_GSM_CMD_ATH+0)
BL	_gsmgnss_cmdSingle+0
;Click_GSM_GNSS_STM.c,114 :: 		Delay_ms( 3000 );
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_applicationTask3:
SUBS	R7, R7, #1
BNE	L_applicationTask3
NOP
NOP
NOP
;Click_GSM_GNSS_STM.c,115 :: 		}
L_applicationTask2:
;Click_GSM_GNSS_STM.c,117 :: 		if(timerCounter > 3000)
MOVW	R0, #lo_addr(_timerCounter+0)
MOVT	R0, #hi_addr(_timerCounter+0)
LDR	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	LS
BLS	L_applicationTask5
;Click_GSM_GNSS_STM.c,119 :: 		gsmgnss_cmdSingle( &GNSS_CMD_QGNSSRD[0] );
MOVW	R0, #lo_addr(Click_GSM_GNSS_STM_GNSS_CMD_QGNSSRD+0)
MOVT	R0, #hi_addr(Click_GSM_GNSS_STM_GNSS_CMD_QGNSSRD+0)
BL	_gsmgnss_cmdSingle+0
;Click_GSM_GNSS_STM.c,120 :: 		timerCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_timerCounter+0)
MOVT	R0, #hi_addr(_timerCounter+0)
STR	R1, [R0, #0]
;Click_GSM_GNSS_STM.c,121 :: 		}
L_applicationTask5:
;Click_GSM_GNSS_STM.c,122 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_GSM_GNSS_STM.c,124 :: 		void main()
;Click_GSM_GNSS_STM.c,126 :: 		systemInit();
BL	_systemInit+0
;Click_GSM_GNSS_STM.c,127 :: 		applicationInit();
BL	_applicationInit+0
;Click_GSM_GNSS_STM.c,129 :: 		while (1)
L_main6:
;Click_GSM_GNSS_STM.c,131 :: 		applicationTask();
BL	_applicationTask+0
;Click_GSM_GNSS_STM.c,132 :: 		}
IT	AL
BAL	L_main6
;Click_GSM_GNSS_STM.c,133 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main

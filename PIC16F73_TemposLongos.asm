
_segundos:

;PIC16F73_TemposLongos.c,52 :: 		void segundos(unsigned seg)
;PIC16F73_TemposLongos.c,55 :: 		for(cont = 0; cont < seg; cont++)
	CLRF       R1+0
	CLRF       R1+1
L_segundos0:
	MOVF       FARG_segundos_seg+1, 0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__segundos22
	MOVF       FARG_segundos_seg+0, 0
	SUBWF      R1+0, 0
L__segundos22:
	BTFSC      STATUS+0, 0
	GOTO       L_segundos1
;PIC16F73_TemposLongos.c,57 :: 		delay_ms(1000);
	MOVLW      208
	MOVWF      R13+0
L_segundos3:
	DECFSZ     R13+0, 1
	GOTO       L_segundos3
;PIC16F73_TemposLongos.c,55 :: 		for(cont = 0; cont < seg; cont++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;PIC16F73_TemposLongos.c,58 :: 		}
	GOTO       L_segundos0
L_segundos1:
;PIC16F73_TemposLongos.c,59 :: 		}
L_end_segundos:
	RETURN
; end of _segundos

_minutos:

;PIC16F73_TemposLongos.c,61 :: 		void minutos(unsigned minut)
;PIC16F73_TemposLongos.c,64 :: 		for(cont = 0; cont < minut; cont++)
	CLRF       R1+0
	CLRF       R1+1
L_minutos4:
	MOVF       FARG_minutos_minut+1, 0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__minutos24
	MOVF       FARG_minutos_minut+0, 0
	SUBWF      R1+0, 0
L__minutos24:
	BTFSC      STATUS+0, 0
	GOTO       L_minutos5
;PIC16F73_TemposLongos.c,66 :: 		delay_ms(60000);
	MOVLW      49
	MOVWF      R12+0
	MOVLW      178
	MOVWF      R13+0
L_minutos7:
	DECFSZ     R13+0, 1
	GOTO       L_minutos7
	DECFSZ     R12+0, 1
	GOTO       L_minutos7
	NOP
;PIC16F73_TemposLongos.c,64 :: 		for(cont = 0; cont < minut; cont++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;PIC16F73_TemposLongos.c,67 :: 		}
	GOTO       L_minutos4
L_minutos5:
;PIC16F73_TemposLongos.c,68 :: 		}
L_end_minutos:
	RETURN
; end of _minutos

_ini:

;PIC16F73_TemposLongos.c,70 :: 		void ini()
;PIC16F73_TemposLongos.c,73 :: 		for(cont = 0; cont < 10; cont++)
	CLRF       R1+0
L_ini8:
	MOVLW      10
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ini9
;PIC16F73_TemposLongos.c,75 :: 		LED = 1;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
;PIC16F73_TemposLongos.c,76 :: 		delay_ms(80);
	MOVLW      16
	MOVWF      R13+0
L_ini11:
	DECFSZ     R13+0, 1
	GOTO       L_ini11
	NOP
;PIC16F73_TemposLongos.c,77 :: 		LED = 0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;PIC16F73_TemposLongos.c,78 :: 		delay_ms(300);
	MOVLW      62
	MOVWF      R13+0
L_ini12:
	DECFSZ     R13+0, 1
	GOTO       L_ini12
	NOP
;PIC16F73_TemposLongos.c,73 :: 		for(cont = 0; cont < 10; cont++)
	INCF       R1+0, 1
;PIC16F73_TemposLongos.c,79 :: 		}
	GOTO       L_ini8
L_ini9:
;PIC16F73_TemposLongos.c,80 :: 		}
L_end_ini:
	RETURN
; end of _ini

_main:

;PIC16F73_TemposLongos.c,84 :: 		void main()
;PIC16F73_TemposLongos.c,86 :: 		TRISA      = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;PIC16F73_TemposLongos.c,87 :: 		TRISB      = 0b11111111;  // Todas PORT.B usadas como entrada
	MOVLW      255
	MOVWF      TRISB+0
;PIC16F73_TemposLongos.c,89 :: 		TRISC      = 0b11100111;  // Usa PORTC.3 e PORTC.4 como saida
	MOVLW      231
	MOVWF      TRISC+0
;PIC16F73_TemposLongos.c,90 :: 		OPTION_REG = 0x03;       //Resistores de pull-up internos habilitados
	MOVLW      3
	MOVWF      OPTION_REG+0
;PIC16F73_TemposLongos.c,92 :: 		ini();
	CALL       _ini+0
;PIC16F73_TemposLongos.c,93 :: 		delay_ms(1000);
	MOVLW      208
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
;PIC16F73_TemposLongos.c,94 :: 		RELE = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;PIC16F73_TemposLongos.c,96 :: 		while(1)
L_main14:
;PIC16F73_TemposLongos.c,101 :: 		if(CH1 == 0)//CH1 foi ativada
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main16
;PIC16F73_TemposLongos.c,103 :: 		delay_s = 5;
	MOVLW      5
	MOVWF      _delay_s+0
	MOVLW      0
	MOVWF      _delay_s+1
;PIC16F73_TemposLongos.c,104 :: 		delay_m = 1;
	MOVLW      1
	MOVWF      _delay_m+0
	MOVLW      0
	MOVWF      _delay_m+1
;PIC16F73_TemposLongos.c,105 :: 		}
L_main16:
;PIC16F73_TemposLongos.c,106 :: 		if(CH2 == 0)//CH1 foi ativada
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main17
;PIC16F73_TemposLongos.c,108 :: 		delay_s = 60;
	MOVLW      60
	MOVWF      _delay_s+0
	MOVLW      0
	MOVWF      _delay_s+1
;PIC16F73_TemposLongos.c,109 :: 		delay_m = 5;
	MOVLW      5
	MOVWF      _delay_m+0
	MOVLW      0
	MOVWF      _delay_m+1
;PIC16F73_TemposLongos.c,110 :: 		}
L_main17:
;PIC16F73_TemposLongos.c,112 :: 		if(CH3 == 0)//CH1 foi ativada
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main18
;PIC16F73_TemposLongos.c,114 :: 		delay_s = 60;
	MOVLW      60
	MOVWF      _delay_s+0
	MOVLW      0
	MOVWF      _delay_s+1
;PIC16F73_TemposLongos.c,115 :: 		delay_m = 30;
	MOVLW      30
	MOVWF      _delay_m+0
	MOVLW      0
	MOVWF      _delay_m+1
;PIC16F73_TemposLongos.c,116 :: 		}
L_main18:
;PIC16F73_TemposLongos.c,117 :: 		if(CH4 == 0)//CH1 foi ativada
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main19
;PIC16F73_TemposLongos.c,119 :: 		delay_s = 60;
	MOVLW      60
	MOVWF      _delay_s+0
	MOVLW      0
	MOVWF      _delay_s+1
;PIC16F73_TemposLongos.c,120 :: 		delay_m = 60;
	MOVLW      60
	MOVWF      _delay_m+0
	MOVLW      0
	MOVWF      _delay_m+1
;PIC16F73_TemposLongos.c,121 :: 		}
L_main19:
;PIC16F73_TemposLongos.c,128 :: 		LED = 1;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
;PIC16F73_TemposLongos.c,129 :: 		RELE = 1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;PIC16F73_TemposLongos.c,130 :: 		segundos(delay_s);
	MOVF       _delay_s+0, 0
	MOVWF      FARG_segundos_seg+0
	MOVF       _delay_s+1, 0
	MOVWF      FARG_segundos_seg+1
	CALL       _segundos+0
;PIC16F73_TemposLongos.c,131 :: 		LED = 0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;PIC16F73_TemposLongos.c,132 :: 		RELE = 0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;PIC16F73_TemposLongos.c,133 :: 		minutos(delay_m);
	MOVF       _delay_m+0, 0
	MOVWF      FARG_minutos_minut+0
	MOVF       _delay_m+1, 0
	MOVWF      FARG_minutos_minut+1
	CALL       _minutos+0
;PIC16F73_TemposLongos.c,135 :: 		delay_ms(500);
	MOVLW      104
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
;PIC16F73_TemposLongos.c,136 :: 		}
	GOTO       L_main14
;PIC16F73_TemposLongos.c,137 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

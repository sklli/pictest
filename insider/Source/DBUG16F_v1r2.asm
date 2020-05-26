;
*******************************************************;
DBUG16F : --DEBUG INSIDER-- TARGET ROUTINE VR 1.2;
ATANASIOS MELIMOPOULOS(pic.insider @gmail.com);
16Fxxx > 2K PROG - WORDS

    ;
**************PLACE DEBUG ON / OFF MACROS START - UP DEF

                                                      DBRK EQU 1;
SET BREAKPOINTS - DEBUG ON / OFF 1 / 0 DBEE EQU 1;
SET EEPROM - READ -
        CMD ON / OFF 1 /
            0

            IF DBRK ==
    1;
**************DBUG - DATA - ADR AT 16Fxxx UNUSED BANK - 0 DATA AREA DB0 EQU 7FH;
DEBUG BYTE 0 --W_TMP-- ----COMMON ACCESS AREA DB1 EQU 7EH;
DEBUG BYTE 1 --DATA RX / TX - COMMON ACCESS AREA DB2 EQU 6FH;
DEBUG BYTE 2 --STATUS_TMP DB3 EQU 6EH;
DEBUG BYTE 3 --FSR_TMP DB4 EQU 6DH;
DEBUG BYTE 4 --INTCON_TMP DB5 EQU 6CH;
DEBUG BYTE 5 --PCLATH_TMP

    ;
**************USER - PROG INITIALIZED DEBUG PIN / PORT FOR DIGITAL I /
                         O
#DEFINE X PORTA, 1; DEBUG PORT-- USER SELECTED CPU PORT - REG - PIN
#DEFINE T TRISA, 1; TRIS REG NAME-- USER SELECTED CPU TRIS - REG - PIN
                             DBN EQU .1;
SPEED MULTIPLIER : 1x, 2x, 4x, 8x, 16x ENDIF

    ;
**************DEBUG MACROS noexpand BREAK MACRO bkn;
BREAKPOINT MACRO DEF IF DBRK == 1 MOVWF DB0 MOVLW bkn CALL DBUG BTFSC DB1, 6 GOTO DBGF ENDIF ENDM

    ;
**************PLACE AT EVERY BREAKPOINT ADR :

    BREAK nn;
BREAKPOINT NUMBER : 00H - 0FFH

    ;
**************PLACE THE FOLLOWING CODE AFTER THE USER - CODE

                                                            IF DBRK ==
    1;
DBUG16F : --DEBUG INSIDER-- TARGET ROUTINE VR 1.2

          ORG 0x800 -
          8;
0800H, 1000H, 1800H, etc MOVWF DB1;
SWITCH ROUTINE MOVF STATUS, W;
SAVE BREAK NUMBER CLRF STATUS;
SET RBANK0 MOVWF DB2;
SAVE USER_STATUS MOVF PCLATH, W;
SAVE USER_PCLATH PAGESEL DBUG;
SET DBUG ROM PAGE GOTO DBGX

    ENDPROG EQU 0x2000;
LAST 2K - PAGE - END - PROG - MEM;
CHECK PIC PROG - MEMORY - SIZE ORG ENDPROG - .160 IF DBEE IFDEF EECON1 ORG ENDPROG -
    .184 ENDIF ENDIF

        DBGY BCF INTCON,
    GIE;
INT OFF MOVWF DB4;
SAVE USER_INTCON MOVF FSR, W;
SAVE USER_FSR MOVWF DB3

    ;
TRANSMIT;
START | '1' < ---- > 512cyc '0' < -- > 256cyc;
___ 512 __ D1 ____ D3 ____ D5 ____ D7 ______;
| ____ | D0 | ____ | D2 | __ | D4 | __ | D6 | __ |

    DG001 BSF X;
TRANSMIT DBUG BYTE DB1 BSF STATUS, RP0;
SET HIGH OUTPUT LATCH, SET RBANK1 BCF T;
SET OUTPUT PIN CLRF STATUS;
SET RBANK0

    MOVLW .251 MOVWF FSR;
BIT COUNTER 8DATA CALL DG003;
PAUSE WIDTH 256cyc RLF DB1 GOTO DG006;
START LOW PULSE 512cyc

    DG002 RRF DB1;
4xW + 7 CYC DELAY MOVLW .258 - .127 / DBN;
IF C = 1, DATA PULSE WIDTH = 512cyc BTFSS STATUS, C DG003 MOVLW .258 - .63 / DBN;
IF C = 0, DATA PULSE WIDTH = 256cyc ADDLW 1 BTFSS STATUS,
   Z GOTO $ - 2 DG004 RETURN

                  DG005 CALL DG002 DG006 BCF X CALL DG004;
4xNOP CALL DG002 BSF X CLRWDT INCFSZ FSR GOTO DG005

    ;
WAIT COMMAND;
CMD .7654 = 111X->QUIT SET PC G nnnnnn;
CMD .7654 = 101X->QUIT SET PC C nnnnnn;
CMD .7654 = 1001->SEND DBN SPEED;
CMD .7654 = 1000->QUIT BRK RET;
CMD .7654 = 01 --->WR CMD;
CMD .7654 = 00 --->RD CMD;
CMD .7654 = 0X00->POINT TO RAM DATA;
CMD .7654 = 0X01->POINT TO W_TMP;
CMD .7654 = 0X10->POINT TO STATUS_TMP;
CMD .7654 = 0X11->POINT TO EEPROM DATA;
CMD .0 ------ > IRP - STATUS ADR BANK BIT

                          DG007 BSF STATUS,
    RP0;
SET RBANK1 BSF T;
SET INPUT PIN CLRF STATUS;
SET RBANK0 CALL DG017;
WAIT INPUT CMD BTFSS DB1, 7;
CMD, 7 = 0 ? GOTO DG009;
Y,
    RD / WR CMD

             BTFSC DB1,
    6;
SET PC ? RETURN;
Y, POP BREAK RET STACK BTFSS DB1, 5;
C nnnn ? GOTO $ + 5;
N, SKIP CALL DBGF;
Y, CALL USER nnnn ADR MOVWF DB0;
SAVE USER - W MOVLW 0FFH;
W = 0FFH INDICATES CALL - RET GOTO DBUG;
AND INIT RET - QUERY MOVLW DBN BTFSC DB1, 4;
SEND DBN SPEED ? GOTO DG016;
Y, SEND DBN VALUE

    ;
RETURN FROM BREAKPOINT TO USER_MAIN

    MOVF DB5,
    W;
BREAK RET MOVWF PCLATH DG008 MOVF DB3, W MOVWF FSR;
RESTORE USER_FSR MOVF DB4, W MOVWF INTCON;
RESTORE USER_INTCON MOVF DB2, W MOVWF STATUS;
RESTORE USER_STATUS SWAPF DB0 SWAPF DB0, W;
RESTORE USER_W RETURN;
RETURN FROM BREAKPOINT

    DBGF CALL DG017;
READ PCH MOVF DB1, W MOVWF DB0 CALL DG017;
READ PCL CALL DG008 MOVWF PCLATH;
USER PCLATH AND W->LOST SWAPF DB1 SWAPF DB1, W;
SET PC = nnnn MOVWF PCL;
GOTO USER nnnn ADR

    ;
COMMAND PARSER

    DG009 BTFSC DB1,
    4 BTFSS DB1, 5;
CMD, 54 = 11 ? GOTO DG010;
N, CONT

       CALL DG017;
WAIT INS - EEADR TO READ IF DBEE;
INCLUDE IF EEPROM RD - CMD WANTED IFDEF EECON1;
INCLUDE IF EEPROM EXIST BANKSEL EEADR;
SET EEADR / DATA BANK MOVF EEADR, W MOVWF FSR;
SAVE USER - EEADR->FSR MOVF DB1, W MOVWF EEADR;
SET INS - EEADR MOVF EEDATA, W MOVWF DB1;
SAVE USER - EEDATA->DB1 BANKSEL EECON1;
SET EECON1 BANK MOVF EECON1, W;
SAVE USER - EECON1->W BCF EECON1, 7;
SEL EEPROM - DATA BSF EECON1, 0;
SET EEPROM RD - BIT MOVWF EECON1;
RESTORE USER - EECON1 BANKSEL EEADR;
SET EE - ADR / DATA BANK MOVF EEDATA, W;
READ INS - EEDATA->W XORWF DB1 XORWF DB1, W;
W <->DB1 XORWF DB1 MOVWF EEDATA;
RESTORE USER - EEDATA MOVF FSR, W MOVWF EEADR;
RESTORE USER - EEADR CLRF STATUS;
SEL BANK0 ENDIF ENDIF GOTO DG001;
OUTPUT INS - EEDATA

                 DG010 MOVF DB1,
    W MOVWF FSR;
SAVE CMD->FSR MOVLW DB0 BTFSC DB1, 4;
IF W SELECTED BY CMD GOTO DG014;
POINT TO W_TMP BTFSC DB1, 5;
IF STATUS SELECTED BY CMD GOTO DG011;
POINT TO STATUS_TMP

    CALL DG017;
ELSE,
    WAIT INPUT ADR->DB1

        MOVLW 7FH ANDWF DB1,
    W XORLW STATUS;
IF ADR = > STATUS BTFSS STATUS, Z GOTO $ + 3 DG011 MOVLW DB2;
SET STATUS_TMP_ADR GOTO DG014 XORLW FSR ^ STATUS;
IF ADR = > FSR BTFSS STATUS, Z GOTO $ + 3 MOVLW DB3;
SET FSR_TMP_ADR GOTO DG014 XORLW INTCON ^ FSR;
IF ADR = > INTCON BTFSS STATUS, Z GOTO $ + 3 MOVLW DB4;
SET INTCON_TMP_ADR GOTO DG014 XORLW PCLATH ^ INTCON;
IF ADR = > PCLATH BTFSS STATUS, Z GOTO $ + 3 MOVLW DB5;
SET PCLATH_TMP_ADR GOTO DG014

        XORLW DB0 ^
    PCLATH;
IF ADR = > DB0 BTFSC STATUS, Z GOTO DG012;
SKIP DB0

    BTFSS FSR,
    0;
INS - ADRH = BANK0 ? BTFSC DB1, 7 GOTO DG013;
N,
    EDIT ANY ADR

            XORLW DB2 ^
        DB0 BTFSS STATUS,
    Z;
ADR = DB2 ? XORLW DB3 ^ DB2 BTFSS STATUS, Z;
ADR = DB3 ? XORLW DB4 ^ DB3 BTFSS STATUS, Z;
ADR = DB4 ? XORLW DB5 ^ DB4 DG012 MOVLW DB1 BTFSS STATUS, Z;
ADR = DB5 ? DG013 MOVF DB1, W;
INS - ADR->W BTFSC FSR, 0 BSF STATUS, IRP;
SET INS - ADRH

              DG014 BTFSS FSR,
    6;
CMD, 6 = 1 ? GOTO DG015;
N->RD CMD, ANY ADR MOVWF FSR;
Y->WR CMD, SET INS - ADR CALL DG017;
WAIT INPUT INS - DATA MOVF DB1, W MOVWF INDF;
WRITE DATA GOTO DG007;
GOTO INPUT CMD DG015 MOVWF FSR;
SET INS - ADR MOVF INDF, W;
READ DATA DG016 MOVWF DB1 GOTO DG001;
OUTPUT READ DATA

    ;
RECEIVE DATA;
START | '1' < ---- > 512cyc '0' < -- > 256cyc;
___ 512 __ D1 ____ D3 ____ D5 ____ D7 ______;
| ____ | D0 | ____ | D2 | __ | D4 | __ | D6 | __ |

    DG017 CLRF DB1;
INIT DBUG BYTE DB1 CLRWDT BTFSC X;
WAIT '0' SYNC GOTO $ - 2 GOTO DG019

                           DG018 CLRW CLRWDT ADDLW 1 BTFSC X;
WAIT '0' GOTO $ - 3;
COUNT WIDTH ADDLW .256 - .78 / DBN;
DATABIT = C RRF DB1 DG019 CLRW CLRWDT ADDLW 1 BTFSS X;
WAIT '1' GOTO $ - 3;
COUNT WIDTH ADDLW .256 - .78 / DBN;
DATABIT = C RRF DB1 BTFSS STATUS, C;
CONTINUE UNTIL 8Bit RECEIVED GOTO DG018 RETURN

    DBUG MOVWF DB1;
SHOW BREAK NUMBER MOVF STATUS, W CLRF STATUS;
SET RBANK0 MOVWF DB2;
SAVE USER_STATUS MOVF PCLATH, W DBGX MOVWF DB5;
SAVE USER_PCLATH MOVF INTCON, W GOTO DBGY

                                  ENDIF

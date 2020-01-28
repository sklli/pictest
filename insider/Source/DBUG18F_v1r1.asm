;
*******************************************************;
DBUG18F : ---DEBUG INSIDER-- TARGET ROUTINE VR 1.1;
ATANASIOS MELIMOPOULOS(pic.insider @gmail.com)

    ;
**************PLACE DEBUG ON / OFF MACRO AT USER - PROG -
    START

        DBRK EQU 1;
SET BREAKPOINTS - DEBUG ON / OFF 1 /
                      0 noexpand

                          BREAK MACRO bkn;
BREAKPOINT MACRO DEF IF DBRK == 1 MOVFF WREG, DB0 MOVLW bkn CALL DBUG ENDIF ENDM

    ;
**************PLACE AT BREAKPOINT ADR :

    BREAK nn;
BREAKPOINT NUMBER : 00H - 0FFH

    ;
**************REPLACE DBUG LABEL / VAR NAMES IF USED BY THE USER - PROG;
**************PLACE DBUG - DATA - ADR - GROUP AT ANY SPARE ADR - BANK;
**************PLACE THE FOLLOWING CODE AT THE END OF THE USER - PROG

                                                                    IF DBRK ==
    1;
DBUG18F : --DEBUG INSIDER-- TARGET ROUTINE VR 1.1 T DB0 EQU 0F7FH;
DEBUG BYTE 0 --W_TMP DB1 EQU 0F7EH;
DEBUG BYTE 1 --INTCON_TMP DB2 EQU 0F7DH;
DEBUG BYTE 2 --STATUS_TMP DB3 EQU 0F7CH;
DEBUG BYTE 3 --FSR0L_TMP DB4 EQU 0F7BH;
DEBUG BYTE 4 --FSR0H_TMP DB5 EQU 0F7AH;
DEBUG BYTE 5 --TMP

    ;
**************USER - PROG DEBUG PIN / PORT INITIALIZED FOR DIGITAL I /
                         O
#DEFINE X PORTD, 2; DEBUG PORT-- USER SELECTED CPU PORT - REG - PIN
#DEFINE T TRISD, 2; TRIS REG NAME-- USER SELECTED CPU TRIS - REG - PIN
                             DBN EQU .1;
SPEED MULTIPLIER : 1x, 2x, 4x, 8x,
    16x

        ORG 0x10000 -
        .378;
USER SELECTED END_PROG_MEM - DBUG(BYTES);
CHECK CPU TYPE - BE CAREFUL WITH CONFIG - BYTES AT THE END OF PROG -
    MEM

        DBUG MOVFF INTCON,
    DB1;
SAVE USER_INTCON BCF INTCON, GIE;
INT OFF MOVFF STATUS, DB2;
SAVE USER_STATUS MOVFF FSR0L, DB3;
SAVE FSR0HL MOVFF FSR0H, DB4

    ;
TRANSMIT;
START | '1' < ---- > 512cyc '0' < -- > 256cyc;
___ 512 __ D1 ____ D3 ____ D5 ____ D7 ______;
| ____ | D0 | ____ | D2 | __ | D4 | __ | D6 | __ |

    DG001 MOVWF FSR0L;
TRANSMIT W->FSR0L BSF X BCF T;
SET OUTPUT PIN

    MOVLW .10 MOVWF FSR0H;
BIT COUNTER 8DATA RCALL DG003;
PAUSE WIDTH 256cyc RLCF FSR0L BRA DG005;
START LOW PULSE 512cyc

    DG002 RRCF FSR0L;
4xW + 7 CYC DELAY MOVLW .258 - .127 / DBN;
IF C = 1, DATA PULSE WIDTH = 512cyc BTFSS STATUS, C DG003 MOVLW .258 - .63 / DBN;
IF C = 0, DATA PULSE WIDTH = 256cyc CLRWDT ADDLW 1 BNZ $ -
                             4 RETURN

                                 DG004 RCALL DG002 DG005 BTG X CLRWDT DECFSZ FSR0H BRA DG004

    ;
WAIT COMMAND;
CMD .7654 = 11XX->QUIT SET PC G nnnnnn;
CMD .7654 = 101X->QUIT SET PC C nnnnnn;
CMD .7654 = 1001->SEND DBN SPEED;
CMD .7654 = 1000->QUIT BRK RET;
CMD .7654 = 01 --->WR CMD;
CMD .7654 = 00 --->RD CMD;
CMD .7654 = 0X00->POINT TO RAM DATA;
CMD .7654 = 0X01->POINT TO W_TMP;
CMD .7654 = 0X10->POINT TO STATUS_TMP;
CMD .7654 = 0X11->POINT TO EEPROM DATA;
CMD .3210 ------->HIGH DATA - ADR

                                  DG006 BSF T;
SET INPUT PIN RCALL DG024;
WAIT INPUT CMD BTFSS FSR0L, 7;
CMD, 7 = 0 ? BRA DG011;
Y, RD / WR CMD BTFSC FSR0L, 6;
G nnnnnn ? BRA DG009;
Y, SET RET - ADR BTFSS FSR0L, 5;
C ? BRA DG007;
N, SKIP RCALL DG008;
Y, CALL FUNCTION MOVFF WREG, DB0;
SAVE W_USER MOVLW 0FFH;
W = 0FFH INDICATES CALL - RET BRA DBUG;
FUNCTION - RET QUERY

               DG007 BTFSS FSR0L,
    4;
G ? BRA DG010;
Y, BRK - RET MOVLW DBN;
N,
    SEND SPEED MULTIPLIER BRA DG001

        DG008 INCF STKPTR DG009 MOVF FSR0L,
    W;
SET RET - ADR MOVWF TOSU;
SET PCU RCALL DG024;
WAIT PCH MOVF FSR0L, W MOVWF TOSH;
SET PCH RCALL DG024;
WAIT PCL BCF FSR0L, 0 MOVF FSR0L, W MOVWF TOSL;
SET PCL - EVEN

    ;
RETURN FROM BREAKPOINT TO USER_MAIN

    DG010 MOVFF DB0,
    WREG;
RESTORE USER_W MOVFF DB4, FSR0H;
RESTORE USER_FSR0 MOVFF DB3, FSR0L MOVFF DB2, STATUS;
RESTORE USER_STATUS MOVFF DB1, INTCON;
RESTORE USER_INTCON RETURN;
RETURN FROM BREAKPOINT

    ;
COMMAND PARSER

    DG011 MOVFF FSR0L,
    DB5;
SAVE CMD->DB5 BTFSC FSR0L, 4 BTFSS FSR0L, 5;
CMD, 54 = 11 ? BRA DG012;
N, CONT

       RCALL DG024;
WAIT INS - EEADR TO READ

               IFDEF EEADRH MOVFF EEADRH,
    FSR0H;
SAVE USER - EEADRH MOVFF DB5, EEADRH;
SET INS - EEADRH ELSE NOP NOP NOP NOP ENDIF MOVFF EEADR, DB5;
SAVE USER - EEADR MOVFF FSR0L, EEADR;
SET INS - EEADR MOVFF EEDATA, FSR0L;
SAVE USER - EEDATA MOVF EECON1, W;
SAVE USER - EECON1 BCF EECON1, 7;
SEL EEDATA - AREA BCF EECON1, 6 BSF EECON1, 0;
SET EEPROM RD - BIT MOVWF EECON1;
RESTORE USER - EECON1 IFDEF EEADRH MOVFF FSR0H, EEADRH;
RESTORE USER - EEADRH ELSE NOP NOP ENDIF MOVFF DB5, EEADR;
RESTORE USER - EEADR MOVF EEDATA, W;
READ INS - EEDATA MOVFF FSR0L, EEDATA;
RESTORE USER - EEDATA BRA DG001;
OUTPUT INS - EEDATA

                 DG012 BTFSC FSR0L,
    4;
W SELECTED BY CMD ? BRA DG013;
Y, SET W_TMP ADR BTFSC FSR0L, 5;
STATUS SELECTED BY CMD ? BRA DG015;
Y, SET STATUS_TMP ADR

       RCALL DG024;
ELSE,
    WAIT INPUT ADR->FSR0L

        MOVFF DB5,
    WREG XORLW HIGH WREG ANDLW 0FH;
SFR - BANK SELECTED ? BNZ DG019;
N,
    CHECK DB0 - DB4

                    MOVF FSR0L,
    W;
IF ADR = > WREG XORLW LOW WREG BNZ DG014 DG013 MOVLW LOW DB0;
SET WREG_TMP_ADR BRA DG021

        DG014 XORLW LOW STATUS ^
    LOW WREG;
IF ADR = > STATUS BNZ DG016 DG015 MOVLW LOW DB2;
SET STATUS_TMP_ADR BRA DG021

        DG016 XORLW LOW INTCON ^
    LOW STATUS;
IF ADR = > INTCON BNZ DG017 MOVLW LOW DB1;
SET INTCON_TMP_ADR BRA DG021

        DG017 XORLW LOW FSR0L ^
    LOW INTCON;
IF ADR = > FSR0L BNZ DG018 MOVLW LOW DB3;
SET FSR0L_TMP_ADR BRA DG021

        DG018 XORLW LOW FSR0H ^
    LOW FSR0L;
IF ADR = > FSR0H BNZ DG019 MOVLW LOW DB4;
SET FSR0H_TMP_ADR BRA DG021

    DG019 MOVFF DB5,
    WREG XORLW HIGH DB0;
INS - HIGH - ADR = HIGH(DB0 - DB4) ? ANDLW 0FH BNZ DG022;
N,
    SET ANY ADR

        MOVF FSR0L,
    W;
Y, CHECK DB0 - DB4 XORLW LOW DB0 BZ DG020;
SKIP ADR DB0

        XORLW LOW DB1 ^
    LOW DB0 BZ DG020;
SKIP ADR DB1

        XORLW LOW DB2 ^
    LOW DB1 BZ DG020;
SKIP ADR DB2

        XORLW LOW DB3 ^
    LOW DB2 BZ DG020;
SKIP ADR DB3

        XORLW LOW DB4 ^
    LOW DB3 BNZ DG022;
SET ANY - ADR

              DG020 MOVLW LOW DB5;
SET LOW ADR->FSR0L DG021 MOVWF FSR0L MOVFF DB5, WREG;
SET HIGH ADR->LOW DB5 ANDLW 0F0H IORLW HIGH DB5 MOVFF WREG,
    DB5

        DG022 MOVFF DB5,
    FSR0H;
SET HIGH ADR MOVFF DB5, WREG BTFSS WREG, 6;
CMD, 6 = 1 ? BRA DG023;
N->RD CMD MOVFF FSR0L, DB5;
SAVE LOW ADR RCALL DG024;
WAIT INPUT DATA MOVF FSR0L, W;
SET DATA TO WRITE MOVFF DB5, FSR0L;
SET LOW ADR MOVWF INDF0;
WRITE DATA BRA DG006;
GOTO INPUT CMD

    DG023 MOVF INDF0,
    W;
READ DATA BRA DG001;
OUTPUT READ DATA

    ;
RECEIVE DATA;
START | '1' < ---- > 512cyc '0' < -- > 256cyc;
___ 512 __ D1 ____ D3 ____ D5 ____ D7 ______;
| ____ | D0 | ____ | D2 | __ | D4 | __ | D6 | __ |

    DG024 CLRF FSR0L;
RECEIVE DBUG BYTE FSR0L CLRWDT BTFSC X;
WAIT '0' SYNC PULSE BRA $ - 4 BRA DG026

                                DG025 CLRF WREG;
INIT WIDTH COUNTER CLRWDT ADDLW 1 BTFSC X;
WAIT '0' BRA $ - 6;
COUNT WIDTH ADDLW .256 - .78 / DBN;
DATABIT = C RRCF FSR0L DG026 CLRF WREG;
INIT WIDTH COUNTER CLRWDT ADDLW 1 BTFSS X;
WAIT '1' BRA $ - 6;
COUNT WIDTH ADDLW .256 - .78 / DBN;
DATABIT = C RRCF FSR0L BNC DG025;
CONTINUE UNTIL 8Bit RECEIVED RETURN

    ENDIF

;*******************************************************
; DBUG16F1: -- DEBUG INSIDER -- TARGET ROUTINE VR 1.1
; ATANASIOS MELIMOPOULOS (pic.insider@gmail.com)
; 12F1xxx AND 16F1xxx ENHANCED SERIES < 2K PROG-WORDS

;************** PLACE DEBUG ON/OFF MACRO AT USER-PROG-START

DBRK	EQU	1	;SET BREAKPOINTS-DEBUG ON/OFF 1/0
DBEE	EQU	1	;SET EEPROM-READ-CMD   ON/OFF 1/0
 noexpand

BREAK	MACRO	bkn	;BREAKPOINT MACRO DEF
 IF DBRK==1
	MOVWF	DB0
	MOVLW	bkn
	CALL	DBUG
 ENDIF
	ENDM


;************** PLACE AT BREAKPOINT ADR:

	BREAK	nn	;BREAKPOINT NUMBER: 00H-0FFH


;************** REPLACE DBUG LABEL/VAR NAMES IF USED BY THE USER-PROG
;************** PLACE DBUG-DATA-ADR AT 16F1xxx UNUSED BANK-0 DATA AREA
;************** PLACE THE FOLLOWING CODE AT THE END OF THE USER-PROG

 IF DBRK==1	;DBUG16F1: -- DEBUG INSIDER -- TARGET ROUTINE VR 1.1

DB0	EQU	7FH	;DEBUG BYTE 0  -- W_TMP ------ COMMON ACCESS AREA
DB1	EQU	7EH	;DEBUG BYTE 1  -- DATA RX/TX - COMMON ACCESS AREA
DB2	EQU	7DH	;DEBUG BYTE 2  -- STATUS_TMP - COMMON ACCESS AREA
DB3	EQU	6FH	;DEBUG BYTE 3  -- FSR0L_TMP
DB4	EQU	6EH	;DEBUG BYTE 4  -- FSR0H_TMP
DB5	EQU	6DH	;DEBUG BYTE 5  -- INTCON_TMP
DB6	EQU	6CH	;DEBUG BYTE 6  -- BSR_TMP

;************** USER-PROG INITIALIZED DEBUG PIN/PORT FOR DIGITAL I/O
#DEFINE X	PORTA,1	;DEBUG PORT    -- USER SELECTED CPU PORT-REG-PIN
#DEFINE T	TRISA,1	;TRIS REG NAME -- USER SELECTED CPU TRIS-REG-PIN
DBN	EQU	.1	;SPEED MULTIPLIER: 1x, 2x, 4x, 8x, 16x

ENDPROG	EQU	800H	   ;USER SELECTED END-PROG-MEM - CHECK CPU TYPE -

	ORG	ENDPROG-.179
 IF DBEE
 IFDEF	EECON1
	ORG	ENDPROG-.198
 ENDIF
 ENDIF

DBUG	MOVWF	DB1		;SHOW BREAK NUMBER
	MOVF	STATUS,W
	MOVWF	DB2		;SAVE USER_STATUS
	MOVF	BSR,W
	MOVLB	0		;SET RBANK0
	MOVWF	DB6		;SAVE USER_BSR
	MOVF	INTCON,W
	BCF	INTCON,GIE	;INT OFF
	MOVWF	DB5		;SAVE USER_INTCON
	MOVF	FSR0H,W
	MOVWF	DB4		;SAVE USER_FSR0
	MOVF	FSR0L,W
	MOVWF	DB3

;TRANSMIT
;   START|    '1'<---->512cyc      '0'<-->256cyc
;___ 512  __ D1   ____ D3 ____ D5 ____ D7 ______
;   |____|D0|____|D2  |__|D4  |__|D6  |__|

DG001	BSF	X		;TRANSMIT DBUG BYTE DB1
	MOVLB	1		;SET HIGH OUTPUT LATCH, SET RBANK1
	BCF	T		;SET OUTPUT PIN
	MOVLB	0		;SET RBANK0

	MOVLW	.251
	MOVWF	FSR0H		;BIT COUNTER 8DATA
	CALL	DG003		;PAUSE WIDTH 256cyc
	RLF	DB1
	GOTO	DG006		;START LOW PULSE 512cyc

DG002	RRF	DB1		;4xW+7 CYC DELAY
	MOVLW	.258-.127/DBN	;IF C=1, DATA PULSE WIDTH=512cyc
	BTFSS	STATUS,C
DG003	MOVLW	.258-.63/DBN	;IF C=0, DATA PULSE WIDTH=256cyc
	ADDLW	1
	BTFSS	STATUS,Z
	GOTO	$-2
DG004	RETURN

DG005	CALL	DG002
DG006	BCF	X
	CALL	DG004		;4xNOP
	CALL	DG002
	BSF	X
	CLRWDT
	INCFSZ	FSR0H
	GOTO	DG005

;WAIT COMMAND
;CMD.7654 =11XX -> QUIT SET PC  G nnnnnn
;CMD.7654 =101X -> QUIT SET PC  C nnnnnn
;CMD.7654 =1001 -> SEND DBN SPEED
;CMD.7654 =1000 -> QUIT BRK RET
;CMD.7654 =01-- -> WR CMD
;CMD.7654 =00-- -> RD CMD
;CMD.7654 =0X00 -> POINT TO RAM DATA
;CMD.7654 =0X01 -> POINT TO W_TMP
;CMD.7654 =0X10 -> POINT TO STATUS_TMP
;CMD.7654 =0X11 -> POINT TO EEPROM DATA
;CMD.3210 ----- -> HIGH DATA-ADR

DG007	MOVLB	1		;SET RBANK1
	BSF	T		;SET INPUT PIN
	CALL	DG022		;WAIT INPUT CMD
	BTFSS	DB1,7		;CMD,7=0?
	GOTO	DG012		;Y, RD/WR CMD

	BTFSC	DB1,6		;G nnnnnn ?
	GOTO	DG010		;Y, SET RET-ADR
	BTFSS	DB1,5		;C nnnn?
	GOTO	DG008		;N, SKIP
	CALL	DG009		;Y, CALL USER nnnn ADR
	MOVWF	DB0		;SAVE USER-W
	MOVLW	0FFH		;W=0FFH INDICATES CALL-RET
	GOTO	DBUG		;AND INIT RET-QUERY

DG008	BTFSS	DB1,4		;G ?
	GOTO	DG011		;Y, BRK-RET
	MOVLW	DBN		;N, SEND DBN VALUE
	GOTO	DG021

DG009
	BANKSEL	STKPTR
	INCF	STKPTR		;SET RET-ADR
DG010	CALL	DG022		;WAIT PCH
	MOVF	DB1,W
	BANKSEL	TOSH
	MOVWF	TOSH
	CALL	DG022		;WAIT PCL
	MOVF	DB1,W
	BANKSEL	TOSL
	MOVWF	TOSL
	MOVLB	0

;RETURN FROM BREAKPOINT TO USER_MAIN

DG011	MOVF	DB3,W		;BREAK RET
	MOVWF	FSR0L		;RESTORE USER_FSR0
	MOVF	DB4,W
	MOVWF	FSR0H
	MOVF	DB5,W
	MOVWF	INTCON		;RESTORE USER_INTCON
	MOVF	DB6,W
	MOVWF	BSR		;RESTORE USER_BSR
	MOVF	DB2,W
	MOVWF	STATUS		;RESTORE USER_STATUS
	SWAPF	DB0
	SWAPF	DB0,W		;RESTORE USER_W
	RETURN			;RETURN FROM BREAKPOINT

;COMMAND PARSER

DG012	BTFSC	DB1,4
	BTFSS	DB1,5		;CMD,54=11?
	GOTO	DG013		;N, CONT

	CALL	DG022		;WAIT INS-EEADR TO READ
 IF DBEE			;INCLUDE IF EEPROM RD-CMD WANTED
 IFDEF	EECON1			;INCLUDE IF EEPROM EXIST
	BANKSEL	EECON1		;SET EEADR/DATA BANK
	MOVF	EEADRL,W
	MOVWF	FSR0L		;SAVE USER-EEADRL -> FSR0L
	MOVF	EEDATL,W
	MOVWF	FSR0H		;SAVE USER-EEDATL -> FSR0H
	MOVF	DB1,W
	MOVWF	EEADRL		;SET INS-EEADR
	MOVF	EECON1,W	;SAVE USER-EECON1 -> W
	BCF	EECON1,7	;SEL EEPROM-DATA
	BCF	EECON1,6
	BSF	EECON1,0	;SET EEPROM RD-BIT
	MOVWF	EECON1		;RESTORE USER-EECON1
	MOVF	EEDATL,W	;READ INS-EEDATA -> DB1
	MOVWF	DB1
	MOVF	FSR0H,W
	MOVWF	EEDATL		;RESTORE USER-EEDATA
	MOVF	FSR0L,W
	MOVWF	EEADRL		;RESTORE USER-EEADRL
	MOVLB	0		;SEL BANK0 
 ENDIF
 ENDIF
	GOTO	DG001		;OUTPUT INS-EEDATA

DG013	MOVF	DB1,W		;SAVE CMD -> FSR0L
	MOVWF	FSR0L
	ANDLW	0FH		;SET INS-ADRH
	MOVWF	FSR0H
	BTFSC	DB1,4		;IF W SELECTED BY CMD
	GOTO	DG014		;POINT TO W_TMP
	BTFSC	DB1,5		;IF STATUS SELECTED BY CMD
	GOTO	DG015		;POINT TO STATUS_TMP

	CALL	DG022		;ELSE, WAIT INPUT ADR -> DB1

	MOVLW	7FH
	ANDWF	DB1,W
	XORLW	LOW WREG		;IF ADR=>WREG
	BTFSS	STATUS,Z
	GOTO	$+3
DG014	MOVLW	LOW DB0		;SET WREG_TMP_ADR
	GOTO	DG016
	XORLW	LOW STATUS^LOW WREG	;IF ADR=>STATUS
	BTFSS	STATUS,Z
	GOTO	$+3
DG015	MOVLW	LOW DB2		;SET STATUS_TMP_ADR
	GOTO	DG016
	XORLW	LOW FSR0L^LOW STATUS	;IF ADR=>FSR0L
	BTFSS	STATUS,Z
	GOTO	$+3
	MOVLW	LOW DB3		;SET FSR0L_TMP_ADR
	GOTO	DG016
	XORLW	LOW FSR0H^LOW FSR0L	;IF ADR=>FSR0H
	BTFSS	STATUS,Z
	GOTO	$+3
	MOVLW	LOW DB4		;SET FSR0H_TMP_ADR
	GOTO	DG016
	XORLW	LOW INTCON^LOW FSR0H	;IF ADR=>INTCON
	BTFSS	STATUS,Z
	GOTO	$+3
	MOVLW	LOW DB5		;SET INTCON_TMP_ADR
	GOTO	DG016
	XORLW	LOW BSR^LOW INTCON	;IF ADR=>BSR
	BTFSS	STATUS,Z
	GOTO	$+4
	MOVLW	LOW DB6		;SET BSR_TMP_ADR
DG016	CLRF	FSR0H		;POINT BANK0
	GOTO	DG019

	XORLW	LOW DB0^LOW BSR		;IF ADR=>DB0
	BTFSS	STATUS,Z
	XORLW	LOW DB2^LOW DB0		;IF ADR=>DB2
	BTFSC	STATUS,Z
	GOTO	DG017			;SKIP

	MOVF	FSR0H
	BTFSC	STATUS,Z	;INS-ADRH=BANK0?
	BTFSC	DB1,7
	GOTO	DG018		;N, EDIT ANY BANK

	XORLW	LOW DB3^LOW DB2		;IF ADR=>DB3
	BTFSS	STATUS,Z
	XORLW	LOW DB4^LOW DB3		;IF ADR=>DB4
	BTFSS	STATUS,Z
	XORLW	LOW DB5^LOW DB4		;IF ADR=>DB5
	BTFSS	STATUS,Z
	XORLW	LOW DB6^LOW DB5		;IF ADR=>DB6
DG017	MOVLW	LOW DB1			;SKIP
	BTFSS	STATUS,Z
DG018	MOVF	DB1,W		;N, INS-ADR -> W

DG019	BTFSS	FSR0L,6		;CMD,6=1?
	GOTO	DG020		;N -> RD CMD, ANY ADR
	MOVWF	FSR0L		;Y -> WR CMD, SET INS-ADR
	CALL	DG022		;WAIT INPUT INS-DATA
	MOVF	DB1,W
	MOVWF	INDF0		;WRITE DATA
	GOTO	DG007		;GOTO INPUT CMD
DG020	MOVWF	FSR0L		;SET INS-ADR
	MOVF	INDF0,W		;READ DATA
DG021	MOVWF	DB1
	GOTO	DG001		;OUTPUT READ DATA

;RECEIVE DATA
;   START|    '1'<---->512cyc      '0'<-->256cyc
;___ 512  __ D1   ____ D3 ____ D5 ____ D7 ______
;   |____|D0|____|D2  |__|D4  |__|D6  |__|

DG022	MOVLB	0		;SET RBANK0
	CLRF	DB1		;INIT DBUG BYTE DB1
	CLRWDT
	BTFSC	X		;WAIT '0' SYNC
	GOTO	$-2
	GOTO	DG024

DG023	CLRW
	CLRWDT
	ADDLW	1
	BTFSC	X		;WAIT '0'
	GOTO	$-3		;COUNT WIDTH
	ADDLW	.256-.78/DBN	;DATABIT=C
	RRF	DB1
DG024	CLRW
	CLRWDT
	ADDLW	1
	BTFSS	X		;WAIT '1'
	GOTO	$-3		;COUNT WIDTH
	ADDLW	.256-.78/DBN	;DATABIT=C
	RRF	DB1
	BTFSS	STATUS,C	;CONTINUE UNTIL 8Bit RECEIVED
	GOTO	DG023
	RETURN

 ENDIF

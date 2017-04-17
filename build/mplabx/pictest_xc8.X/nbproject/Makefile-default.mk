#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../../lib/adc.c ../../../lib/delay.c ../../../lib/ds18b20.c ../../../lib/lcd44780.c ../../../lib/ser.c ../../../lib/softser.c ../../../lib/timer.c ../../../lib/uart.c ../../../src/pictest.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1386521430/adc.p1 ${OBJECTDIR}/_ext/1386521430/delay.p1 ${OBJECTDIR}/_ext/1386521430/ds18b20.p1 ${OBJECTDIR}/_ext/1386521430/lcd44780.p1 ${OBJECTDIR}/_ext/1386521430/ser.p1 ${OBJECTDIR}/_ext/1386521430/softser.p1 ${OBJECTDIR}/_ext/1386521430/timer.p1 ${OBJECTDIR}/_ext/1386521430/uart.p1 ${OBJECTDIR}/_ext/1386528437/pictest.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1386521430/adc.p1.d ${OBJECTDIR}/_ext/1386521430/delay.p1.d ${OBJECTDIR}/_ext/1386521430/ds18b20.p1.d ${OBJECTDIR}/_ext/1386521430/lcd44780.p1.d ${OBJECTDIR}/_ext/1386521430/ser.p1.d ${OBJECTDIR}/_ext/1386521430/softser.p1.d ${OBJECTDIR}/_ext/1386521430/timer.p1.d ${OBJECTDIR}/_ext/1386521430/uart.p1.d ${OBJECTDIR}/_ext/1386528437/pictest.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1386521430/adc.p1 ${OBJECTDIR}/_ext/1386521430/delay.p1 ${OBJECTDIR}/_ext/1386521430/ds18b20.p1 ${OBJECTDIR}/_ext/1386521430/lcd44780.p1 ${OBJECTDIR}/_ext/1386521430/ser.p1 ${OBJECTDIR}/_ext/1386521430/softser.p1 ${OBJECTDIR}/_ext/1386521430/timer.p1 ${OBJECTDIR}/_ext/1386521430/uart.p1 ${OBJECTDIR}/_ext/1386528437/pictest.p1

# Source Files
SOURCEFILES=../../../lib/adc.c ../../../lib/delay.c ../../../lib/ds18b20.c ../../../lib/lcd44780.c ../../../lib/ser.c ../../../lib/softser.c ../../../lib/timer.c ../../../lib/uart.c ../../../src/pictest.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16F876A
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1386521430/adc.p1: ../../../lib/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/adc.p1  ../../../lib/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/adc.d ${OBJECTDIR}/_ext/1386521430/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/delay.p1: ../../../lib/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/delay.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/delay.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/delay.p1  ../../../lib/delay.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/delay.d ${OBJECTDIR}/_ext/1386521430/delay.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/delay.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/ds18b20.p1: ../../../lib/ds18b20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/ds18b20.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/ds18b20.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/ds18b20.p1  ../../../lib/ds18b20.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/ds18b20.d ${OBJECTDIR}/_ext/1386521430/ds18b20.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/ds18b20.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/lcd44780.p1: ../../../lib/lcd44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/lcd44780.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/lcd44780.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/lcd44780.p1  ../../../lib/lcd44780.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/lcd44780.d ${OBJECTDIR}/_ext/1386521430/lcd44780.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/lcd44780.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/ser.p1: ../../../lib/ser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/ser.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/ser.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/ser.p1  ../../../lib/ser.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/ser.d ${OBJECTDIR}/_ext/1386521430/ser.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/ser.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/softser.p1: ../../../lib/softser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/softser.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/softser.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/softser.p1  ../../../lib/softser.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/softser.d ${OBJECTDIR}/_ext/1386521430/softser.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/softser.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/timer.p1: ../../../lib/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/timer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/timer.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/timer.p1  ../../../lib/timer.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/timer.d ${OBJECTDIR}/_ext/1386521430/timer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/timer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/uart.p1: ../../../lib/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/uart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/uart.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/uart.p1  ../../../lib/uart.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/uart.d ${OBJECTDIR}/_ext/1386521430/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386528437/pictest.p1: ../../../src/pictest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386528437" 
	@${RM} ${OBJECTDIR}/_ext/1386528437/pictest.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386528437/pictest.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386528437/pictest.p1  ../../../src/pictest.c 
	@-${MV} ${OBJECTDIR}/_ext/1386528437/pictest.d ${OBJECTDIR}/_ext/1386528437/pictest.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386528437/pictest.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1386521430/adc.p1: ../../../lib/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/adc.p1  ../../../lib/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/adc.d ${OBJECTDIR}/_ext/1386521430/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/delay.p1: ../../../lib/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/delay.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/delay.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/delay.p1  ../../../lib/delay.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/delay.d ${OBJECTDIR}/_ext/1386521430/delay.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/delay.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/ds18b20.p1: ../../../lib/ds18b20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/ds18b20.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/ds18b20.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/ds18b20.p1  ../../../lib/ds18b20.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/ds18b20.d ${OBJECTDIR}/_ext/1386521430/ds18b20.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/ds18b20.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/lcd44780.p1: ../../../lib/lcd44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/lcd44780.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/lcd44780.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/lcd44780.p1  ../../../lib/lcd44780.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/lcd44780.d ${OBJECTDIR}/_ext/1386521430/lcd44780.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/lcd44780.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/ser.p1: ../../../lib/ser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/ser.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/ser.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/ser.p1  ../../../lib/ser.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/ser.d ${OBJECTDIR}/_ext/1386521430/ser.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/ser.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/softser.p1: ../../../lib/softser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/softser.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/softser.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/softser.p1  ../../../lib/softser.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/softser.d ${OBJECTDIR}/_ext/1386521430/softser.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/softser.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/timer.p1: ../../../lib/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/timer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/timer.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/timer.p1  ../../../lib/timer.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/timer.d ${OBJECTDIR}/_ext/1386521430/timer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/timer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386521430/uart.p1: ../../../lib/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386521430" 
	@${RM} ${OBJECTDIR}/_ext/1386521430/uart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386521430/uart.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386521430/uart.p1  ../../../lib/uart.c 
	@-${MV} ${OBJECTDIR}/_ext/1386521430/uart.d ${OBJECTDIR}/_ext/1386521430/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386521430/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1386528437/pictest.p1: ../../../src/pictest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386528437" 
	@${RM} ${OBJECTDIR}/_ext/1386528437/pictest.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1386528437/pictest.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1386528437/pictest.p1  ../../../src/pictest.c 
	@-${MV} ${OBJECTDIR}/_ext/1386528437/pictest.d ${OBJECTDIR}/_ext/1386528437/pictest.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1386528437/pictest.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=none  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"        $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.map  --double=32 --float=24 --opt=default,+asm,-asmfile,-speed,+space,-debug --addrqual=ignore --mode=pro -DHAVE_UART=1 -D__DEBUG=1 -DUART_BAUD=38400 -DUSE_HD44780_LCD=1 -DUSE_SOFTSER=1 -DUSE_TIMER0=1 -DUSE_UART=1 -D_XTAL_FREQ=20000000 -D__16f876a=1 -P -N127 -I"../../.." -I"." -I"../../../lib" -I"../../../src" -V --warn=9 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,+osccal,+oscval:0,-resetbits,+download,-stackcall,+clib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/pictest_xc8.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
#include <pic18f25k22.h>
#include <stdint.h>

#define XTAL_FREQ 48000000

#pragma config PLLSEL = PLL3X    // 4x clock multiplier
#pragma config CFGPLLEN = OFF    // PLL Enabled
#pragma config CPUDIV = NOCLKDIV // CPU uses system clock (no divide)
#pragma config LS48MHZ = SYS48X8 // System clock at 48 MHz, USB clock divider is set to 8
#pragma config FOSC = INTOSCIO   // Internal oscillator
#pragma config PCLKEN = OFF      // Primary oscillator shutdown firmware controlled
#pragma config FCMEN = OFF       // Fail-Safe Clock Monitor disabled
#pragma config IESO = OFF        // Oscillator Switchover mode disabled
#pragma config nPWRTEN = OFF     // Power up timer disabled
#pragma config BOREN = OFF       // BOR disabled in hardware (SBOREN is ignored)
#pragma config BORV = 2V5        // BOR set to 2.5V nominal
#pragma config nLPBOR = OFF      // Low-Power Brown-out Reset disabled
#pragma config WDTEN = OFF       // WDT disabled in hardware (SWDTEN ignored)
#pragma config WDTPS = 32768     // Watchdog Timer Postscaler 1:32768
#pragma config CCP2MX = RB3      // CCP2 input/output is multiplexed with RB3
#pragma config PBADEN = OFF      // LATB<5:0> pins are configured as digital I/O on Reset
#pragma config T3CMX = RC0       // T3CKI function is on RC0
#pragma config SDOMX = RC7       // SDO function is on RC7
#pragma config MCLRE = ON        // MCLR pin enabled; RE3 input disabled
#pragma config STVREN = OFF      // Stack full/underflow will not cause Reset
#pragma config LVP = OFF         // Single-Supply ICSP disabled
#pragma config ICPRT = OFF       // ICPORT disabled
#pragma config XINST = OFF       // Instruction set extension and Indexed Addressing mode disabled
#pragma config CP0 = OFF         // Block 0 is not code-protected
#pragma config CP1 = OFF         // Block 1 is not code-protected
#pragma config CP2 = OFF         // Block 2 is not code-protected
#pragma config CP3 = OFF         // Block 3 is not code-protected
#pragma config CPB = OFF         // Boot block is not code-protected
#pragma config CPD = OFF         // Data EEPROM is not code-protected
#pragma config WRT0 = OFF        // Block 0 (0800-1FFFh) is not write-protected
#pragma config WRT1 = OFF        // Block 1 (2000-3FFFh) is not write-protected
#pragma config WRT2 = OFF        // Block 2 (04000-5FFFh) is not write-protected
#pragma config WRT3 = OFF        // Block 3 (06000-7FFFh) is not write-protected
#pragma config WRTC = OFF        // Configuration registers (300000-3000FFh) are not write-protected
#pragma config WRTB = OFF        // Boot block (0000-7FFh) is not write-protected
#pragma config WRTD = OFF        // Data EEPROM is not write-protected
#pragma config EBTR0 = OFF       // Block 0 is not protected from table reads executed in other blocks
#pragma config EBTR1 = OFF       // Block 1 is not protected from table reads executed in other blocks
#pragma config EBTR2 = OFF       // Block 2 is not protected from table reads executed in other blocks
#pragma config EBTR3 = OFF       // Block 3 is not protected from table reads executed in other blocks
#pragma config EBTRB = OFF       // Boot block is not protected from table reads executed in other blocks

#define TIMER0_TICKS (256 * 256)

volatile uint32_t bres;
volatile uint32_t seconds;

void
isr(void) __interrupt {
  if(TMR0IF) {

    bres += TIMER0_TICKS;

    if(bres >= XTAL_FREQ) {
      bres -= XTAL_FREQ;
      seconds++;
    }

    TMR0IF = 0;
  }
}

int
main() {
  bres = 0;
  seconds = 0;

  T0CONbits.T0CS = 0;
  T0CONbits.T0PS = 0b111;
  T0CONbits.PSA = 1;
  T0CONbits.T08BIT = 1;

  TMR0IE = 1;

  GIE = 1;
  PEIE = 1;

  TRISA4 = 0;

  for(;;) {
    LATA4 = seconds & 1;
  }
}

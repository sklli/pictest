/**
 * @file   adc.h
 * @author  Oleg Antonyan <oleg.b.antonyan@gmail.com>
 * @version 1.0
 *
 * @section LICENSE
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details at
 * http://www.gnu.org/copyleft/gpl.html
 *
 * @section DESCRIPTION
 *
 * ADC wrapper module
 */
#ifndef ADC_H_
#define ADC_H_

#ifndef HI_TECH_C
#include <stdint.h>
#endif


#define ADRES (((unsigned short)ADRESH << 8)|ADRESL)

/**
 * Enable ADC, start conversion and return data. Then disable ADC
 */
void adc_start(void);

/**
 * Disable ADC for sleep
 */
void adc_disable(void);

/**
 * ISR for ADC
 */
unsigned char adc_isr(void);

#endif /* ADC_H_ */

/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/


#include <CyLib.h>
#include "`$INSTANCE_NAME`_DMA_dma.h"

#ifndef _`$INSTANCE_NAME`_TLC_5940_PIXEL_H_
#define _`$INSTANCE_NAME`_TLC_5940_PIXEL_H_
    
    
    #ifndef _TLC_5940_PIXEL_DATA_T_
    #define _TLC_5940_PIXEL_DATA_T_
        typedef struct {
            uint8  dc[16];
            uint16 pwm[16];
        } TLC5940_data_t;
    #endif
    
    #define `$INSTANCE_NAME`_SHIFT_REG_FIFO  `$INSTANCE_NAME`_C_TLC5940_BitShifter_u0__16BIT_F0_REG
    #define `$INSTANCE_NAME`_DP_AUX_0  (* (reg8 *) `$INSTANCE_NAME`_C_TLC5940_BitShifter_u0__DP_AUX_CTL_REG)
    #define `$INSTANCE_NAME`_DP_AUX_1  (* (reg8 *) `$INSTANCE_NAME`_C_TLC5940_BitShifter_u1__DP_AUX_CTL_REG)
    
    #define `$INSTANCE_NAME`_CONTROL *(reg8*)`$INSTANCE_NAME`_C_TLC5940_ControlReg__CONTROL_REG

    /* DMA Configuration for DMA_1 */
    #define `$INSTANCE_NAME`_DMA_BYTES_PER_BURST 4
    #define `$INSTANCE_NAME`_DMA_REQUEST_PER_BURST 1
    #define `$INSTANCE_NAME`_DMA_SRC_BASE (CYDEV_SRAM_BASE)
    #define `$INSTANCE_NAME`_DMA_DST_BASE (CYDEV_PERIPH_BASE)
    #define `$INSTANCE_NAME`_numTD 12

    /* Variable declarations for DMA_1 */
    /* Move these variable declarations to the top of the function */
    uint8 `$INSTANCE_NAME`_DMA_Chan;
    uint8 `$INSTANCE_NAME`_DMA_TD[`$INSTANCE_NAME`_numTD];
    
    typedef struct {
        uint16 dc[4][8];
        uint16 pwm[4][16];
    } `$INSTANCE_NAME`_TLC5940_t;
    
    `$INSTANCE_NAME`_TLC5940_t `$INSTANCE_NAME`_PWM_data;
    
    void `$INSTANCE_NAME`_Start();
    void `$INSTANCE_NAME`_Disable();
    void `$INSTANCE_NAME`_Enable();
    void `$INSTANCE_NAME`_WriteRGB(uint16 red, uint16 green, uint16 blue);
    void `$INSTANCE_NAME`_WriteDC(uint8 dc);
    
    
    
#endif

/* [] END OF FILE */

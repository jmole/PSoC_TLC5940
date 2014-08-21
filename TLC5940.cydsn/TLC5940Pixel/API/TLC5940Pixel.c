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

#include "`$INSTANCE_NAME`_TLC5940Pixel.h"

void `$INSTANCE_NAME`_Start() {
    uint8* DMA_TD = (uint8*)`$INSTANCE_NAME`_DMA_TD;
    uint8 numTD = `$INSTANCE_NAME`_numTD;
    uint8* pwm_data_ptr = ((uint8*)&`$INSTANCE_NAME`_PWM_data) + 0x40;
    uint8* dc_data_ptr = (uint8*)&`$INSTANCE_NAME`_PWM_data;
    uint8 i,j,k;
    
    for (i=0; i<4; i++)
        for (j=0; j<8; j++)
            `$INSTANCE_NAME`_PWM_data.dc[i][j] = 0;
    for (i=0; i<4; i++)
        for (j=0; j<16; j++)
            `$INSTANCE_NAME`_PWM_data.pwm[i][j] = 0;
    
    uint8 interruptState;
    interruptState = CyEnterCriticalSection();
    *(reg8*)`$INSTANCE_NAME`_C_TLC5940_WordCounter__CONTROL_AUX_CTL_REG |= 0x20u;
    *(reg8*)`$INSTANCE_NAME`_C_TLC5940_BitCounter__CONTROL_AUX_CTL_REG |= 0x20u;
    *(reg8*)`$INSTANCE_NAME`_C_TLC5940_WordCounter__PERIOD_REG = 0x08;
    *(reg8*)`$INSTANCE_NAME`_C_TLC5940_gsclk_counter_GSCLKCounter_u0__D1_REG = 0x04;
    `$INSTANCE_NAME`_DP_AUX_0 |= 5;
    `$INSTANCE_NAME`_DP_AUX_1 |= 5;
    `$INSTANCE_NAME`_DP_AUX_0 &= ~0x01;
    `$INSTANCE_NAME`_DP_AUX_1 &= ~0x01;
    CyExitCriticalSection(interruptState);
    
    `$INSTANCE_NAME`_DMA_Chan = `$INSTANCE_NAME`_DMA_DmaInitialize(`$INSTANCE_NAME`_DMA_BYTES_PER_BURST, `$INSTANCE_NAME`_DMA_REQUEST_PER_BURST, 
        HI16(`$INSTANCE_NAME`_DMA_SRC_BASE), HI16(`$INSTANCE_NAME`_DMA_DST_BASE));
    
    for (i = 0; i < numTD; i++)
        DMA_TD[i] = CyDmaTdAllocate();
        
    for (i = 0; i < numTD; i++) {
        CyDmaTdSetConfiguration(DMA_TD[i], 16, DMA_TD[(i+1)%numTD], TD_TERMIN_EN | `$INSTANCE_NAME`_DMA__TD_TERMOUT_EN | TD_INC_SRC_ADR);
    }
    
    for (i = 0; i < 4; i++) {
        CyDmaTdSetAddress(DMA_TD[i*3], LO16((uint32)dc_data_ptr + i*16 ), LO16((uint32)`$INSTANCE_NAME`_SHIFT_REG_FIFO));
        CyDmaTdSetAddress(DMA_TD[i*3+1], LO16((uint32)pwm_data_ptr + i*32 ), LO16((uint32)`$INSTANCE_NAME`_SHIFT_REG_FIFO));
        CyDmaTdSetAddress(DMA_TD[i*3+2], LO16((uint32)pwm_data_ptr + i*32 + 16 ), LO16((uint32)`$INSTANCE_NAME`_SHIFT_REG_FIFO));
    }
    
    CyDmaChSetInitialTd(`$INSTANCE_NAME`_DMA_Chan, DMA_TD[0]);
    CyDmaChEnable(`$INSTANCE_NAME`_DMA_Chan, 1);   
}

void `$INSTANCE_NAME`_Disable() {
    `$INSTANCE_NAME`_CONTROL = 0x01;
    CyDmaChSetRequest(`$INSTANCE_NAME`_DMA_Chan,CY_DMA_CPU_TERM_CHAIN);
}

void `$INSTANCE_NAME`_Enable() {
    CyDmaChSetInitialTd(`$INSTANCE_NAME`_DMA_Chan, `$INSTANCE_NAME`_DMA_TD[0]);
    CyDmaChEnable(`$INSTANCE_NAME`_DMA_Chan, 1);
    `$INSTANCE_NAME`_CONTROL = 0x02;
}

void `$INSTANCE_NAME`_WriteRGB(uint16 red, uint16 green, uint16 blue) {
    uint16 r = (red >> 2);
    uint16 g = (green >> 2);
    uint16 b = (blue >> 2);
    uint8 rr = red < 4092 ? red - (r << 2) : 0;
    uint8 gg = green < 4092 ? green - (g << 2) : 0;
    uint8 bb = blue < 4092 ? blue - (b << 2) : 0;
    uint8 i,j;
    for (i=0; i<4; i++)
    {
        uint8 rp = rr > i ? 1: 0;
        uint8 gp = gg > i ? 1: 0;
        uint8 bp = bb > i ? 1: 0;
        for (j=0; j<12; j++) {
            switch(j%3) {
                case 0:
                    `$INSTANCE_NAME`_PWM_data.pwm[i][j+2] = r+rp;
                    break;
                case 1:
                    `$INSTANCE_NAME`_PWM_data.pwm[i][j+2] = g+gp;
                    break;
                case 2:
                    `$INSTANCE_NAME`_PWM_data.pwm[i][j+2] = b+bp;
                    break;
            }
        }
    }
}

void `$INSTANCE_NAME`_WriteDC(uint8 dc) {
    uint8 i,j;
    if (dc > 63)
        dc = 63;
    for (i=0; i<4; i++)
        for (j=0; j<8; j++)
            `$INSTANCE_NAME`_PWM_data.dc[i][j] = ( ((uint16)dc) << 6 ) | dc;
}



/* [] END OF FILE */

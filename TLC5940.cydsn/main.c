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
#include <project.h>


#define DP_AUX_0 (* (reg8 *) C_TLC5940_BitShifter_u0__DP_AUX_CTL_REG)
#define DP_AUX_1 (* (reg8 *) C_TLC5940_BitShifter_u1__DP_AUX_CTL_REG)


/* Variable declarations for DMA_1 */
/* Move these variable declarations to the top of the function */
uint8 DMA_Chan;
uint8 DMA_TD[3];

/* DMA Configuration for DMA_1 */
#define DMA_BYTES_PER_BURST 4
#define DMA_REQUEST_PER_BURST 1
#define DMA_SRC_BASE (CYDEV_SRAM_BASE)
#define DMA_DST_BASE (CYDEV_PERIPH_BASE)

void DMA_Setup(uint32 source, uint32 dest, uint16 length)
{
    DMA_Chan = DMA_DmaInitialize(DMA_BYTES_PER_BURST, DMA_REQUEST_PER_BURST, 
        HI16(DMA_SRC_BASE), HI16(DMA_DST_BASE));
    DMA_TD[0] = CyDmaTdAllocate();
    DMA_TD[1] = CyDmaTdAllocate();
    DMA_TD[2] = CyDmaTdAllocate();
    CyDmaTdSetConfiguration(DMA_TD[0], length, DMA_TD[1], TD_TERMIN_EN | DMA__TD_TERMOUT_EN | TD_INC_SRC_ADR);
    CyDmaTdSetConfiguration(DMA_TD[1], length, DMA_TD[2], TD_TERMIN_EN | DMA__TD_TERMOUT_EN | TD_INC_SRC_ADR);
    CyDmaTdSetConfiguration(DMA_TD[2], length, DMA_TD[0], TD_TERMIN_EN | DMA__TD_TERMOUT_EN | TD_INC_SRC_ADR);
    CyDmaTdSetAddress(DMA_TD[0], LO16((uint32)source ), LO16((uint32)dest));
    CyDmaTdSetAddress(DMA_TD[1], LO16((uint32)source + length), LO16((uint32)dest));
    CyDmaTdSetAddress(DMA_TD[2], LO16((uint32)source + length*2), LO16((uint32)dest));
    CyDmaChSetInitialTd(DMA_Chan, DMA_TD[0]);
    CyDmaChEnable(DMA_Chan, 1);   
}

typedef struct {
    uint16 dc[8];
    uint16 pwm[16];
} TLC5940_t;

int main()
{
    uint8 i,j;
    TLC5940_t led_data;
    for ( i = 0; i < 8; i++ )
    {
        led_data.dc[i] = 15 | (15 << 6);
    }
    for ( i = 0; i < 16; i++ )
    {
        led_data.pwm[i] = 255 * i;
    }
    
    uint8 interruptState;
    interruptState = CyEnterCriticalSection();
    *(reg8*)C_TLC5940_WordCounter__CONTROL_AUX_CTL_REG |= 0x20u;
    *(reg8*)C_TLC5940_BitCounter__CONTROL_AUX_CTL_REG |= 0x20u;
    DP_AUX_0 |= 5;
    DP_AUX_1 |= 5;
    DP_AUX_0 &= ~0x01;
    DP_AUX_1 &= ~0x01;
    
    CyExitCriticalSection(interruptState);
    
    DMA_Setup((uint32)(&led_data),(uint32)C_TLC5940_BitShifter_u0__16BIT_F0_REG,sizeof(uint16)*8);
    /* Place your initialization/startup code here (e.g. MyInst_Start()) */
    //CyDelay(1000);
    //RESET_Write(0);
    //START_Write(1);
    *(reg8*)C_TLC5940_ControlReg__CONTROL_REG = 0x02;
    /* CyGlobalIntEnable; */ /* Uncomment this line to enable global interrupts. */
    j = 0;
    for(;;)
    {
        for ( i = 0; i < 13; i++ )
        {
            led_data.pwm[i+2] = i == j ? 4095 : 0;
        }
        CyDelay(100);
        j = (j + 1 ) % 13;
        if (j == 0) {
            *(reg8*)C_TLC5940_ControlReg__CONTROL_REG = 0x01;
            CyDmaChSetRequest(DMA_Chan,CY_DMA_CPU_TERM_CHAIN);
            CyDelay(1000);
            CyDmaChSetInitialTd(DMA_Chan, DMA_TD[0]);
            CyDmaChEnable(DMA_Chan, 1);
            *(reg8*)C_TLC5940_ControlReg__CONTROL_REG = 0x02;
        }
    }
}

/* [] END OF FILE */

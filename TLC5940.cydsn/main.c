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


#define DP_AUX_0 (* (reg8 *) Controller_1_Datapath_1_u0__DP_AUX_CTL_REG)
#define DP_AUX_1 (* (reg8 *) Controller_1_Datapath_1_u1__DP_AUX_CTL_REG)


/* Variable declarations for DMA_1 */
/* Move these variable declarations to the top of the function */
uint8 DMA_1_Chan;
uint8 DMA_1_TD[1];

/* DMA Configuration for DMA_1 */
#define DMA_1_BYTES_PER_BURST 4
#define DMA_1_REQUEST_PER_BURST 1
#define DMA_1_SRC_BASE (CYDEV_SRAM_BASE)
#define DMA_1_DST_BASE (CYDEV_PERIPH_BASE)

void DMA_Setup(uint32 source, uint32 dest, uint16 length)
{
    DMA_1_Chan = DMA_1_DmaInitialize(DMA_1_BYTES_PER_BURST, DMA_1_REQUEST_PER_BURST, 
        HI16(DMA_1_SRC_BASE), HI16(DMA_1_DST_BASE));
    DMA_1_TD[0] = CyDmaTdAllocate();
    CyDmaTdSetConfiguration(DMA_1_TD[0], length, DMA_1_TD[0], TD_TERMIN_EN | DMA_1__TD_TERMOUT_EN | TD_INC_SRC_ADR);
    CyDmaTdSetAddress(DMA_1_TD[0], LO16((uint32)source), LO16((uint32)dest));
    CyDmaChSetInitialTd(DMA_1_Chan, DMA_1_TD[0]);
    CyDmaChEnable(DMA_1_Chan, 1);   
}

int main()
{
    uint16 the_data[16] = {0,1,2,4,8,16,32,64,128,256,512,1024,2048,1024,512,256};
    uint8 i;
    
    for (i=0; i<16; i++)
        the_data[i] = (uint16)1 << i;
    
    
    Count7_1_Start();
    uint8 interruptState;
    interruptState = CyEnterCriticalSection();
    *(reg8*)DMAController_1_Counter7Name__CONTROL_AUX_CTL_REG |= 0x20u;
    DP_AUX_0 |= 5;
    DP_AUX_1 |= 5;
    DP_AUX_0 &= ~0x01;
    DP_AUX_1 &= ~0x01;
    
    CyExitCriticalSection(interruptState);
    
    DMA_Setup((uint32)*(&the_data),(uint32)Controller_1_Datapath_1_u0__16BIT_F0_REG,32);
    /* Place your initialization/startup code here (e.g. MyInst_Start()) */
    //CyDelay(1000);
    RESET_Write(0);
    CyDelayCycles(300);
    RESET_Write(1);
    RESET_Write(0);
    /* CyGlobalIntEnable; */ /* Uncomment this line to enable global interrupts. */
    for(;;)
    {
        /* Place your application code here. */
    }
}

/* [] END OF FILE */

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


int main()
{
    uint16 i;
    TLC5940Pixel_Start();
    TLC5940Pixel_WriteDC(63);
    TLC5940Pixel_WriteRGB(0,0,0);
    TLC5940Pixel_Enable();
    i = 0;
    for(;;)
    {
        TLC5940Pixel_WriteRGB(i,i,i);
        CyDelay(1);
        i = (i+1)%4096;
        
    }
}

/* [] END OF FILE */

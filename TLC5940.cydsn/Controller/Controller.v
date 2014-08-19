/*******************************************************************************
* Description:
*  Verilog implementation autogenerated from ShiftReg.cyudb at 08/18/2014 19:23:35.
*
* Note:
*  This module definition will automatically be incorporated during the "HDL Generation"
*  phase of a design which uses this UDB document. 
*  Alternatively, the contents of this pane may be copied and used as a starting point
*  for a verilog component implementation. The Datapath Configuration Tool may be used
*  to adjust advanced datapath parameters (accessible from the Tools menu).
*  For more details, see the Component Author Guide and Technical Reference Manuals.
*  Both can be accessed by selecting Help -> Documentation.
*******************************************************************************/

`include "cypress.v"
/* ==================== Include Component Definitions ==================== */

module Controller (
    input wire clock, 
    input wire shift_nload, 
    input wire loadD0, 
    input wire nENABLE, 
    output wire shift_out, 
    output wire fifo_not_full, 
    output wire fifo_empty
);

/* ==================== Wire and Register Declarations ==================== */
wire shift_out_dp;
wire fifo_has_room;
wire fifoempty;
wire Datapath_1_d0_load;
wire Datapath_1_d1_load;
wire Datapath_1_f0_load;
wire Datapath_1_f1_load;
wire Datapath_1_route_si;
wire Datapath_1_route_ci;
wire  [2:0] Datapath_1_select;

/* ==================== Assignment of Combinatorial Variables ==================== */
assign shift_out = (shift_out_dp);
assign fifo_not_full = (fifo_has_room);
assign fifo_empty = (fifoempty);
assign Datapath_1_d0_load = (loadD0);
assign Datapath_1_d1_load = (1'b0);
assign Datapath_1_f0_load = (1'b0);
assign Datapath_1_f1_load = (1'b0);
assign Datapath_1_route_si = (1'b0);
assign Datapath_1_route_ci = (1'b0);
assign Datapath_1_select[0] = (shift_nload);
assign Datapath_1_select[1] = (nENABLE);
assign Datapath_1_select[2] = (1'b0);

/* ==================== Datapath_1 (Width: 16) Instantiation ==================== */
parameter Datapath_1_dpconfig0 = 
{
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP___SR, `CS_A0_SRC___D0, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGB, `CS_CMP_SEL_CFGA,  /*CFGRAM0:  Load A0 from D0, do last bit shift */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP___SR, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGB, `CS_CMP_SEL_CFGA,  /*CFGRAM1:  Shift A0 right */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM2:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM3:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM4:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM5:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM6:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM7:   */
    8'hFF, 8'h00, /*CFG9:  CFG9 */
    8'hFF, 8'hFF, /*CFG11-10:  CFG11-10 */
    `SC_CMPB_A1_D1, `SC_CMPA_A0_D1, `SC_CI_B_ARITH, `SC_CI_A_ARITH, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL, `SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_CHAIN, `SC_SI_A_ROUTE, /*CFG13-12: */ 
    `SC_A0_SRC_ACC, `SC_SHIFT_SR, 1'h0, 1'h0, `SC_FIFO1_BUS, `SC_FIFO0_BUS, `SC_MSB_DSBL, `SC_MSB_BIT0, `SC_MSB_NOCHN, `SC_FB_NOCHN, `SC_CMP1_NOCHN, `SC_CMP0_NOCHN, /*CFG15-14:  CFG15-14 */
    3'h00, `SC_FIFO_SYNC__ADD, 2'h00, `SC_FIFO1_DYN_OF, `SC_FIFO0_DYN_OF, `SC_FIFO_CLK1_POS, `SC_FIFO_CLK0_POS, `SC_FIFO_CLK__DP, `SC_FIFO_CAP_AX, `SC_FIFO_LEVEL, `SC_FIFO__SYNC, `SC_EXTCRC_DSBL, `SC_WRK16CAT_DSBL /*CFG17-16:  CFG17-16 */
};
parameter Datapath_1_dpconfig1 = 
{
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP___SR, `CS_A0_SRC___D0, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGB, `CS_CMP_SEL_CFGA,  /*CFGRAM0:  Load A0 from D0, do last bit shift */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP___SR, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGB, `CS_CMP_SEL_CFGA,  /*CFGRAM1:  Shift A0 right */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM2:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM3:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM4:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM5:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM6:   */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM7:   */
    8'hFF, 8'h00, /*CFG9:  CFG9 */
    8'hFF, 8'hFF, /*CFG11-10:  CFG11-10 */
    `SC_CMPB_A1_D1, `SC_CMPA_A0_D1, `SC_CI_B_CHAIN, `SC_CI_A_CHAIN, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL, `SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_DEFSI, `SC_SI_A_DEFSI, /*CFG13-12: */ 
    `SC_A0_SRC_ACC, `SC_SHIFT_SR, 1'h0, 1'h0, `SC_FIFO1_BUS, `SC_FIFO0_BUS, `SC_MSB_DSBL, `SC_MSB_BIT0, `SC_MSB_NOCHN, `SC_FB_CHNED, `SC_CMP1_CHNED, `SC_CMP0_CHNED, /*CFG15-14:  CFG15-14 */
    3'h00, `SC_FIFO_SYNC__ADD, 2'h00, `SC_FIFO1_DYN_OF, `SC_FIFO0_DYN_OF, `SC_FIFO_CLK1_POS, `SC_FIFO_CLK0_POS, `SC_FIFO_CLK__DP, `SC_FIFO_CAP_AX, `SC_FIFO_LEVEL, `SC_FIFO__SYNC, `SC_EXTCRC_DSBL, `SC_WRK16CAT_DSBL /*CFG17-16:  CFG17-16 */
};
cy_psoc3_dp16 #(
    .cy_dpconfig_a( Datapath_1_dpconfig0 ), .cy_dpconfig_b( Datapath_1_dpconfig1 ),
    .d0_init_a( 8'b11111111 ), .d0_init_b( 8'b00000000 ),
    .d1_init_a( 8'b00000000 ), .d1_init_b( 8'b00000000 ),
    .a0_init_a( 8'b00000000 ), .a0_init_b( 8'b00000000 ),
    .a1_init_a( 8'b00000000 ), .a1_init_b( 8'b00000000 ))
    Datapath_1(
        .clk( clock ),
        .cs_addr( Datapath_1_select ),
        .route_si( Datapath_1_route_si ),
        .route_ci( Datapath_1_route_ci ),
        .f0_load( Datapath_1_f0_load ),
        .f1_load( Datapath_1_f1_load ),
        .d0_load( Datapath_1_d0_load ),
        .d1_load( Datapath_1_d1_load ),
        .ce0(  ), 
        .cl0(  ), 
        .z0(  ), 
        .ff0(  ), 
        .ce1(  ), 
        .cl1(  ), 
        .z1(  ), 
        .ff1(  ), 
        .ov_msb(  ), 
        .co_msb(  ), 
        .cmsb(  ), 
        .so( { Datapath_1_so_2, shift_out_dp } ), 
        .f0_bus_stat( { fifo_has_room, Datapath_1_f0_bus_stat_1 } ), 
        .f0_blk_stat( { fifoempty, Datapath_1_f0_blk_stat_1 } ), 
        .f1_bus_stat(  ), 
        .f1_blk_stat(  )
    );

endmodule


//`#start header` -- edit after this line, do not edit this line
// ========================================
//
// Copyright YOUR COMPANY, THE YEAR
// All Rights Reserved
// UNPUBLISHED, LICENSED SOFTWARE.
//
// CONFIDENTIAL AND PROPRIETARY INFORMATION
// WHICH IS THE PROPERTY OF your company.
//
// ========================================
`include "cypress.v"

module Counter4096 (
    input wire clock, 
    input wire reset, 
    output wire tc
);

parameter eight_bit_cycle_count = 16;

/* ==================== Wire and Register Declarations ==================== */
wire dec_A1;
wire done;
wire Datapath_1_d0_load;
wire Datapath_1_d1_load;
wire Datapath_1_f0_load;
wire Datapath_1_f1_load;
wire Datapath_1_route_si;
wire Datapath_1_route_ci;
wire  [2:0] Datapath_1_select; 

/* ==================== Assignment of Combinatorial Variables ==================== */
assign tc = (done);
assign Datapath_1_d0_load = (1'b0);
assign Datapath_1_d1_load = (1'b0);
assign Datapath_1_f0_load = (1'b0);
assign Datapath_1_f1_load = (1'b0);
assign Datapath_1_route_si = (1'b0);
assign Datapath_1_route_ci = (1'b0);
assign Datapath_1_select[0] = (dec_A1);
assign Datapath_1_select[1] = (done);
assign Datapath_1_select[2] = (reset);

/* ==================== Datapath_1 (Width: 8) Instantiation ==================== */
parameter Datapath_1_dpconfig0 = 
{
    `CS_ALU_OP__INC, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM0:  */
    `CS_ALU_OP__DEC, `CS_SRCA_A1, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC___D0, `CS_A1_SRC__ALU, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM1:  */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM2:  */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM3:  */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_A0, `CS_SHFT_OP_PASS, `CS_A0_SRC___D0, `CS_A1_SRC___D1, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM4: reset */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC___D0, `CS_A1_SRC___D1, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM5:  */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC___D0, `CS_A1_SRC___D1, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM6:  */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC___D0, `CS_A1_SRC___D1, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM7:  */
    8'hFF, 8'h00, /* CFG9 */
    8'hFF, 8'hFF, /* CFG11-10 */
    `SC_CMPB_A1_D1, `SC_CMPA_A0_D1, `SC_CI_B_ARITH, `SC_CI_A_ARITH, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL, `SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_DEFSI, `SC_SI_A_DEFSI, 
    `SC_A0_SRC_ACC, `SC_SHIFT_SL, 1'b0, 1'b0, `SC_FIFO1_BUS, `SC_FIFO0_BUS, `SC_MSB_ENBL, `SC_MSB_BIT0, `SC_MSB_NOCHN, `SC_FB_NOCHN, `SC_CMP1_NOCHN, `SC_CMP0_NOCHN, /* CFG15-14 */
    3'b000, `SC_FIFO_SYNC__ADD, 2'b000, `SC_FIFO1_DYN_OF, `SC_FIFO0_DYN_OF, `SC_FIFO_CLK1_POS, `SC_FIFO_CLK0_POS, `SC_FIFO_CLK__DP, `SC_FIFO_CAP_AX, `SC_FIFO_LEVEL, `SC_FIFO__SYNC, `SC_EXTCRC_DSBL, `SC_WRK16CAT_DSBL /* CFG17-16 */
};
cy_psoc3_dp8 #(
    .cy_dpconfig_a( Datapath_1_dpconfig0 ),
    .d0_init_a( 8'b00000001 ),
    .d1_init_a( eight_bit_cycle_count ),
    .a0_init_a( 8'b00000000 ),
    .a1_init_a( 8'b00000000 ))
    GSCLKCounter(
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
        .z0( dec_A1 ), 
        .ff0(  ), 
        .ce1(  ), 
        .cl1(  ), 
        .z1( done ), 
        .ff1(  ), 
        .ov_msb(  ), 
        .co_msb(  ), 
        .cmsb(  ), 
        .so(  ), 
        .f0_bus_stat(  ), 
        .f0_blk_stat(  ), 
        .f1_bus_stat(  ), 
        .f1_blk_stat(  )
    );

endmodule

//`#end` -- edit above this line, do not edit this line
// Generated on 08/18/2014 at 14:09
// Component: C_TLC5940
module C_TLC5940 (
	output wire active,
	output wire DMAReq,
    output wire loadD0withF0,
    output wire shift_nLOAD,
    output wire SCLK,
    output wire SDATA,
    output reg  xlat,
    output reg  vprg,
    output reg  blank,
    output wire gsclk,
	input   CLK,
	input   nrq
);

//`#start body` -- edit after this line, do not edit this line

parameter  num_devices = 1;
localparam word_count = 8*num_devices;
localparam dma_clock_cycles = 10;
localparam dma_word_timer_count = dma_clock_cycles - word_count < 1 ? 1 : dma_clock_cycles - word_count;

wire fifo_has_room;
reg  start_dma;
reg  enable_all;
reg sclk_extra_pulse;



reg dma_req;
always @ (negedge CLK) begin
    dma_req <= start_dma & fifo_has_room;    
end

assign DMAReq = dma_req;

reg dma_nrq;
always @ (posedge CLK) begin
    dma_nrq <= nrq;    
end

//////////////////////////////////////////////////////////////////////////////////////////
// 
// Control Register

wire [7:0] control_reg;
wire reset = control_reg[0];
wire enable = control_reg[1];
cy_psoc3_control #(.cy_init_value (8'b00000001), .cy_force_order(`TRUE))
ControlReg(
/* output [07:00] */ .control(control_reg)
);


//////////////////////////////////////////////////////////////////////////////////////////
// 
// Bit Counter

wire [6:0] bit_counter_output;
wire bit_counter_tc;

//
// cy_period is number of bits per word - 1
//
cy_psoc3_count7 #(.cy_period(11), .cy_route_ld(`FALSE), .cy_route_en(`TRUE)) 
BitCounter (
/* input */ .clock (CLK), // Clock
/* input */ .reset(1'b0), // Reset
/* input */ .load(1'b0), // Load signal used if cy_route_ld = TRUE
/* input */ .enable(enable_all), // Enable signal used if cy_route_en = TRUE
/* output [6:0] */ .count(bit_counter_output), // Counter value output
/* output */ .tc(bit_counter_tc) // Terminal Count output
);

reg nbit_counter_tc_delay;
always @ (posedge CLK) begin
    nbit_counter_tc_delay <= ~bit_counter_tc;
end

assign loadD0withF0 = bit_counter_tc;
assign shift_nLOAD = nbit_counter_tc_delay;


//////////////////////////////////////////////////////////////////////////////////////////
// 
// Delay for output bit clock to synchronize with datapath loads and shifts
//

reg OutClkDelay;
always @ (posedge CLK) begin
    OutClkDelay <= bit_counter_tc;
end

reg OutClkEnable;
always @ (posedge OutClkDelay) begin
    OutClkEnable <= enable_all;
end

assign SCLK = (~CLK & OutClkEnable) | sclk_extra_pulse;


//////////////////////////////////////////////////////////////////////////////////////////
// 
// Counter for total number of words transmitted. 
//
// Also used for a brief delay to ensure that the FIFOs are filled by DMA before
// we start sending data.
// 

reg counter_reset;
reg dma_delay;
wire [6:0] word_counter_output;
wire word_counter_tc;
wire enable_counter = dma_delay | bit_counter_tc;


//
// cy_period is total number of words transmitted per cycle (equal to DMA bytes/2)
//
cy_psoc3_count7 #(.cy_period(word_count), .cy_route_ld(`FALSE), .cy_route_en(`TRUE)) 
WordCounter (
/* input */ .clock (CLK), // Clock
/* input */ .reset(counter_reset), // Reset
/* input */ .load(1'b0), // Load signal used if cy_route_ld = TRUE
/* input */ .enable(enable_counter), // Enable signal used if cy_route_en = TRUE
/* output [6:0] */ .count(word_counter_output), // Counter value output
/* output */ .tc(word_counter_tc) // Terminal Count output
);


//////////////////////////////////////////////////////////////////////////////////////////
// 
// Datapath instance for loading words from the FIFO and shifting them out
//
// 
//


/* ==================== Wire and Register Declarations ==================== */
wire shift_out_dp;
//wire fifoempty;
wire Datapath_1_d0_load;
wire Datapath_1_d1_load;
wire Datapath_1_f0_load;
wire Datapath_1_f1_load;
wire Datapath_1_route_si;
wire Datapath_1_route_ci;
wire  [2:0] Datapath_1_select;

/* ==================== Assignment of Combinatorial Variables ==================== */
assign SDATA = (shift_out_dp);
assign Datapath_1_d0_load = (loadD0withF0);
assign Datapath_1_d1_load = (1'b0);
assign Datapath_1_f0_load = (1'b0);
assign Datapath_1_f1_load = (1'b0);
assign Datapath_1_route_si = (1'b0);
assign Datapath_1_route_ci = (1'b0);
assign Datapath_1_select[0] = (shift_nLOAD);
assign Datapath_1_select[1] = (~enable_all);
assign Datapath_1_select[2] = (1'b0);

/* ==================== Datapath_1 (Width: 16) Instantiation ==================== */
parameter Datapath_1_dpconfig0 = 
{
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP___SL, `CS_A0_SRC___D0, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGB, `CS_CMP_SEL_CFGA,  /*CFGRAM0:   Load A0 from D0, do last bit shift */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP___SL, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGB, `CS_CMP_SEL_CFGA,  /*CFGRAM1:   Shift A0 left*/
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM2:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM3:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM4:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM5:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM6:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM7:    */
    8'hFF, 8'h00, /*CFG9:   CFG9 */
    8'hFF, 8'hFF, /*CFG11-10:   CFG11-10 */
    `SC_CMPB_A1_D1, `SC_CMPA_A0_D1, `SC_CI_B_ARITH, `SC_CI_A_ARITH, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL, `SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_DEFSI, `SC_SI_A_DEFSI, /*CFG13-12:  */  
    `SC_A0_SRC_ACC, `SC_SHIFT_SL, 1'h0, 1'h0, `SC_FIFO1_BUS, `SC_FIFO0_BUS, `SC_MSB_DSBL, `SC_MSB_BIT0, `SC_MSB_CHNED, `SC_FB_NOCHN, `SC_CMP1_NOCHN, `SC_CMP0_NOCHN, /*CFG15-14:   CFG15-14 */
    3'h00, `SC_FIFO_SYNC__ADD, 2'h00, `SC_FIFO1_DYN_OF, `SC_FIFO0_DYN_OF, `SC_FIFO_CLK1_POS, `SC_FIFO_CLK0_POS, `SC_FIFO_CLK__DP, `SC_FIFO_CAP_AX, `SC_FIFO_LEVEL, `SC_FIFO__SYNC, `SC_EXTCRC_DSBL, `SC_WRK16CAT_DSBL /*CFG17-16:   CFG17-16 */
};
parameter Datapath_1_dpconfig1 = 
{
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP___SL, `CS_A0_SRC___D0, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGB, `CS_CMP_SEL_CFGA,  /*CFGRAM0:   Load A0 from D0, do last bit shift */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP___SL, `CS_A0_SRC__ALU, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGB, `CS_CMP_SEL_CFGA,  /*CFGRAM1:   Shift A0 left*/
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM2:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM3:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM4:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM5:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM6:    */
    `CS_ALU_OP_PASS, `CS_SRCA_A0, `CS_SRCB_D0, `CS_SHFT_OP_PASS, `CS_A0_SRC_NONE, `CS_A1_SRC_NONE, `CS_FEEDBACK_DSBL, `CS_CI_SEL_CFGA, `CS_SI_SEL_CFGA, `CS_CMP_SEL_CFGA,  /*CFGRAM7:    */
    8'hFF, 8'h00, /*CFG9:   CFG9 */
    8'hFF, 8'hFF, /*CFG11-10:   CFG11-10 */
    `SC_CMPB_A1_D1, `SC_CMPA_A0_D1, `SC_CI_B_CHAIN, `SC_CI_A_CHAIN, `SC_C1_MASK_DSBL, `SC_C0_MASK_DSBL, `SC_A_MASK_DSBL, `SC_DEF_SI_0, `SC_SI_B_CHAIN, `SC_SI_A_CHAIN, /*CFG13-12:  */
    `SC_A0_SRC_ACC, `SC_SHIFT_SL, 1'h0, 1'h0, `SC_FIFO1_BUS, `SC_FIFO0_BUS, `SC_MSB_ENBL, `SC_MSB_BIT3, `SC_MSB_NOCHN, `SC_FB_CHNED, `SC_CMP1_CHNED, `SC_CMP0_CHNED, /*CFG15-14:   CFG15-14 */
    3'h00, `SC_FIFO_SYNC__ADD, 2'h00, `SC_FIFO1_DYN_OF, `SC_FIFO0_DYN_OF, `SC_FIFO_CLK1_POS, `SC_FIFO_CLK0_POS, `SC_FIFO_CLK__DP, `SC_FIFO_CAP_AX, `SC_FIFO_LEVEL, `SC_FIFO__SYNC, `SC_EXTCRC_DSBL, `SC_WRK16CAT_DSBL /*CFG17-16:   CFG17-16 */
};
cy_psoc3_dp16 #(
    .cy_dpconfig_a( Datapath_1_dpconfig0 ), .cy_dpconfig_b( Datapath_1_dpconfig1 ),
    .d0_init_a( 8'b11111111 ), .d0_init_b( 8'b00000000 ),
    .d1_init_a( 8'b00000000 ), .d1_init_b( 8'b00000000 ),
    .a0_init_a( 8'b00000000 ), .a0_init_b( 8'b00000000 ),
    .a1_init_a( 8'b00000000 ), .a1_init_b( 8'b00000000 ))
    BitShifter(
        .clk( CLK ),
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
        .so( { shift_out_dp, Datapath_1_so_2 } ), 
        .f0_bus_stat( { fifo_has_room, fifo_has_room_2 } ), 
        .f0_blk_stat( /*{ fifoempty, Datapath_1_f0_blk_stat_1 } */), 
        .f1_bus_stat(  ), 
        .f1_blk_stat(  )
    );








reg [3:0] state;
reg [1:0] data_counter;
reg gsclk_enable;
reg component_on;

wire gsclk_done;
wire gsclk_counter_reset = ~gsclk_enable;
Counter4096 #(.eight_bit_cycle_count (4))
gsclk_counter (
    .clock(CLK),
    .reset(gsclk_counter_reset),
    .tc(gsclk_done)
);

assign active = component_on;
assign gsclk = gsclk_enable ? ~CLK : 0;

always @ (negedge CLK ) begin
    if( reset ) begin
        component_on <= 0;
        state <= 0;
        counter_reset <= 1;
        enable_all <= 0;
        start_dma <= 0;
        dma_delay <= 0;
        data_counter <= 0;
        gsclk_enable <= 0;
        xlat <= 0;
        vprg <= 0;
        blank <= 1;
        sclk_extra_pulse <= 0;
    end else begin
    case (state)
        0: 
        begin
            counter_reset <= 1;
            enable_all <= 0;
            start_dma <= 0;
            dma_delay <= 0;
            data_counter <= 0;
            gsclk_enable <= 0;
            xlat <= 0;
            vprg <= 0;
            sclk_extra_pulse <= 0;
            component_on <= 0;
            if (enable) begin
                component_on <= 1;
                state <= 1;
            end
        end
        1: 
        begin
            gsclk_enable <= 1;
            start_dma <= 1;
            if (data_counter == 0) begin
                vprg <= 1;
            end else begin
                vprg <= 0;
            end
            if (word_counter_output == dma_word_timer_count) begin
                state <= 2;
                counter_reset <= 1;
            end else begin
                state <= 1;
                dma_delay <= 1;
                counter_reset <= 0; 
            end
        end
        2: 
        begin
            counter_reset <= 0;
            state <= 3;
            enable_all <= 1;
        end
        3: begin
            dma_delay <= 0;
            if (dma_nrq) begin
                start_dma <= 0;
                state <= 4;
            end
        end
        4: begin
            if (word_counter_tc) begin
                enable_all <= 0;
                state <= 5;
                data_counter <= data_counter + 1;
            end
        end
        5: begin 
            if (data_counter == 1) begin
                // DC data load
                xlat <= 1;
                state <= 7;
            end else if (data_counter == 3) begin
                state <= 8;
            end else begin
                state <= 1;
            end
        end
        7: begin
            xlat <= 0; 
            state <=1; 
        end
        8: begin
            if (gsclk_done) begin 
                gsclk_enable <= 0;
                blank <= 1;
                state <= 9;
            end
        end
        9: begin
            xlat <= 1;
            state <= 10;
        end
        10: begin
            state <= 11;
            xlat <= 0;
        end
        11: begin
            blank <= 0;
            state <= 12;
        end
        12: begin 
            sclk_extra_pulse <= 1;
            state <= 13;
        end
        13: begin 
            sclk_extra_pulse <= 0;
            // read xerr here
            state <= 0;
        end
    endcase
    end
end
            
                
            
        
    



//`#end` -- edit above this line, do not edit this line
endmodule
//`#start footer` -- edit after this line, do not edit this line
//`#end` -- edit above this line, do not edit this line

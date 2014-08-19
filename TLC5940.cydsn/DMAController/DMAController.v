
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
//`#end` -- edit above this line, do not edit this line
// Generated on 08/18/2014 at 14:09
// Component: DMAController
module DMAController (
	output reg  CEnable,
	output reg  DMAEnable,
	input   CLK,
	input   nrq,
	input   reset,
	input   tc
);

//`#start body` -- edit after this line, do not edit this line

reg counter_reset;
reg dma_delay;
wire [6:0] counter_output;
wire counter_tc;

reg [2:0] state;

wire nCLK = ~CLK;

wire enable_counter;
assign enable_counter = dma_delay | tc;

cy_psoc3_count7 #(.cy_period(16), .cy_route_ld(`FALSE), .cy_route_en(`TRUE)) 
Counter7Name (
/* input */ .clock (CLK), // Clock
/* input */ .reset(counter_reset), // Reset
/* input */ .load(1'b0), // Load signal used if cy_route_ld = TRUE
/* input */ .enable(enable_counter), // Enable signal used if cy_route_en = TRUE
/* output [6:0] */ .count(counter_output), // Counter value output
/* output */ .tc(counter_tc) // Terminal Count output
);

always @ (negedge CLK) begin
    if( reset & ( state != 0 ) ) begin
        state <= 0;
    end else begin
    case (state)
        0: 
        begin
            counter_reset <= 1;
            CEnable <= 0;
            DMAEnable <= 0;
            dma_delay <= 0;
            if (~reset) begin
                state <= 1;
            end
        end
        1: 
        begin
            DMAEnable <= 1;
            if (counter_output == 7'd3) begin
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
            CEnable <= 1;
        end
        3: begin
            dma_delay <= 0;
            if (nrq) begin
                DMAEnable <= 0;
                state <= 4;
            end
        end
        4: begin
            if (counter_tc) begin
                CEnable <= 0;
                state <= 5;
            end
        end
        5: begin state <=6; end
        6: begin state <=7; end
        7: begin state <=7; end
    endcase
    end
end
            
                
            
        
    



//`#end` -- edit above this line, do not edit this line
endmodule
//`#start footer` -- edit after this line, do not edit this line
//`#end` -- edit above this line, do not edit this line

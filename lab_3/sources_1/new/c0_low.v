`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 04:43:22 PM
// Design Name: 
// Module Name: c0_low
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module c0_low(
    input CLOCK,
    output reg SLOWCLK = 0
    );
    // outputs 0.37 Hz
    // 0.37 Hz: 100^6 / 2^(27+1)
    reg [26:0] COUNT = 27'b0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        SLOWCLK <= (COUNT == 0) ? ~SLOWCLK : SLOWCLK;
    end
endmodule

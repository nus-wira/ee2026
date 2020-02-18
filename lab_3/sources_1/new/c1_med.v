`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 07:46:57 PM
// Design Name: 
// Module Name: c1_med
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


module c1_med(
    input CLOCK,
    output reg MEDCLK = 0
    );
    // outputs 1.5 Hz
    // 1.5 Hz: 100^6 / 2^(25+1)
    reg [24:0] COUNT = 25'b0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        MEDCLK <= (COUNT == 0) ? ~MEDCLK : MEDCLK;
    end
endmodule

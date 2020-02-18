`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 07:55:55 PM
// Design Name: 
// Module Name: c2_hi
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


module c2_hi(
    input CLOCK,
    output reg FASTCLK = 0
    );
    // outputs 6 Hz
    // 6 Hz: 100^6 / 2^(23+1)
    reg [22:0] COUNT = 23'b0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        FASTCLK <= (COUNT == 0) ? ~FASTCLK : FASTCLK;
    end
endmodule

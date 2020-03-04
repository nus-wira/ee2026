`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 03:22:36 PM
// Design Name: 
// Module Name: fastclock
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


module fastclock(
    input CLOCK,
    output reg FASTCLK = 0
    );
    // 381 Hz
    reg [16:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        FASTCLK <= (COUNT == 0) ? ~FASTCLK : FASTCLK;
    end
endmodule

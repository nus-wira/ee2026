`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 05:31:23 PM
// Design Name: 
// Module Name: medclock
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


module medclock(
    input CLOCK,
    output reg MEDCLK = 0
    );
    // 6 Hz
    reg [22:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        MEDCLK <= (COUNT == 0) ? ~MEDCLK : MEDCLK;
    end
endmodule

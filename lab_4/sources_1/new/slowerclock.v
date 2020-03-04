`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 02:48:00 PM
// Design Name: 
// Module Name: slowerclock
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


module slowerclock(
    input CLOCK,
    output reg SLOWCLK = 0
    );
    // f = 0.37 Hz, T = 2.68 s
    reg [26:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        SLOWCLK <= (COUNT == 0) ? ~SLOWCLK : SLOWCLK;
    end
endmodule

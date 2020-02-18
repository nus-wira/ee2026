`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 12:38:03 AM
// Design Name: 
// Module Name: a_blinking
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

// Matric No. A0149286R
// Task A: 3rd last no. - 2
// LD 2+6 = 8

module a_blinking(
    input CLOCK,
    output reg LD8 = 0
    );
    
    reg [23:0] COUNT  = 24'b0; // 3 Hz
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        LD8 <= (COUNT == 24'b0) ? ~LD8 : LD8;
    end
endmodule

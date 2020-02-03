`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2020 06:12:13 PM
// Design Name: 
// Module Name: four_bit
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


module four_bit(
    input [3:0] A,
    input [3:0] B,
    input C0,
    output [3:0] S,
    output C4
    );
    
    wire C1, C2, C3;
    one_bit fa0 (A[0], B[0], C0, S[0], C1);
    one_bit fa1 (A[1], B[1], C1, S[1], C2);
    one_bit fa2 (A[2], B[2], C2, S[2], C3);
    one_bit fa3 (A[3], B[3], C3, S[3], C4);
endmodule

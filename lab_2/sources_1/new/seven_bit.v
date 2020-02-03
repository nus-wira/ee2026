`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2020 11:03:34 PM
// Design Name: 
// Module Name: seven_bit
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


module seven_bit(
    input [6:0] A,
    input [6:0] B,
    output [6:0] S,
    output COUT
    );
    
    wire [6:0] B_1s, B_2s;
    wire C0_MSB, CARRY_L_2s, CARRY_M_2s;
    
    assign B_1s = ~B;
    // Convert B to 2's complement
    five_bit pa0 (B_1s[4:0], 5'b00001, 0, B_2s[4:0], CARRY_L_2s);
    two_bit pa1 (B_1s[6:5], 2'b00, CARRY_L_2s, B_2s[6:5], CARRY_M_2s);
    
    // Add A LSB and B LSB
    five_bit lsb (A[4:0], B_2s[4:0], 0, S[4:0], C0_MSB);
    // Add A MSB and B MSB, with carry from LSB
    two_bit msb (A[6:5], B_2s[6:5], C0_MSB, S[6:5], COUT);
endmodule

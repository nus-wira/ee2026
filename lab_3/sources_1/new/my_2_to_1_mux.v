`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2020 07:49:07 PM
// Design Name: 
// Module Name: my_2_to_1_mux
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


module my_2_to_1_mux(
    input A,
    input B,
    input S,
    output Z
    );
    
    assign Z = S ? B : A; // assign B to Z if S = 1, else assign A to Z
endmodule

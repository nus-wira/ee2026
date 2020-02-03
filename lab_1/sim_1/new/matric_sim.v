`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2020 05:29:51 PM
// Design Name: 
// Module Name: matric_sim
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


module matric_sim(

    );
    
    // Input
    reg d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7, d_8, d_9;
    
    // Output
    wire AN0, AN1, AN2, AN3, segA, segB, segC, segD, segE, segF, segG, segDP;
    
    // Instantation
    matric dut(d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7, d_8, d_9,
               AN0, AN1, AN2, AN3, 
               segA, segB, segC, segD, segE, segF, segG, segDP);
    
    // Stimuli
    initial begin
        d_0 = 1; d_1 = 1; d_2 = 1; d_3 = 1; d_4 = 1; 
        d_5 = 1; d_6 = 1; d_7 = 1; d_8 = 1; d_9 = 1; #10;
        d_0 = 0; d_1 = 0; d_2 = 1; d_3 = 0; d_4 = 1; 
        d_5 = 0; d_6 = 1; d_7 = 0; d_8 = 1; d_9 = 1; #10;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2020 04:27:35 PM
// Design Name: 
// Module Name: matric
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


module matric(
    input d_0,
    input d_1,
    input d_2,
    input d_3,
    input d_4,
    input d_5,
    input d_6,
    input d_7,
    input d_8,
    input d_9,
    output AN0,
    output AN1,
    output AN2,
    output AN3,
    output segA,
    output segB,
    output segC,
    output segD,
    output segE,
    output segF,
    output segG,
    output segDP
    );
    
    // A0149286R
    // Last digit 6, AN1 & AN2 on
    assign AN0 = d_0 | d_1 | !d_2 | d_3 | !d_4 | d_5 | !d_6 | d_7 | !d_8 | !d_9;
    assign AN1 = 1;
    assign AN2 = 1;
    assign AN3 = AN0;
    
    // Last letter R
    assign segA = 1;
    assign segB = 1;
    assign segC = 1;
    assign segD = 1;
    assign segE = 0;
    assign segF = 1;
    assign segG = 0;
    assign segDP = 1;
    
    
    
endmodule

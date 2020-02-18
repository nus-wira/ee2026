`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2020 06:13:31 PM
// Design Name: 
// Module Name: main
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


module main(
    input SW0,
    input SW1,
    input SW2,
    input CLOCK,
    output LD8, LD9, LD10, LD11, LD12, LD13, LD14, LD15,
    output AN0, AN1, AN2, AN3,
    output segA,segB,segC,segD,segE,segF,segG,segDP
    );
    
    // Blinking LD8
    a_blinking dut0(CLOCK, LD8);
    // Trail with freq control via switches
    c_speed dut1(SW0,SW1,SW2,CLOCK, LD9, LD10, LD11, LD12, LD13, LD14, LD15);
    // 7 segment display
    d_7seg dut2(LD9, AN0, AN1, AN2, AN3, segA,segB,segC,segD,segE,segF,segG,segDP);
endmodule

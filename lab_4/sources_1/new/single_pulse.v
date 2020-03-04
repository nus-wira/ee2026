`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 07:40:54 PM
// Design Name: 
// Module Name: single_pulse
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


module single_pulse(
    input clock,
    input btn,
    output pulse
    );
    
    wire Q0, Q1;
    
    dff d0(clock,btn, Q0);
    dff d1(clock,Q0, Q1);
    assign pulse = Q0 & ~Q1;
endmodule

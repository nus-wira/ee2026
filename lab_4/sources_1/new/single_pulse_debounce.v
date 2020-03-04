`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2020 07:58:59 PM
// Design Name: 
// Module Name: single_pulse_debounce
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

module single_pulse_debounce(
    input clock,
    input btn,
    output slowclk, pulse
    );
    btn_clk_divider c0(clock, slowclk);
    single_pulse s0(slowclk,btn , pulse);
endmodule
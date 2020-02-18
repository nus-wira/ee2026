`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 04:24:59 PM
// Design Name: 
// Module Name: c_freq
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


module c_freq(
    input SW0,
    input SW1,
    input SW2,
    input SLOWCLK,
    input MEDCLK,
    input FASTCLK,
    output CURRCLK
    );
    
    assign CURRCLK = SW2 ? FASTCLK : (SW1 ? MEDCLK : (SW0 ? SLOWCLK : MEDCLK));
endmodule

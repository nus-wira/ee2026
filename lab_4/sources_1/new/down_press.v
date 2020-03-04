`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 09:47:35 PM
// Design Name: 
// Module Name: down_press
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


module down_press(
    input CLOCK,
    input [3:0] char1, char2,char3,char4,
    input [1:0] ptr,
    output  [3:0] an,
    output  [6:0] seg,
    output  dp
    );
    wire [3:0] charD1, charD2, charD3, charD4;
    wire [3:0] an1, an2, an3, an4;
    wire [6:0] seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8;
    wire dp1, dp2, dp3, dp4, dp5,dp6,dp7,dp8;
    show_char s1(char1, seg1, dp1);
    show_char s2(char2, seg2, dp2);
    show_char s3(char3, seg3, dp3);
    show_char s4(char4, seg4, dp4);
    show_char s5(charD1, seg5, dp5);
    show_char s6(charD2, seg6, dp6);
    show_char s7(charD3, seg7, dp7);
    show_char s8(charD4, seg8, dp8);
    show_4char s9(CLOCK, ptr, seg1,seg2,seg3,seg4,seg5,seg6,seg7,seg8,dp1,dp2,dp3,dp4, dp5,dp6,dp7,dp8, an, seg, dp);

endmodule

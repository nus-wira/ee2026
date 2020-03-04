`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 09:20:03 PM
// Design Name: 
// Module Name: up_press
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


module up_press(
    input CLOCK,
    input [3:0] char1, char2,char3,char4,
    input [1:0] ptr,
    output  [3:0] an,
    output  [6:0] seg,
    output  dp,
    output char
    );
    wire [3:0] charU1, charU2, charU3, charU4;
    wire [3:0] an1, an2, an3, an4;
    wire [6:0] seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8;
    wire dp1, dp2, dp3, dp4, dp5,dp6,dp7,dp8;
    up c1(char1, charU1);
    up c2(char2, charU2);
    up c3(char3, charU3);
    up c4(char4, charU4);
    show_char s1(char1, seg1, dp1);
    show_char s2(char2, seg2, dp2);
    show_char s3(char3, seg3, dp3);
    show_char s4(char4, seg4, dp4);
    show_char s5(charU1, seg5, dp5);
    show_char s6(charU2, seg6, dp6);
    show_char s7(charU3, seg7, dp7);
    show_char s8(charU4, seg8, dp8);
    show_4char s9(CLOCK, ptr, seg1,seg2,seg3,seg4,seg5,seg6,seg7,seg8,dp1,dp2,dp3,dp4, dp5,dp6,dp7,dp8,an, seg, dp);
//    always @ (*) begin
//        case (ptr)
//        2'd0:
//            begin
//                an = 4'b1110;
//                seg = seg1;
//                dp = dp1;
//            end
//        2'd1:
//            begin
//                an = 4'b1101;
//                seg = seg2;
//                dp = dp2;
//            end
//        2'd2:
//            begin
//                an = 4'b1011;
//                seg = seg3;
//                dp = dp3;
//            end
//        2'd3:
//            begin
//                an = 4'b0111;
//                seg = seg4;
//                dp = dp4;
//            end
//        endcase
//    end
endmodule

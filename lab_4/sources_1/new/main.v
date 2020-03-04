`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 04:50:35 PM
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
    input CLOCK,
    input [15:0] sw,
    input btnC, btnU, btnD, btnR, btnL,
    output [3:0] an,
    output [6:0] seg,
    output dp,
    output [10:0] led
    );
    wire a_done, b_done, LOA;
    wire [1:0] flag;
    assign dp = 1;
    wire [3:0] an_a, an_d, an_e;
    wire [6:0] seg_a, seg_d, seg_e;
    wire dp_a, dp_d;
    wire [10:0] led_b, led_c;
    wire E,QUAR;
    assign E = (sw == 16'b0000000000011111);
    a_activation a0(E, an_a, seg_a, led_b, a_done);
    c_countdown c0(a_done, CLOCK, led_c, LOA);
    d_loa d0 (CLOCK, LOA, an_d, seg_d);
    e_quar e0 (CLOCK, LOA, btnC, btnU, btnD, btnR, btnL, an_e, seg_e, QUAR);

    assign flag = a_done ? (LOA ? (QUAR ? 2'd3 : 2'd2) : 2'd1) : 0;
//    a_activation a0 (E, an_a, seg_a, dp_a, a_done);
//    b_trail b0 (led_b);
//    c_countdown c0 (CLOCK, a_done, led_c, LOA);
//    d_loa d0(CLOCK, LOA, an_d, seg_d, dp_d);
    multiplexer mul0 (flag, an_a, an_d, an_e, seg_a, seg_d, seg_e, 
                      led_b, led_c, an, seg,led);

//    a_activation a0 (sw, an_a, seg_a, dp_a, a_done);
//    b_trail b0 (a_done, led_b, b_done);
//    c_countdown c0 (CLOCK, b_done, led_c, LOA);
//    d_loa d0 (CLOCK, LOA, an_d, seg_d, dp_d);
//    multiplexer mul0 (a_done, b_done, LOA, an_a, an_d, seg_a, seg_d, dp_a, dp_d, 
//                      led_b, led_c, an, seg, dp, led);
    

endmodule

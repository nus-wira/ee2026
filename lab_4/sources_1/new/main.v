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
    // Flags for activation / LOA / ANTINE / finish
    wire a_done, LOA, E, ANTINE, ALLDONE; 
    wire [2:0] flag; // Flag used in multiplexer
    
    // To display 7segs
    wire [3:0] an_a, an_d, an_e;
    wire [6:0] seg_a, seg_d, seg_e;
    wire [10:0] led_b, led_c, led_e;
    
    assign dp = 1; // dp never on
    assign E = (sw == 16'b0000000000011111); // enable activation
    
    // Activation & Trail
    a_activation a0(E, an_a, seg_a, led_b, a_done);
    // Countdown
    c_countdown c0(a_done, CLOCK, led_c, LOA);
    // LOA
    d_loa d0 (CLOCK, LOA, an_d, seg_d);
    // QUAR(TZ) (ANTINE)
    e_quar e0 (CLOCK, LOA, btnC, btnU, btnD, btnR, btnL, an_e, seg_e, led_e, ANTINE,ALLDONE);
    
    // Flag to determine which subtask to display
    assign flag = ALLDONE ? 3'd4 : (a_done ? (LOA ? (ANTINE ? 3'd3 : 3'd2) : 3'd1) : 0);
    
    // To display to output board using flag
    multiplexer mul0 (flag, an_a, an_d, an_e, seg_a, seg_d, seg_e, 
                      led_b, led_c, led_e, an, seg,led);

endmodule

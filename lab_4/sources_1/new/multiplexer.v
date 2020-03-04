`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 07:52:41 PM
// Design Name: 
// Module Name: multiplexer
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


module multiplexer(
    input [1:0] flag,
    input [3:0] an_a, an_d, an_e,
    input [6:0] seg_a, seg_d, seg_e,
//    input dp_a, dp_d,
    input [10:0] led_b, led_c,
    output  reg [3:0] an, 
    output  reg [6:0] seg,
//    output reg dp,
    output reg [10:0] led
    );
//    assign an = LOA ? an_d : an_a;
//    assign seg = LOA ? seg_d : seg_a;
//    assign dp = LOA ? dp_d : dp_a;
//    assign led = a_done ? led_c : 0;
    initial begin
        an = ~4'b0;
        seg = ~7'b0;
//        dp = 1;
        led = 0;
    end
    always @ (*) begin
        case (flag)
        2'd0: 
            begin
                an = an_a;
                seg = seg_a;
//                dp = dp_a;
                led = led_b;
            end
        2'd1:
            begin
                an = an_a;
                seg = seg_a;
//                dp = dp_a;
                led = led_c;
            end
        2'd2:
            begin
                an = an_d;
                seg = seg_d;
//                dp = dp_d;
                led = 0;
            end
        2'd3:
            begin
                an = an_e;
                seg = seg_e;
                led = 0;
            end
        default:
            begin
                an = 0;
                seg = 0;
//                dp = 0;
                led = 0;
            end
        endcase
//        end else if (LOA) begin
//            an = an_d;
//            seg = seg_d; dp = dp_d;
    end
endmodule

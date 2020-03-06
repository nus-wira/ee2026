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
    input [2:0] flag,
    input [3:0] an_a, an_d, an_e,
    input [6:0] seg_a, seg_d, seg_e,
    input [15:0] led_b, led_c, led_e,
    output  reg [3:0] an, 
    output  reg [6:0] seg,
    output reg [15:0] led
    );
    
    initial begin
        an = ~4'b0;
        seg = ~7'b0;
        led = 0;
    end
    always @ (*) begin
        case (flag)
        3'd0: // activation / trail
            begin
                an = an_a;
                seg = seg_a;
                led = led_b;
            end
        3'd1: // countdown
            begin
                an = an_a;
                seg = seg_a;
                led = led_c;
            end
        3'd2: // LOA
            begin
                an = an_d;
                seg = seg_d;
                led = 0;
            end
        3'd3: // QUAR(TZ)(ANTINE)
            begin
                an = an_e;
                seg = seg_e;
                led = led_e;
            end
        3'd4: // DONE
            begin
                an = an_e;
                seg = seg_e;
                led = 0;
            end
        default:
            begin
                an = 0;
                seg = 0;
                led = 0;
            end
        endcase
    end
endmodule

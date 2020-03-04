`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 02:40:46 PM
// Design Name: 
// Module Name: c_countdown
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


module c_countdown(
    input a_done, CLOCK,
    output reg [10:0] led,
//    output reg [3:0] an,
//    output reg [6:0] seg,
//    output reg dp,
    output reg LOA
    );
    
    reg [3:0] count;
    wire SLOWCLK;
    slowclock c0(CLOCK, SLOWCLK);
    
    initial begin
        count = 0;
        LOA = 0;
//        an = ~4'b0;
//        dp = 1;
//        seg = ~7'b0;
        led = 0;
    end
    
    always @ (posedge SLOWCLK) begin
        if (a_done) begin
            count <= (count == 4'd12) ? count : count + 1;
            case (count)
            4'd0:
                begin
//                    an <= 4'b0;
//                    dp <= 1;
//                    seg <= 7'b1110110;
                    led <= ~11'b0;
                end
            4'd1:
                begin
                    led[10] <= 0;
                end
            4'd2:
                begin
                    led[9] <= 0;
                end
            4'd3:
                begin
                    led[8] <= 0;
                end
            4'd4:
                begin
                    led[7] <= 0;
                end
            4'd5:
                begin
                    led[6] <= 0;
                end
            4'd6:
                begin
                    led[5] <= 0;
                end  
            4'd7:
                begin
                    led[4] <= 0;
                end
            4'd8:
                begin
                    led[3] <= 0;
                end
            4'd9:
                begin
                    led[2] <= 0;
                end
            4'd10:
                begin
                    led[1] <= 0;
                end
            4'd11:
                begin
                    led[0] <= 0;
                    LOA <= 1;
                end
            default:
                begin
                    led <= 0;
                end  
            endcase
        end
    end   

        
endmodule

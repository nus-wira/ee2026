`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 03:04:01 PM
// Design Name: 
// Module Name: d_loa
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


module d_loa(
    input CLOCK, LOA,
    output reg [3:0] an,
    output reg [6:0] seg
//    output reg dp
    );
    wire slowclk,fastclk;
    wire CURRCLK;
    reg [1:0] count;
    reg [2:0] start;
    slowerclock s0(CLOCK, slowclk);
    fastclock s1(CLOCK, fastclk);
    
    initial begin
        an = 4'b0;
        seg = 7'b1110110;
//        dp = 1;
        count = 0;
        start = 1;
    end
    
    
    assign CURRCLK = start ? slowclk : fastclk;
   
    
    always @ (posedge CURRCLK) begin
        if (LOA) begin
            count <= (count == 2'd2) ? 0 : count + 1;
            
            case (count)
            2'd0: // L
                begin
                    an <= 4'b1011; seg <= 7'b1000111; //dp <= 1;
                end
            2'd1: // O
                begin
                    an <= 4'b1101; seg <= 7'b1000000; //dp <= 1;
                end
            2'd2: // A
                begin
                    an <= 4'b1110; seg <= 7'b0001000; //dp <= 1;                    
                end
            default: 
                begin
                    an <= 4'b1111; seg <= ~7'b0; //dp <= 1;
                end
            endcase
            
            //only execute start once
            if (start) begin
                start <= (start == 3'd4) ? 0 : start + 1;
            end
            
        end
    end
endmodule

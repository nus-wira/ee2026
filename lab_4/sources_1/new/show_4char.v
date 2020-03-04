`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 09:57:11 PM
// Design Name: 
// Module Name: show_4char
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


module show_4char(
    input CLOCK,
    input [1:0] ptr,
    input [6:0] seg1, seg2,seg3,seg4,seg5,seg6,seg7,seg8,
    input dp1,dp2,dp3,dp4,dp5,dp6,dp7,dp8,
    output reg [3:0] an,
    output reg [6:0] seg,
    output reg dp
    );
    reg [1:0] count = 0;
    wire [6:0] seg1f, seg2f, seg3f, seg4f;
    wire [6:0] dp1f, dp2f, dp3f, dp4f;
    assign seg1f = (ptr == 0) ? seg1 : seg5;
    assign seg2f = (ptr == 1) ? seg2 : seg6;
    assign seg3f = (ptr == 2) ? seg3 : seg7;
    assign seg4f = (ptr == 3) ? seg4 : seg8;
    assign dp1f = (ptr == 0) ? dp1 : dp5;
    assign dp2f = (ptr == 1) ? dp2 : dp6;
    assign dp3f = (ptr == 2) ? dp3 : dp7;
    assign dp4f = (ptr == 3) ? dp4 : dp8;
    
    always @ (posedge CLOCK) begin
        count <= count + 1;
        case (count)
        2'd0:
            begin
                an <= 4'b1110;
                seg <= seg1f;
                dp <= dp1f;
            end
        2'd1:
            begin
                an <= 4'b1101;
                seg <= seg2f;
                dp <= dp2f;
            end
        2'd2:
            begin
                an <= 4'b1011;
                seg <= seg3f;
                dp <= dp3f;
            end
        2'd3:
            begin
                an <= 4'b0111;
                seg <= seg4f;
                dp <= dp4f;
            end
        endcase
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2020 10:19:45 PM
// Design Name: 
// Module Name: name
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


module name(
    input SLOWCLOCK,
    input PULC,
    input [3:0] char0, char1, char2, char3,
    input [6:0] segq0, segq1, segq2, segq3,
    output reg [6:0] seg0, seg1, seg2, seg3
    );
    wire pass, QUARTZ;
    assign pass = (segq3 == 7'b0010000) && (segq2 == 7'b0100100) && (segq1 == 7'b0) && (segq0 == 7'b0000010);
    set_quartz q0(SLOWCLOCK, PULC, pass, QUARTZ);
//    assign pass = 1;
    initial begin
        seg0 = 7'b0110110;
        seg1 = 7'b0110110;
        seg2 = 7'b0110110;
        seg3 = 7'b0110110;
    end
    always @ (posedge SLOWCLOCK) begin
        if (QUARTZ) begin
            seg3 <= 7'b1010101; //w
            seg2 <= 7'b1001111; //i
            seg1 <= 7'b0101111; //r
            seg0 <= 7'b0001000; //a
        end else begin
            seg3 <= segq3;
            seg2 <= segq2;
            seg1 <= segq1;
            seg0 <= segq0;
        end
    end
endmodule

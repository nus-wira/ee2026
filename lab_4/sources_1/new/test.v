`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2020 06:47:27 PM
// Design Name: 
// Module Name: test
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


module test(
    input CLOCK, btnU,
    output [3:0] an,
    output reg [6:0] seg,
    output dp
    );
    wire clkU, PULU;
    assign dp = 1;
    assign an = 0;
    initial begin
        seg <= 7'b0011001;
    end
    single_pulse_debounce s1(CLOCK, btnU, clkU, PULU);
    always @ (posedge clkU) begin
        if (PULU) begin
            seg <= ~seg;
        end
    end
    
endmodule

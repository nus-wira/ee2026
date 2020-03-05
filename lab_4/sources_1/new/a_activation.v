`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 02:14:24 PM
// Design Name: 
// Module Name: a_activation
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

// Turn on activation
module a_activation(
    input E,
    output reg [3:0] an,
    output reg [6:0] seg,
    output reg [10:0] led,
    output reg done
    );
    initial begin
        done = 0;
        an = ~4'b0;
        seg = ~7'b0;
        led = 0;
    end
    always @ (*) begin
        if (E) begin
            an = 4'b0;
            seg = 7'b1110110;
            led = ~11'b0;
            done = 1;
        end
    end
endmodule

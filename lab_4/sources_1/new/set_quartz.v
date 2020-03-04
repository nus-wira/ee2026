`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 12:14:29 AM
// Design Name: 
// Module Name: set_quartz
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


module set_quartz(
    input SLOWCLOCK,
    input PULC,
    input pass,
    output reg QUARTZ = 0
    );
    always @ (posedge SLOWCLOCK) begin
        QUARTZ <= QUARTZ ? QUARTZ : (pass && PULC);
    end
endmodule

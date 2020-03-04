`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 07:40:11 PM
// Design Name: 
// Module Name: btn_clk_divider
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


module btn_clk_divider(
    input clock,
    output reg slowclk = 0
    );
    //3 Hz
    //reg [23:0] count = 0;
    //12 Hz
    // reg [21:0] count = 0;
    //25 MHz
    reg count = 0;
    
    always @ (posedge clock) begin
        count <= count + 1;
        slowclk <= (count == 0) ? ~slowclk : slowclk;
    end
endmodule
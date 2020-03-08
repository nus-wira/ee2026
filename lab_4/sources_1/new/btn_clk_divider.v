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

    //25 MHz
    //reg count = 0;
    //12.5 MHz
    reg [1:0] count = 0;
    //6.25 MHz
    //reg [2:0] count = 0;
    
    always @ (posedge clock) begin
        count <= count + 1;
        slowclk <= (count == 0) ? ~slowclk : slowclk;
    end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2020 11:51:10 PM
// Design Name: 
// Module Name: slow_blinky
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


module slow_blinky(
    input CLOCK, SWITCH,
    output LED
    );
    
    reg [5:0] COUNT = 6'b000000;
    reg LED = 0;
    wire CHECK;
    
    
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        LED <= ( COUNT == CHECK ) ? ~LED : LED;
    end
endmodule

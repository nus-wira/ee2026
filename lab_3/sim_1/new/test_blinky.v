`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2020 07:55:56 PM
// Design Name: 
// Module Name: test_blinky
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


module test_blinky(

    );
    reg CLOCK; wire LED;
    
    blinky dut(CLOCK, LED);
    
    initial begin
        CLOCK = 0;
    end
    
    always begin
        #5 CLOCK = ~CLOCK;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2020 11:52:56 PM
// Design Name: 
// Module Name: test_slow_blinky
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


module test_slow_blinky(

    );
    reg CLOCK, SWITCH;
    wire LED;
    
    slow_blinky dut(CLOCK, SWITCH, LED);
    initial begin
        CLOCK = 0;
        SWITCH = 0; #200
        SWITCH = 1;
    end
        
    always begin
        #5 CLOCK = ~CLOCK;
    end
endmodule

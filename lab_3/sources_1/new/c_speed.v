`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 04:15:09 PM
// Design Name: 
// Module Name: c_speed
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

// Matric No. A0149286R
// 3rd rightmost is 2

module c_speed(
    input SW0,
    input SW1,
    input SW2,
    input CLOCK,
    output reg LD9 = 0,
    output reg LD10 = 0,
    output reg LD11 = 0,
    output reg LD12 = 0,
    output reg LD13 = 0,
    output reg LD14 = 0,
    output reg LD15 = 0
    );
    
    wire SLOWCLK, MEDCLK, FASTCLK, CURRCLK; // For each clock frequency
    reg [3:0] COUNTLD = 3'd0; // To keep track of which LD to light up
    
    // instantation of clock frequency modules
    // low speed: 0.37 Hz
    // med speed: 1.5 Hz
    // high speed: 6 Hz
    c0_low clk0(CLOCK, SLOWCLK); // 0.37 Hz 
    c1_med clk1(CLOCK, MEDCLK); // 1.5 Hz
    c2_hi clk2(CLOCK, FASTCLK); // 6 Hz
    // set the clock speed
    c_freq f_clk(SW0,SW1,SW2,SLOWCLK,MEDCLK,FASTCLK,CURRCLK);
    
    always @ (posedge CURRCLK) begin
        // Switches off previous LD, lights up next LD
        case (COUNTLD)
            3'd0:
                begin
                    LD15 <= 0;
                    LD9 <= 1;
                end
            3'd1:
                begin
                    LD9 <= 0;
                    LD10 <= 1;
                end
            3'd2:
                begin
                    LD10 <= 0;
                    LD11 <= 1;
                end
            3'd3:
                begin
                    LD11 <= 0;
                    LD12 <= 1;
                end                    
            3'd4:
                begin
                    LD12 <= 0;
                    LD13 <= 1;
                end             
            3'd5:
                begin
                    LD13 <= 0;
                    LD14 <= 1;
                end
            3'd6:
                begin
                    LD14 <= 0;
                    LD15 <= 1;
                end
        endcase
        // COUNTLD uses frequency from CURRCLK
        // COUNTLD has values from 0 to 6, 
        // counts up 1-by-1, rolls back to 0 after 6
        COUNTLD <= (COUNTLD == 3'd6) ? 3'd0 : COUNTLD + 1;
    end
endmodule

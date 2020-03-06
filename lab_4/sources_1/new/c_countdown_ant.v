`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 09:40:57 PM
// Design Name: 
// Module Name: c_countdown_ant
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

// A0149286R
// 2nd rightmost digit = 8 -> until LD14 + period of 1.34s (0.75 Hz)
module c_countdown_ant(
    input QUAR, CLOCK, resetFLAG,
    output reg [15:0] led = 0,
    output reg LOA = 0, resetQUAR = 0
    );
    
    reg [3:0] count = 0;
    wire SLOWCLK;
    slowclock c0(CLOCK, SLOWCLK); // 0.75 Hz clock
    
    always @ (posedge SLOWCLK) begin
        // resetQUAR = 1 at end of countdown -> QUAR = 1 -> resetFLAG = 1 -> resetQUAR = 0 
        // -> QUAR = 1 if btnC -> resetFLAG = 0 -> resetQUAR = 1 at end of countdown
        resetQUAR <= resetFLAG ? 0 : resetQUAR;
        if (QUAR) begin
            LOA <= 1;
            count <= (count == 4'd15) ? 0 : count + 1;
            case (count)
            4'd0: led <= 16'h7fff; // Turn on LD 0 to 14
            4'd1: led[14] <= 0;
            4'd2: led[13] <= 0;
            4'd3: led[12] <= 0;
            4'd4: led[11] <= 0;
            4'd5: led[10] <= 0;
            4'd6: led[9] <= 0;
            4'd7: led[8] <= 0;
            4'd8: led[7] <= 0;
            4'd9: led[6] <= 0;
            4'd10: led[5] <= 0;
            4'd11: led[4] <= 0;
            4'd12: led[3] <= 0;
            4'd13: led[2] <= 0;
            4'd14: led[1] <= 0;
            4'd15:
                begin
                    led[0] <= 0;
                    LOA <= 0;
                    resetQUAR <= 1;
                end
            default: led <= 0;
            endcase
        end
    end   
endmodule

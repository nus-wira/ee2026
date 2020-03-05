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

// resetQUAR = 1 at end of countdown -> QUAR = 1 -> resetFLAG = 1 -> resetQUAR = 0 
// -> QUAR = 1 if btnC -> resetFLAG = 0 -> resetQUAR = 1 at end of countdown
module set_quartz(
    input SLOWCLOCK, PULC, pass, resetQUAR,
    output reg QUARTZ = 0, resetFLAG = 0
    );
    always @ (posedge SLOWCLOCK) begin
        if (resetQUAR) begin
            QUARTZ <= 0;
            resetFLAG <= 1;
        end else begin
            QUARTZ <= QUARTZ ? QUARTZ : (pass && PULC);
            resetFLAG <= 0;
        end
    end
endmodule

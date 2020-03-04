`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 08:01:45 PM
// Design Name: 
// Module Name: up
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


module up(
    input char_prev,
    output reg char_new
    );
    
    always @ (*) begin
        case (char_prev)
        4'd10:
            char_new = 4'd1;
        4'd4:
            ;
        default:
            char_new = char_new + 1;
                
        endcase
    end
    
endmodule

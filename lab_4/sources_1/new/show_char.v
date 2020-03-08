`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 08:26:11 PM
// Design Name: 
// Module Name: show_char
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


module show_char(
    input SLOWCLK, MEDCLK, PULU, PULD, ptr, resetQUAR,
    output reg [6:0] seg
    );
    
    reg [6:0] segtog; // To toggle seg when AP active
    reg [3:0] char; // To keep track of current digit to show
    initial begin
        segtog = 7'b0;
        char = 4'd10;
        seg = 7'b0110110;
    end
    
    // Set to toggle at 6 Hz
    always @ (posedge MEDCLK) begin
        segtog <= ptr ? ~segtog : 7'b0;
    end
    
    always @ (posedge SLOWCLK) begin
        if (resetQUAR) begin
            char <= 4'd10;
        end else if (ptr) begin
            char <= PULU ? char + 1 : (PULD ? ((char == 0) ? 4'd10 : char - 1)  : char);
            case (char)
            4'd10: seg <= segtog | 7'b0110110;
            4'd0: seg <= segtog | 7'b1000000;
            4'd1: seg <= segtog | 7'b1111001;
            4'd2: seg <= segtog | 7'b0100100;
            4'd3: seg <= segtog | 7'b0110000;
            4'd4: seg <= segtog | 7'b0011001;
            4'd5: seg <= segtog | 7'b0010010;
            4'd6: seg <= segtog | 7'b0000010;
            4'd7: seg <= segtog | 7'b1111000;
            4'd8: seg <= segtog | 7'b0;
            4'd9: seg <= segtog | 7'b0010000;
            4'd11: char <= 4'd0;
            default: seg <= segtog | 7'b0110110;
            endcase
        end else begin
            case (char)
            4'd10: seg <= 7'b0110110;
            4'd0: seg <= 7'b1000000;
            4'd1: seg <= 7'b1111001;
            4'd2: seg <= 7'b0100100;
            4'd3: seg <= 7'b0110000;
            4'd4: seg <= 7'b0011001;
            4'd5: seg <= 7'b0010010;
            4'd6: seg <= 7'b0000010;
            4'd7: seg <= 7'b1111000;
            4'd8: seg <= 7'b0;
            4'd9: seg <= 7'b0010000;
            4'd11: char <= 4'd0;
            default: seg <= 7'b0110110;
            endcase
         end
    end
endmodule
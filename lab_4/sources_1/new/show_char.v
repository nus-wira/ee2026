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
    input SLOWCLK, PULU, PULD, E,
    output reg [6:0] seg,
    output reg [3:0] char = 4'd10
//    output dp
    );
//    reg [3:0] char = 4'd10;
//    assign dp = 1;
    initial begin
        seg = 7'b0110110;
    end
    always @ (posedge SLOWCLK) begin
        
        if (E) begin
            char <= PULU ? char + 1 : (PULD ? ((char == 0) ? 4'd10 : char - 1)  : char);
            case (char)
            4'd10:
                seg <= 7'b0110110;
            4'd0:
                seg <= 7'b1000000;
            4'd1:
                seg <= 7'b1111001;
            4'd2:
                seg <= 7'b0100100;
            4'd3:
                seg <= 7'b0110000;
            4'd4:
                seg <= 7'b0011001;
            4'd5:
                seg <= 7'b0010010;
            4'd6:
                seg <= 7'b0000010;
            4'd7:
                seg <= 7'b1111000;
            4'd8:
                seg <= 7'b0;
            4'd9:
                seg <= 7'b0010000;
            4'd11:
                char <= 4'd0;
            4'd15:
                char <= 4'd10;
            default:
                seg <= 7'b0110110;
            endcase
        end
    end
            
endmodule
//'d1: // 1
//            begin
//                segA <= 1; segB <= 0; segC <= 0; segD <= 1; 
//                segE <= 1; segF <= 1; segG <= 1; segDP <= 1;
//            end
//        4'd2: // 2
//            begin
//                segA <= 0; segB <= 0; segC <= 1; segD <= 0; 
//                segE <= 0; segF <= 1; segG <= 0; segDP <= 1;
//            end
//        4'd3: // 3
//            begin
//                segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
//                segE <= 1; segF <= 1; segG <= 0; segDP <= 1;
//            end
//        4'd4: // 4
//            begin
//                segA <= 1; segB <= 0; segC <= 0; segD <= 1; 
//                segE <= 1; segF <= 0; segG <= 0; segDP <= 1;
//            end
//        4'd5: // 5
//            begin
//                segA <= 0; segB <= 1; segC <= 0; segD <= 0; 
//                segE <= 1; segF <= 0; segG <= 0; segDP <= 1;
//            end
//        4'd6: // 6
//            begin
//                segA <= 0; segB <= 1; segC <= 0; segD <= 0; 
//                segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
//            end
//        4'd7: // 7
//            begin
//                segA <= 0; segB <= 0; segC <= 0; segD <= 1; 
//                segE <= 1; segF <= 1; segG <= 1; segDP <= 1;
//            end
//        4'd8: // 8
//            begin
//                segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
//                segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
//            end
//        4'd9: // 9
//            begin
//                segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
//                segE <= 1; segF <= 0; segG <= 0; segDP <= 1;
//            end
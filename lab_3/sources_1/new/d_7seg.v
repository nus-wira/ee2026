`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 08:50:54 PM
// Design Name: 
// Module Name: d_7seg
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


module d_7seg(
    input LD_Start,
    output AN0,AN1,AN2,AN3,
    output reg segA,segB,segC,segD,segE,segF,segG,segDP
    );
    assign AN0 = 0;
    assign AN1 = 1;
    assign AN2 = 1;
    assign AN3 = 0;
    
    reg [4:0] COUNT = 4'd0;
    
    always @ (posedge LD_Start) begin
        case (COUNT)
        4'd0: // 0
            begin
                segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
                segE <= 0; segF <= 0; segG <= 1; segDP <= 1;
            end
        4'd1: // 1
            begin
                segA <= 1; segB <= 0; segC <= 0; segD <= 1; 
                segE <= 1; segF <= 1; segG <= 1; segDP <= 1;
            end
        4'd2: // 2
            begin
                segA <= 0; segB <= 0; segC <= 1; segD <= 0; 
                segE <= 0; segF <= 1; segG <= 0; segDP <= 1;
            end
        4'd3: // 3
            begin
                segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
                segE <= 1; segF <= 1; segG <= 0; segDP <= 1;
            end
        4'd4: // 4
            begin
                segA <= 1; segB <= 0; segC <= 0; segD <= 1; 
                segE <= 1; segF <= 0; segG <= 0; segDP <= 1;
            end
        4'd5: // 5
            begin
                segA <= 0; segB <= 1; segC <= 0; segD <= 0; 
                segE <= 1; segF <= 0; segG <= 0; segDP <= 1;
            end
        4'd6: // 6
            begin
                segA <= 0; segB <= 1; segC <= 0; segD <= 0; 
                segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
            end
        4'd7: // 7
            begin
                segA <= 0; segB <= 0; segC <= 0; segD <= 1; 
                segE <= 1; segF <= 1; segG <= 1; segDP <= 1;
            end
        4'd8: // 8
            begin
                segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
                segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
            end
        4'd9: // 9
            begin
                segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
                segE <= 1; segF <= 0; segG <= 0; segDP <= 1;
            end
        4'd10: // W
            begin
                segA <= 1; segB <= 0; segC <= 1; segD <= 0; 
                segE <= 1; segF <= 0; segG <= 1; segDP <= 1;
            end
        4'd11: // I
            begin
                segA <= 1; segB <= 1; segC <= 1; segD <= 1; 
                segE <= 0; segF <= 0; segG <= 1; segDP <= 1;
            end
        4'd12: // R
            begin
                segA <= 1; segB <= 1; segC <= 1; segD <= 1; 
                segE <= 0; segF <= 1; segG <= 0; segDP <= 1;
            end
        4'd13: // A
            begin
                segA <= 0; segB <= 0; segC <= 0; segD <= 1; 
                segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
            end
        4'd14: // .
            begin
                segA <= 1; segB <= 1; segC <= 1; segD <= 1; 
                segE <= 1; segF <= 1; segG <= 1; segDP <= 0;
            end
        default: // all off
            begin
                segA <= 1; segB <= 1; segC <= 1; segD <= 1; 
                segE <= 1; segF <= 1; segG <= 1; segDP <= 1;
            end
        endcase
        // 5 Characters in name + period: WIRA.
        // once it goes past the digits, only loop back to start of name
        COUNT <= (COUNT == 4'd14) ? 4'd10 : COUNT + 1;  
    end
endmodule

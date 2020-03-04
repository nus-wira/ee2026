`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 07:20:20 PM
// Design Name: 
// Module Name: e_quar
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


module e_quar(
    input CLOCK, LOA,
    input btnC,
    input btnU,
    input btnD,
    input btnR,
    input btnL,
    output reg [3:0] an,
    output reg [6:0] seg,
//    output dp
    output QUAR
    );
    
    // Pulses from buttons
    reg [3:0] ptr;
    reg [1:0] count = 0;
    wire PULC, PULU, PULD, PULR, PUL;
//    wire [1:0] ptrL, ptrR, new_ptr;
    wire clkC,clkU,clkD,clkR,clkL, FASTCLK;
    wire QUARTZ;
//    wire [2:0] btn_press;
//    wire [3:0] anC,anU,anD,anR,anL;
//    wire [6:0] segC,segU,segD,segR,segL;
//    wire dpC,dpU,dpD,dpR,dpL;
    // digits on display
    wire [6:0] seg0, seg1, seg2, seg3;
    wire [6:0] segq0, segq1, segq2, segq3, segtz0, segtz1, segtz2, segtz3;
    wire [3:0] char0, char1, char2, char3;
//    wire dp0,dp1,dp2,dp3;
//    assign dp = 1;
//    reg [3:0] char1, char2, char3, char4;
//    wire [3:0] charU1, charU2, charU3, charU4, charD1, charD2, charD3, charD4;
    
    single_pulse_debounce s0(CLOCK, btnC, clkC, PULC);
    set_quartz q0(CLOCK, PULC, LOA, QUAR); 
    single_pulse_debounce s1(CLOCK, btnU, clkU, PULU);
    single_pulse_debounce s2(CLOCK, btnD, clkD, PULD);
    single_pulse_debounce s3(CLOCK, btnR, clkR, PULR);
    single_pulse_debounce s4(CLOCK, btnL, clkL, PULL);
    show_char p0(clkU, PULU, PULD, ptr[0], segq0, char0);
    show_char p1(clkU, PULU, PULD, ptr[1], segq1, char1);
    show_char p2(clkU, PULU, PULD, ptr[2], segq2, char2);
    show_char p3(clkU, PULU, PULD, ptr[3], segq3, char3);
//    assign QUARTZ = (char3 == 4'd9) && (char2 == 4'd2) && (char1 == 4'd8) && (char0 == 4'd6);
    name n0(clkU, PULC, char0, char1, char2, char3, segq0, segq1, segq2, segq3,
            seg0, seg1, seg2, seg3);
    fastclock c0(CLOCK, FASTCLK);
    
//    left p0(ptr, ptrL);
//    right p1(ptr, ptrR);
//    assign new_ptr = PULR ? ptrR : (PULL ? ptrL : ptr);
//    up_press u0(CLOCK, char1, char2, char3, char4, new_ptr, anU, segU, dpU); 
//    down_press d0(CLOCK, char1, char2, char3, char4,  new_ptr, anD, segD, dpD);
    
    
    
    initial begin
        ptr = 4'b0001;
        an = 0;
        seg = 7'b0110110;
//        dp = 1;
//        char1 = 4'd10; char2 = 4'd10; char3 = 4'd10; char4 = 4'd10;
    end
    
//    assign btn_press = PULC ? 0 : (PULU ? 1 : (PULD ? 2 : (PULR ? 3 : 4)));
    
    always @ (posedge clkR) begin
        ptr <= (PULR && !ptr[0]) ? ptr >> 1 :
               (PULL && !ptr[3]) ? ptr << 1 : ptr;
    end
    always @ (posedge FASTCLK) begin
        
        count <= count+1;
        case (count)
        3'd0:
            begin
                an <= 4'b1110;
                seg <= seg0;
//                dp <= dp0;
            end
        3'd1:
            begin
                an <= 4'b1101;
                seg <= seg1;
//                dp <= dp1;
            end
        3'd2:
            begin
                an <= 4'b1011;
                seg <= seg2;
//                dp <= dp3;
            end
        3'd3:
            begin
                an <= 4'b0111;
                seg <= seg3;
//                dp <= dp3;
            end
        endcase
    end
        
    
endmodule

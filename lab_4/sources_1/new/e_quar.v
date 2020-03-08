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
    input btnC, btnU,btnD,btnR,btnL,
    output reg [3:0] an,
    output reg [6:0] seg,
    output [15:0] led,
    output ANTINE, ALLDONE
    );
    
    
    reg [3:0] ptr; // To track Anode Pointer (AP)
    reg [1:0] count = 0; // To display all 4 characters
    wire PULC, PULU, PULD, PULR, PULL; // To store Pulses for each button
    wire clkC,clkU,clkD,clkR,clkL, FASTCLK, MEDCLK; // Clocks for buttons / 381 Hz / 6 Hz
    wire QUAR, resetQUAR, resetFLAG; // Flags to set/reset QUAR

    // char on display
    wire [6:0] seg0, seg1, seg2, seg3; // To be displayed by board
    wire [6:0] segq0, segq1, segq2, segq3; // To store intermediate segments from pressing buttons
    
    // Get button presses
    single_pulse_debounce s0(CLOCK, btnC, clkC, PULC);
    single_pulse_debounce s1(CLOCK, btnU, clkU, PULU);
    single_pulse_debounce s2(CLOCK, btnD, clkD, PULD);
    single_pulse_debounce s3(CLOCK, btnR, clkR, PULR);
    single_pulse_debounce s4(CLOCK, btnL, clkL, PULL);
    
    // Clocks for display / button press  
    fastclock c0(CLOCK, FASTCLK); // 381 Hz
    medclock c1(CLOCK, MEDCLK); // 6Hz
    
    // Set QUAR mode when btnC pressed
    set_quartz q0(clkC, PULC, LOA, resetQUAR, QUAR, resetFLAG);
    // Reset to LOA when time out
    c_countdown_ant cd0(QUAR, CLOCK, resetFLAG, led, ANTINE, resetQUAR);
    
    // Get segment char for each segment
    show_char p0(clkU, MEDCLK, PULU, PULD, ptr[0], resetQUAR, segq0);
    show_char p1(clkU, MEDCLK, PULU, PULD, ptr[1], resetQUAR,segq1);
    show_char p2(clkU, MEDCLK, PULU, PULD, ptr[2], resetQUAR,segq2);
    show_char p3(clkU, MEDCLK, PULU, PULD, ptr[3], resetQUAR,segq3);

    // Set QUARTZ mode when pass is correct, and finish
    name n0(clkC, PULC, segq0, segq1, segq2, segq3,
            seg0, seg1, seg2, seg3, ALLDONE);
    
    initial begin
        ptr = 4'b0001; // initialise to AN0
        an = 0;
        seg = 7'b0110110;
    end
    
    always @ (posedge clkR) begin
        // Use bitshifting to set AP
        if (resetQUAR) begin
            ptr <= 4'b0001; // reset AP to 0
        end else begin
            ptr <= (PULR && !ptr[0]) ? ptr >> 1 :
                   (PULL && !ptr[3]) ? ptr << 1 : ptr;
        end
    end
    
    // Display 4 different letters by using 381 Hz clock to switch
    always @ (posedge FASTCLK) begin
        count <= count+1;
        case (count)
        3'd0:
            begin
                an <= 4'b1110;
                seg <= seg0;
            end
        3'd1:
            begin
                an <= 4'b1101;
                seg <= seg1;
            end
        3'd2:
            begin
                an <= 4'b1011;
                seg <= seg2;
            end
        3'd3:
            begin
                an <= 4'b0111;
                seg <= seg3;
            end
        endcase
    end
        
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2020 06:49:59 PM
// Design Name: 
// Module Name: one_bit_sim
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


module one_bit_sim(

    );
    
    reg sim_A, sim_B, sim_C0;
    
    wire sim_S, sim_C1;
    
    one_bit dut(sim_A, sim_B, sim_C0, sim_S, sim_C1);
    
    initial begin
        sim_A=0;sim_B=0;sim_C0=0;#10;
        sim_A=0;sim_B=1;sim_C0=0;#10;
        sim_A=1;sim_B=1;sim_C0=0;#10;
        sim_A=1;sim_B=1;sim_C0=1;#10;
    end
endmodule

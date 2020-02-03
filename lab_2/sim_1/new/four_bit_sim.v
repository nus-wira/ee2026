`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2020 06:26:57 PM
// Design Name: 
// Module Name: four_bit_sim
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


module four_bit_sim(

    );
    
    // Inputs
    reg [3:0] sim_A, sim_B;
    reg sim_CARRY_IN;
    
    // Outputs
    wire [3:0] sim_S;
    wire sim_CARRY_OUT;
    
    // Instantation
    four_bit dut (sim_A, sim_B, sim_CARRY_IN, sim_S, sim_CARRY_OUT);
    
    // Stimuli
    initial begin
        sim_A=4'b0011; sim_B=4'b0011; sim_CARRY_IN=1'b0; #100;
        sim_A=4'b1011; sim_B=4'b0111; sim_CARRY_IN=1'b0; #100;
        sim_A=4'b1111; sim_B=4'b1111; sim_CARRY_IN=1'b0; #100;
    end
endmodule

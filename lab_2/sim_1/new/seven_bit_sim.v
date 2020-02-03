`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2020 11:21:21 PM
// Design Name: 
// Module Name: seven_bit_sim
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


module seven_bit_sim(

    );
    // Inputs
    reg [6:0] sim_A, sim_B;
    
    // Outputs
    wire [6:0] sim_S;
    wire sim_COUT;
    
    // Instantation
    seven_bit dut(sim_A, sim_B, sim_S, sim_COUT);
    
    // Stimuli
    initial begin
        //Test cases here
        //#1: 42-21=21
        sim_A=7'b0101010;sim_B=7'b0010101;#100;
        //#2: 63-25=38
        sim_A=7'b0111111;sim_B=7'b0011001;#100;
        //#3: 34-6=28
        sim_A=7'b0100010;sim_B=7'b0000110;#100;
        //#4: 1-46=-45
        sim_A=7'b0000001;sim_B=7'b0101110;#100;
        //#5: 53-54=-1
        sim_A=7'b0110101;sim_B=7'b0110110;#100;
        //#6: 62-45=17
        sim_A=7'b0111110;sim_B=7'b0101101;#100;
        //#7: 47-23=24
        sim_A=7'b0101111;sim_B=7'b0010111;#100;
        //#8: -54-(-3)=-51
        sim_A=7'b1110110;sim_B=7'b1000011;#100;
        //#9: -41-(-20)=-21
        sim_A=7'b1101001;sim_B=7'b1010100;#100;
        //#10: 7-52=-45
        sim_A=7'b0000111;sim_B=7'b0110100;#100;
    end
endmodule

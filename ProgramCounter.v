`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(
        input nxinst,
        input override_en,
        input [7:0] override_pc,
        input cout,
        output reg [7:0] PC =0        
    );
    reg [7:0] nxPC = 8'b00000000;
    
    // At pos-edge of clock, get next instruction
    always @(posedge cout) 
        PC <= nxPC;
    
    // Check for new instruction issued  
    always @(posedge cout)
        if (override_en == 1'b0 && nxinst == 1'b1)
            nxPC <= nxPC + 1;
        else if (override_en == 1'b0 && nxinst == 1'b0)
            nxPC <= nxPC;
        else if (override_en==1) 
            begin
                nxPC <= override_pc;
            end
        else
            begin
                nxPC <= nxPC;
            end  
endmodule

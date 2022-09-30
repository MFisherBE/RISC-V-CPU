`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: top_lab7
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


module lab7_top(input next_inst,
                output [4:0] LEDs,
                input clk
    );
    
    wire cout;
    wire override_en;
    wire [7:0]override_pc;
    wire [7:0] PC;
    reg read_en = 1;
//    reg [31:0] inst;
    wire [6:0] opcode;
    wire [31:0] inst;
//    wire [31:0] ORinst;
    
    assign override_en = 1'b0;
    assign override_pc = 0;
    
    always @(*)
        begin
        read_en = 1;
//        override_en = 1'b0;
//        override_pc = 0;
        end
    
    clock_divider #(2) CDIV (clk,cout); 
    ProgramCounter PROCOUNT(next_inst,override_en,override_pc,cout,PC);
    memblock MEMORYBLOCK(cout,PC,read_en,inst);
    decode_block DECODEBLOCK(inst,opcode,LEDs);   
endmodule
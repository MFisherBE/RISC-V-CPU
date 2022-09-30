`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: memblock
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


module memblock(input pclk,
                input [7:0] PC,
                input read_en,
                output reg [31:0] inst
    );
    
    reg [31:0] mbank [127:0];
    initial begin
//        $display("Loading MEMORY BANK...");
//        $readmemb("C:/Users/micha/Documents/lab7meminit.txt", mbank,0,127);

//Arithmetic
        //R-Types
                    //func7(7) rs2(5)	rs1(5) func3(3) rd(5)  opcode(7)
        mbank[0] = 32'b00000000001000001000000110110011;   // ADD rd,rs1,rs2
        mbank[1] = 32'b01000000001000001000000110110011;   // SUB rd,rs1,rs2
        
        //I-Type(s)
                    //immediate(12) rs1(5) func(3) rd(5) opcode(7)
        mbank[2] = 32'b00000000000000010000000110010011;	// ADDI rd,rs1,imm
                  
//Logical
        //R-Types	
                    //func7(7) rs2(5)	rs1(5) func3(3) rd(5)  opcode(7)       
        mbank[3] = 32'b00000000001000001111000110110011; 	// AND rd,rs1,rs2
        mbank[4] = 32'b00000000001000001110000110110011;	// OR rd,rs1,rs2
        mbank[5] = 32'b00000000001000001001000110110011;	// SLL rd,rs2,rs2
        mbank[6] = 32'b00000000001000001101000110110011;	// SRL rd,rs1,rs2 
   
        //I-Type(s)
                    //immediate(12) rs1(5) func(3) rd(5) opcode(7)     
        mbank[7] = 32'b00000000000000010111000110010011;	// ANDI rd,rs1,imm
        mbank[8] = 32'b00000000000000010110000110010011;    // ORI rd,rs1,imm        

//Data Transfer
        //I-Type(s)
                    //immediate(12) rs1(5) func(3) rd(5) opcode(7)
        mbank [9] = 32'b00000000000000010010000110000011;		// LW rd,rs1,rs2

    //S-Type(s)
                    //imm(7)	rs2(5) rs1(5) func3(3) imm(5) opcode(7)
        mbank [10] = 32'b00000000001000001010000000100011;		// SW rd,rs1,rs2
                                       
//Conditional Branch
        //SB-Type(s) 
                    //imm(1) imm(6) rs2(5) rs1(5) func3(3) imm(4) imm(1) opcode(7)
        mbank [11] = 32'b00000000001000001000000001100011;	//BNQ rd,rs1,imm
        mbank [12] = 32'b00000000001000001001000001100011;	//BEQ rd,rs1,imm
                    
        //R-Type(s)
                    //func7(7) rs2(5)	rs1(5) func3(3) rd(5)  opcode(7)
        mbank [13] = 32'b00000000001000001010000110110011;		// SLT rd,rs1,rs2

//Unconditional Branch
        //UJ-Type(s) 
                    //imm(1) imm(10)    imm(1) imm(8)   rd(5) opcode(7)
        mbank [14] = 32'b00000000000000000000000111101111;		// JAL rd,imm
        end
    
    always @(posedge pclk)
        begin
            if (read_en == 1)
                begin
                    inst <= mbank[PC];
                end
            else
                begin
                    inst <= 0;
                end
        end  
endmodule
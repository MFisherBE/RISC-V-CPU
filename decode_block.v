`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: decode_block
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

// instruction decode module
module decode_block(
            input [31:0] fetched_inst,  // Fetched 32 bit instruction
            output [6:0] opcode,        // Operation code
            output reg [4:0] LEDs       // 5 Display LEDs
    );
    
    wire [6:0] func7;
    wire [2:0] func3;
    
    assign opcode = fetched_inst[6:0];
    assign func7 = fetched_inst[31:25];
    assign func3 = fetched_inst[14:12];
    
    always @(*)
    begin
        // Decode the issued operation
        case(opcode)
            7'b0110011:
            begin
                // ADD operation
                if (func3 == 0 && func7 ==0)
                    begin
                        LEDs = 5'b00001;    // ADD rd,rs1,rs2
                    end
                // SUBTRACT operation
                else if (func3 == 0 && func7 == 32)
                    begin
                        LEDs = 5'b00010;    // SUB rd,rs1,rs2
                    end
                // AND operation
                else if (func3 == 7 && func7 == 0)
                    begin
                        LEDs = 5'b00011;    // AND rd,rs1,rs2
                    end
                // OR operation
                else if (func3 == 6 && func7 == 0)
                    begin
                        LEDs = 5'b00100;    // OR rd,rs1,rs2
                    end
                // SHIFT LEFT LOGICAL operation
                else if (func3 == 1)
                    begin
                        LEDs = 5'b00101;    // SLL rd,rs1,rs2
                    end
                // SHIFT RIGHT LOGICAL operation
                else if (func3 == 5)
                    begin   
                        LEDs = 5'b00110;    // SRL rd,rs1,rs2
                    end
                // SET on LESS THAN operation
                else if (func3 == 2 && func7 == 0)
                    begin
                        LEDs = 5'b00111;    // SLT rd,rs1,rs2
                    end
                else
                    begin
                        LEDs = 5'b11111;    // Op not valid
                    end
            end
            7'b0010011:
            begin
                // ADD IMMEDIATE operation
                if (func3 == 0)
                    begin
                        LEDs = 5'b01000;    // ADDI rd,rs1,imm
                    end
                // AND IMMEDIATE operation
                else if (func3 == 7)
                    begin
                        LEDs = 5'b01001;    // ANDI rd,rs1,imm
                    end
                // OR IMMEDIATE operation
                else if (func3 == 6)
                    begin
                        LEDs = 5'b01010;    //ORI rd,rs1,imm
                    end
                else
                    begin
                        LEDs = 5'b11111;    // Op not valid
                    end
            end
            7'b0000011:
            begin
                // LOAD WORD operation
                if (func3 == 2)
                    begin
                        LEDs = 5'b01011;    // LW rd,rs1,rs2
                    end
                else
                    begin
                        LEDs = 5'b11111;    // Op not valid
                    end
            end
            7'b0100011:
            begin
                // STORE WORD operation
                if (func3 == 2)
                    begin
                        LEDs = 5'b01100;    // SW rd,rs1,rs2
                    end
                else
                    begin
                        LEDs = 5'b11111;    // Op not valid
                    end
            end
            7'b1100011:
            begin
                // BRANCH NOT EQUAL operation
                if (func3 == 0)
                    begin
                        LEDs = 5'b01101;    // BNQ rd,rs1,imm
                    end
                // BRANCH ON EQUAL operation    
                else if (func3 == 1)
                    begin
                        LEDs = 5'b01110;    // BEQ rd,rs1,imm
                    end
                else
                    begin
                        LEDs = 5'b11111;    // Op not valid
                    end
            end
            7'b1101111:
            begin
                // JUMP AND LINK operation
                if (func3 == 0)
                    begin
                        LEDs = 5'b01111;    // JAL rd,imm
                    end
                else
                    begin
                        LEDs = 5'b11111;    // Op not valid
                    end
            end
    endcase
    end 
endmodule


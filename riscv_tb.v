`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: lfsr_tb
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


module riscv_tb();
    
//  
    reg clk;
    reg next_inst;
    wire [4:0] LEDs;

    lab7_top UUT (next_inst, LEDs, clk);
    
    always
    #10 clk = ~clk;

    initial
    begin
        clk = 1'b0;
        next_inst = 1'b0;
        #2300
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
       #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;
        #500
        next_inst = 1'b0;
        #500
        next_inst = 1'b1;    
    end
    
   initial begin
   #100
   $display("clk = %b,next_inst = %b,LEDs = %b",clk,next_inst, LEDs);
   $display("End Simulation");    
   end   
endmodule

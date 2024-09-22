`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2024 01:26:11 PM
// Design Name: 
// Module Name: Round_Robin_Arbiter
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


module Round_Robin_Arbiter(
    input clk,
    input reset_n,
    input  [3:0] req,
    output [3:0] grant
    );
    
    wire [3:0] token;
    wire [3:0] prority_out1,prority_out2,prority_out3,prority_out4;
    
    Ring_Counter RingCounter
    (
    .clk(clk),
    .reset_n(reset_n),
    .count(token)
    );
    
    
    Priority_Logic PriorityLogic1(
    .clk(clk),
    .reset_n(reset_n),
    .En(token[3]),
    .In(req),
    .Out(prority_out1)
    );
    
    Priority_Logic PriorityLogic2(
    .clk(clk),
    .reset_n(reset_n),
    .En(token[2]),
    .In({req[0],req[3],req[2],req[1]}),
    .Out(prority_out2)
    );

    Priority_Logic PriorityLogic3(
    .clk(clk),
    .reset_n(reset_n),
    .En(token[1]),
    .In({req[1],req[0],req[3],req[2]}), // Different configuration of the input of the priority Logic to ensure no hogging
    .Out(prority_out3)
    );
      
    Priority_Logic PriorityLogic4(
    .clk(clk),
    .reset_n(reset_n),
    .En(token[0]),
    .In({req[0],req[3],req[2],req[1]}),
    .Out(prority_out4)
    );
    
    assign grant[0] = prority_out1[0] | prority_out2 [3] | prority_out3[2] | prority_out4[1];
    assign grant[1] = prority_out1[1] | prority_out2 [0] | prority_out3[3] | prority_out4[2];
    assign grant[2] = prority_out1[2] | prority_out2 [1] | prority_out3[0] | prority_out4[3];
    assign grant[3] = prority_out1[3] | prority_out2 [2] | prority_out3[1] | prority_out4[0];            
endmodule

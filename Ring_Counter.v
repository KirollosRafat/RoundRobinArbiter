`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2024 12:38:27 PM
// Design Name: 
// Module Name: Ring_Counter
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


module Ring_Counter#(parameter N = 4)(
    input clk,
    input reset_n,
    output reg [N-1:0] count
    );
    
    always@(posedge clk,negedge reset_n)
        begin
            if(~reset_n)
               count <=  {1'b1,{(N-1){1'b0}}};
            else
                count <= {count[0],count[(N-1):1]};   
        end
endmodule

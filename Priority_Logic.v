`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2024 12:56:47 PM
// Design Name: 
// Module Name: Priority_Logic
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


module Priority_Logic(
    input clk,
    input reset_n,
    input En,
    input      [3:0] In,
    output reg [3:0] Out
    );
    
    reg [3:0] out;
    
    always@(posedge clk,negedge reset_n)
        begin
        if(~reset_n) out <= 'b0;
        else out <= Out;
        end
    
    
    
    always@(In,En)
        begin
            if(~En)
                begin
                    Out = 'b0;
                end    
            else
                begin
                    if(In[0]) Out = 4'b0001;
                    else if(In[1]) Out = 4'b0010;
                    else if(In[2]) Out = 4'b0100;
                    else if(In[3]) Out = 4'b1000;
                    else out = 'b0;
                end
        end
endmodule

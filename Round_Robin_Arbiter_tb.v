`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2024 01:44:57 PM
// Design Name: 
// Module Name: Round_Robin_Arbiter_tb
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


module Round_Robin_Arbiter_tb();

// Declarations:
reg clk,reset;
reg  [3:0] request;
wire [3:0] grant;
localparam T = 20;

//Clock Generation
always
begin
clk = 1'b0;
#(T/2) clk = ~clk;
end

//Design Under Test:
Round_Robin_Arbiter RRA
(
.clk(clk),
.reset_n(reset),
.req(request),
.grant(grant)
);

//Stimulli:
initial
begin
$monitor("request = %b ---> grant_signal = %b",request,grant);
reset = 1'b0;
@(negedge clk)
reset = 1'b1;

#T request = 4'b0101;
#T request = 4'b1100;
#T request = 4'b0110;
#T request = 4'b1010;
#T request = 4'b1010;
#T request = 4'b0011;
#T request = 4'b1110;
#T request = 4'b1100;
#T request = 4'b1001;

end


endmodule

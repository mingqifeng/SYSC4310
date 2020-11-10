`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 17:59:00
// Design Name: 
// Module Name: lab3
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


module reg_file
(
	input clk,
	input rst,

	input [4:0] regA_addr,
	input [4:0] regB_addr,
	output [31:0] regA,
	output [31:0] regB,
	
	input [4:0] wr_addr,
	input [31:0] data,
	input we
);

reg [31:0] registers [31:0];
integer i;

always@(posedge clk)
begin
	if(rst)
	begin
		for(i=0;i<32;i= i+1)
			registers[i] <= 32'd0;
	end
	else
	begin
		if(we)
		begin
			registers[wr_addr] <= data;
		end
	end
end

assign regA = registers[regA_addr];
assign regB = registers[regB_addr];

endmodule

module Imemory
(
	input clk,
	input rst,

	input [31:0] addr,
	output [31:0] instruction,
	
);

reg [31:0] registers [1023:0];
integer i;

always@(posedge clk)
begin
	if(rst)
	begin
		for(i=0;i<1024;i= i+1)
			registers[i] <= 32'd0;
	end
	else
	begin
		
	end
end

assign instruction = registers[addr];

endmodule
       

module Dmemory
(
	input clk,
	input rst,

	input [31:0] raddr,
	output [31:0] data_out,
	
	input [31:0] wr_addr,
	input [31：0] data_in,
	input we
);

reg [31:0] registers[1023:0];
integer i;

always@(posedge clk)
begin 
	if(rst)
	begin
		for(i=0;i<1023;i=i+1)
			registers[i] <= 32'd0;
	end
	else
	begin
		if(we)
		begin 
			registers[wr_addr]<= data_in;
		end
	end
end

assign data_out = registers[r_addr];

endmodule

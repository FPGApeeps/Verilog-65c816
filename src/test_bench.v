// This file is part of Verilog-65c816.
// 
// Copyright 2017 by FPGApeeps
// 
// Verilog-65c816 is free software: you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
// 
// Verilog-65c816 is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public License along
// with Verilog-65c816.  If not, see <http://www.gnu.org/licenses/>.


`include "src/inc/test_ram_defines.v"
`include "src/inc/cpu_defines.v"

module TestBench;

	`include "src/inc/generic_params.v"

	parameter __counter_msb = 2;

	reg __clk, __rst;
	reg [__counter_msb:0] __counter;

	wire __ram_we; 

	wire [`TR_ADDR_MSB_POS:0] __ram_addr;
	wire [`TR_DATA_MSB_POS:0] __ram_data_in;
	wire [`TR_DATA_MSB_POS:0] __ram_data_out;
	wire __ram_data_ready;




	initial
	begin
		__clk = 0;
		__rst = __true;
		__counter = 0;
	end

	// Clock signal generator
	always
	begin
		#1 __clk = !__clk;
	end


	always @ (posedge __clk)
	begin
		if (!__counter[__counter_msb])
		begin
			__counter <= __counter + 1;
		end

		else
		begin
			__rst <= __false;
		end
		
	end


	TestRam ram(.clk(__clk), .we(__ram_we),
		.addr(__ram_addr),
		.data_in(__ram_data_in), 
		.data_out(__ram_data_out),
		.data_ready(__ram_data_ready));
	
	//Cpu cpu(.clk(__clk), .rst(__rst)
	

	initial
	begin
		

	end


endmodule



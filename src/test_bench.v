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


`include "src/test_ram_defines.vinc"

module TestBench;

	reg clk, rst;

	wire some_ram_we; 

	wire [`TR_ADDR_MSB_POS:0] some_ram_addr;
	wire [`TR_DATA_MSB_POS:0] some_ram_data_in;
	wire [`TR_DATA_MSB_POS:0] some_ram_data_out;
	wire some_ram_data_ready;


	initial
	begin
		clk = 0;
		rst = 0;
	end

	// Clock signal generator
	always
	begin
		#1 clk = !clk;
	end



	TestRam some_ram(.clk(clk), .we(some_ram_we),
		.addr(some_ram_addr),
		.data_in(some_ram_data_in), 
		.data_out(some_ram_data_out),
		.data_ready(some_ram_data_ready));


endmodule



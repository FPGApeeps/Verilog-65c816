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
`include "src/inc/cpu_enums.v"

module TestBench;

	// Parameters
	`include "src/inc/generic_params.v"

	parameter __counter_msb = 2;



	// Test bench variables
	reg [__counter_msb:0] __counter;
	reg __init_done;


	// Connections
	reg __clk, __rst;
	//reg __half_clk;

	//reg __cpu_enable;
	wire __cpu_enable;
	wire [`CPU_DATA_MSB_POS:0] __cpu_data_in;

	wire __cpu_req_rdwr, __cpu_which_rdwr;

	wire [`CPU_ACTUAL_ADDR_MSB_POS:0] __cpu_addr;

	wire [`CPU_DATA_MSB_POS:0] __cpu_data_out;



	wire __ram_we; 

	wire [`TR_ADDR_MSB_POS:0] __ram_addr;
	wire [`TR_DATA_MSB_POS:0] __ram_data_in;
	wire [`TR_DATA_MSB_POS:0] __ram_data_out;
	wire __ram_data_ready;


	// Connect the CPU and RAM together
	assign __ram_we = ((__cpu_req_rdwr) 
		&& (__cpu_which_rdwr == `ENUM__CPU_WH_RDWR__WRITE));
	assign __ram_addr = __cpu_addr;
	assign __ram_data_in = __cpu_data_out;
	assign __cpu_data_in = __ram_data_out;


	//assign __cpu_enable = ((!__rst) && (__cpu_req_rdwr 
	//	&& __ram_data_ready));
	assign __cpu_enable = ((!__rst) 
		&& (__cpu_req_rdwr ? __ram_data_ready : __true));


	initial
	begin
		__init_done = __false;


		__clk = 0;
		//__half_clk = 0;


		// Reset the CPU
		__rst = __true;
		//__cpu_enable = __false;


		__counter = 0;
	end

	// Clock signal generators
	always
	begin
		#1 __clk <= !__clk;
		//#2 __half_clk <= !__half_clk;
	end


	// Wait to clear __rst in this test bench.
	// 
	// This always block will stop doing anything important after clearing
	// the CPU's rst input.
	always @ (posedge __clk)
	begin
		if (!__counter[__counter_msb])
		begin
			//__init_done <= __false;

			__counter <= __counter + 1;
		end

		//else if (__counter[__counter_msb] && !__counter[0])
		else if (!__init_done)
		begin
			__init_done <= __true;

			__rst <= __false;
			//__cpu_enable <= __true;
		end

	end

	always @ (posedge __clk)
	begin

	end


	TestRam ram(.clk(__clk), .we(__ram_we),
		.addr(__ram_addr),
		.data_in(__ram_data_in), 
		.data_out(__ram_data_out),
		.data_ready(__ram_data_ready));

	//Cpu cpu(.clk(__half_clk), .rst(__rst), .enable(__cpu_enable),
	//	.data_in(__cpu_data_in), .req_rdwr(__cpu_req_rdwr),
	//	.which_rdwr(__cpu_which_rdwr), .addr(__cpu_addr),
	//	.data_out(__cpu_data_out));
	Cpu cpu(.clk(__clk), .rst(__rst), .enable(__cpu_enable),
		.data_in(__cpu_data_in), .req_rdwr(__cpu_req_rdwr),
		.which_rdwr(__cpu_which_rdwr), .addr(__cpu_addr),
		.data_out(__cpu_data_out));


endmodule



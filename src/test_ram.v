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


`include "src/inc/misc_defines.v"
`include "src/inc/test_ram_defines.v"

// Block RAM test module
module _InternalTestRam(input wire clk, 

	// Write enable
	input wire we,

	// Address
	input wire [`TR_ADDR_MSB_POS:0] addr,

	// Data in
	input wire [`TR_DATA_MSB_POS:0] data_in,

	// Data out
	output reg [`TR_DATA_MSB_POS:0] data_out);

	reg [`TR_DATA_MSB_POS:0] __mem[0:`_ARR_SIZE_THING(`_TR_ADDR_WIDTH)];

	initial $readmemh("readmemh_input.txt.ignore", __mem);

	always @ (posedge clk)
	begin
		if (we)
		begin
			__mem[addr] <= data_in;
		end

		data_out <= __mem[addr];
	end

endmodule


module TestRam(input wire clk,

	input wire req_rdwr,

	// Write enable
	input wire we,

	// Address
	input wire [`TR_ADDR_MSB_POS:0] addr,

	// Data in
	input wire [`TR_DATA_MSB_POS:0] data_in,

	// Data out
	output wire [`TR_DATA_MSB_POS:0] data_out,

	// data_ready goes high when data is ready
	output reg data_ready);


	reg __can_rdwr;


	// "pt" is short for "passthrough"
	wire __pt_we;
	wire [`TR_ADDR_MSB_POS:0] __pt_addr;
	wire [`TR_DATA_MSB_POS:0] __pt_data_in, __pt_data_out;

	// Inputs to internal_test_ram
	assign __pt_we = we;
	assign __pt_addr = addr;
	assign __pt_data_in = data_in;

	// Outputs from internal_test_ram
	assign data_out = __pt_data_out;


	_InternalTestRam internal_test_ram(.clk(clk), .we(__pt_we), 
		.addr(__pt_addr), .data_in(__pt_data_in),
		.data_out(__pt_data_out));


	initial data_ready = 0;
	initial __can_rdwr = 1;


	always @ (posedge clk)
	begin
		__can_rdwr <= !__can_rdwr;

		if (!req_rdwr)
		begin
			data_ready <= 0;
		end

		else // if (req_rdwr)
		begin
			data_ready <= __can_rdwr;
		end
	end



endmodule


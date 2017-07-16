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


`include "src/inc/cpu_defines.v"
`include "src/inc/cpu_enums.v"


module Cpu(input wire clk, input wire rst, input wire enable,
	input wire [`CPU_DATA_MSB_POS:0] data_in,

	// If we're requesting a read or write
	output reg req_rdwr,


	// If req_rdwr == 1, then are we requesting a read or a write?  
	// 
	// Here would be a good place to use an enum if this project were
	// written in SystemVerilog.
	//
	// Values used with this output reg are `ENUM__CPU_WH_RDWR__READ and
	// `ENUM__CPU_WH_RDWR__WRITE, which are defined "src/inc/cpu_enums.v"
	output reg which_rdwr,

	// Address we want to read from or write to
	//output reg [`CPU_FAR_ADDR_MSB_POS:0] addr,


	// Just try a 16-bit address space for now.  We will switch to a 24-bit
	// address space later.
	output reg [`CPU_ABS_ADDR_MSB_POS:0] addr,

	output reg [`CPU_DATA_MSB_POS:0] data_out);




	// Parameters
	`include "src/inc/generic_params.v"
	`include "src/inc/cpu_state_params.v"
	`include "src/inc/cpu_opcode_params.v"


	// Buffer MSB positions
	parameter __state_msb_pos = `_ENUM_MP__CPU_STATE;


	// which_rdwr stuff
	parameter __wh_rdwr__read = `ENUM__CPU_WH_RDWR__READ;
	parameter __wh_rdwr__write = `ENUM__CPU_WH_RDWR__WRITE;


	`include "src/inc/cpu_reg_params.v"



	// Internal buffers
	reg [__buf_byte_msb_pos:0] __data_in_buf;
	reg [__buf_byte_msb_pos:0] __opcode;


	// State machine thing
	reg [__state_msb_pos:0] __state;




	// Processor Registers
	reg [__reg_c_msb_pos:0] __reg_c;
	reg [__reg_index_big_msb_pos:0] __reg_x, __reg_y;

	//reg [__reg_sp_msb_pos:0] __reg_sp;
	//reg [__reg_pc_msb_pos:0] __reg_pc;



	always @ (posedge clk)
	begin
		if (rst)
		begin
			// Clear outputs
			req_rdwr <= __false;
			//which_rdwr <= __wh_rdwr__read;
			addr <= `_CPU_ABS_ADDR_WIDTH'h0000;
			data_out <= `_CPU_DATA_WIDTH'h00;
			__data_in_buf <= 0;
			__opcode <= 0;


			__reg_c <= 0;
			__reg_x <= 2;
			__reg_y <= 5;


			// Initial state
			__state <= __st_emu__reset;

		end

		else if (enable)
		begin
			case (__state)
				__st_emu__reset:
				begin
					__state <= __state + 1;
				end

				default:
				begin
					$display("Unknown __state!\n");
					$display("%d, %d, %d\n", __reg_c, __reg_x, __reg_y);
					$finish;
				end
			endcase
			
		end

	end

endmodule

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


`include "src/cpu_defines.vinc"


module Cpu(input wire clk, input wire rst, input wire enable,
	input wire [`CPU_DATA_MSB_POS:0] data_in,

	// If we're requesting a read or write
	output reg req_rdwr,


	// If req_rdwr == 1, then are we requesting a read or a write?  
	// 
	// Here would be a good reason to use an enum if this project were
	// written in SystemVerilog.
	output reg which_rdwr,

	// Address we want to read from or write to
	//output reg [`CPU_FAR_ADDR_MSB_POS:0] addr,
	output reg [`CPU_ABS_ADDR_MSB_POS:0] addr,

	output reg [`CPU_DATA_MSB_POS:0] data_out);


	// Parameters
	`include "src/cpu_params.vinc"


	reg [`CPU_DATA_MSB_POS:0] __data_in_buf;


	always @ (posedge clk)
	begin
		if (rst)
		begin
			

		end

		else if (!enable)
		begin
			

		end

	end

endmodule

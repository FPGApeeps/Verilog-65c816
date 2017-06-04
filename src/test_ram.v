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

// Block RAM test module
module test_ram( input wire clk, 
	
	// Write enable
	input wire we,
	
	// Address
	input wire [`tr_addr_msb_pos:0] addr,
	
	input wire [`tr_data_msb_pos:0] data_in,
	
	output reg [`tr_data_msb_pos:0] data_out );
	
	reg [`tr_data_msb_pos:0] mem[0:`tr_addr_msb_pos];
	
	initial $readmemh( "readmemh_input.txt.ignore", mem );
	
	always @ ( posedge clk )
	begin
		if (we)
		begin
			mem[addr] <= data_in;
		end
		
		data_out <= mem[addr];
	end
	
	
endmodule


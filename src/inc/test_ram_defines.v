// This file is part of Verilog-65c816 CPU.
// 
// Copyright 2017 by FPGApeeps
// 
// Verilog-65c816 CPU is free software: you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
// 
// Verilog-65c816 CPU is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public License along
// with Verilog-65c816 CPU.  If not, see <http://www.gnu.org/licenses/>.


`ifndef test_ram_defines_vinc
`define test_ram_defines_vinc

`include "src/inc/misc_defines.v"


//// Don't try this much RAM with a real block RAM
//`define _TR_ADDR_WIDTH 24
//`define _TR_ADDR_WIDTH 18
`define _TR_ADDR_WIDTH 16
`define TR_ADDR_MSB_POS `WIDTH_TO_MSB_POS(`_TR_ADDR_WIDTH)


// 8-bit accesses
`define _TR_DATA_WIDTH 8
`define TR_DATA_MSB_POS `WIDTH_TO_MSB_POS(`_TR_DATA_WIDTH)



`endif		// test_ram_defines_vinc

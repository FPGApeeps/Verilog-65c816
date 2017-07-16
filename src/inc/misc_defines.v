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


`ifndef misc_defines_vinc
`define misc_defines_vinc

`define WIDTH_TO_MSB_POS(width) (width - 1)
`define BPRANGE_TO_MASK(bit_pos_hi, bit_pos_lo) \
	((1 << (bit_pos_hi - bit_pos_lo + 1)) - 1)
`define BPRANGE_TO_SHIFTED_MASK(bit_pos_hi, bit_pos_lo) \
	(((1 << (bit_pos_hi - bit_pos_lo + 1)) - 1) << bit_pos_lo)

`define _ARR_SIZE_THING(bit_width) ((1 << (bit_width)) - 1)
`define _ENUM_INC(thing) (thing + 1)

`endif		// misc_defines_vinc

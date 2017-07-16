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


`ifndef cpu_enums_vinc
`define cpu_enums_vinc

`include "src/inc/enum_defines.v"
`include "src/inc/cpu_defines.v"


// Fake enums
// If this project were written in SystemVerilog, real enums would be used
// instead of these fake ones.



// which_rdwr
`define _ENUM_WI__CPU_WH_RDWR 1
`define _ENUM_MP__CPU_WH_RDWR `WIDTH_TO_MSB_POS(_ENUM_WI__CPU_WH_RDWR)
`define ENUM__CPU_WH_RDWR__READ `_ENUM_WI__CPU_WH_RDWR'h0
`define ENUM__CPU_WH_RDWR__WRITE `_ENUM_INC(`ENUM__CPU_WH_RDWR__READ)



// __state

// Use 9 for the number of bits here just as an initial value.  It is
// possible that we will use more than just 512 states, but we'll assume
// this is enough for now.
`define _ENUM_WI__CPU_STATE 9
`define _ENUM_MP__CPU_STATE `WIDTH_TO_MSB_POS(`_ENUM_WI__CPU_STATE)

////// Emulation mode
////`define ENUM__CPU_STATE__RESET `_ENUM_WI__CPU_STATE'h000
//////`define ENUM__CPU_STATE__

`endif		// cpu_enums_vinc

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


//`ifndef cpu_state_params_vinc
//`define cpu_state_params_vinc

`include "src/inc/misc_defines.v"

//// Emulation mode
//
//// Reset
//parameter __st_emu__reset = `_ENUM_WI__CPU_STATE'h000;
//
//
//// Test load 8-bit value
//parameter __st_emu__test_load = `_ENUM_INC(__st_emu__reset);
//
//
//// Test store 8-bit value
//parameter __st_emu__test_store = `_ENUM_INC(__st_emu__test_load);


// This is an X macro
`define _LIST_OF_CPU_STATES \
\
`X(__st_emu__reset) \
\
`X(__st_emu__test_load_0) \
`X(__st_emu__test_load_1) \
`X(__st_emu__test_load_2) \
\
`X(__st_emu__test_store_0) \
`X(__st_emu__test_store_1) \
`X(__st_emu__test_store_2)

//`endif		// cpu_state_params_vinc

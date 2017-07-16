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

`ifndef cpu_opcode_params_vinc
`define cpu_opcode_params_vinc


`include "src/inc/enum_defines.v"


//// CPU opcodes
//// BRK
//parameter __op__brk = `_CPU_OPCODE_WIDTH'h00;
//
//// ORA (dp, X)
//parameter __op__ora__dp_index_indir_com_x = `_CPU_OPCODE_WIDTH'h01;
//
//// COP
//parameter __op__cop = `_CPU_OPCODE_WIDTH'h02;
//
//// ORA sr, S
//parameter __op__ora__stack_rel = `_CPU_OPCODE_WIDTH'h03;
//
//// TSB dp
//parameter __op__tsb__dp = `_CPU_OPCODE_WIDTH'h04;
//
//// ORA dp
//parameter __op__ora__dp = `_CPU_OPCODE_WIDTH'h05;



// NOP
parameter __op__nop = `_CPU_OPCODE_WIDTH'hea;


`endif		// cpu_opcode_params_vinc

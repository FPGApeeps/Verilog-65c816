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


`ifndef cpu_defines_vinc
`define cpu_defines_vinc

`include "src/inc/misc_defines.v"


// Far addresses
`define _CPU_FAR_ADDR_WIDTH 24
`define CPU_FAR_ADDR_MSB_POS `WIDTH_TO_MSB_POS(`_CPU_FAR_ADDR_WIDTH)

// Absolute addresses
`define _CPU_ABS_ADDR_WIDTH 16
`define CPU_ABS_ADDR_MSB_POS `WIDTH_TO_MSB_POS(`_CPU_ABS_ADDR_WIDTH)

// Direct page addresses
`define _CPU_DP_ADDR_WIDTH 8
`define CPU_DP_ADDR_MSB_POS `WIDTH_TO_MSB_POS(`CPU_DP_ADDR_MSB_POS)



// IMPORTANT!
// 
// Change these to use far addresses later on in development!
// 
// IMPORTANT!
`define _CPU_ACTUAL_ADDR_WIDTH `_CPU_ABS_ADDR_WIDTH
`define CPU_ACTUAL_ADDR_MSB_POS `CPU_ABS_ADDR_MSB_POS



// Data bank, program bank
`define _CPU_BANK_WIDTH 8
`define CPU_BANK_MSB_POS `WIDTH_TO_MSB_POS(`_CPU_BANK_WIDTH)




// Data bus
`define _CPU_DATA_WIDTH 8
`define CPU_DATA_MSB_POS `WIDTH_TO_MSB_POS(`_CPU_DATA_WIDTH)



// Opcode size stuff
`define _CPU_OPCODE_WIDTH 8
`define CPU_OPCODE_MSB_POS `WIDTH_TO_MSB_POS(`_CPU_OPCODE_WIDTH)



// Registers

// Accumulator:  A, B, C
// Bits 15-0 (C)
`define _CPU_REG_C_WIDTH 16
`define CPU_REG_C_MSB_POS `WIDTH_TO_MSB_POS(`_CPU_REG_C_WIDTH)


// Bits 15-8 (B)
`define _CPU_REG_B_WIDTH 8
`define CPU_REG_B_MSB_POS `CPU_REG_C_MSB_POS
`define CPU_REG_B_LSB_POS `_CPU_REG_B_WIDTH

// Bits 7-0 (A)
`define _CPU_REG_A_WIDTH 8
`define CPU_REG_A_MSB_POS (`CPU_REG_B_LSB_POS - 1)
`define CPU_REG_A_LSB_POS 0



// Index registers:  X, Y

// Bits 15-0
`define _CPU_REG_INDEX_BIG_WIDTH 16
`define CPU_REG_INDEX_BIG_MSB_POS \
	`WIDTH_TO_MSB_POS(`_CPU_REG_INDEX_BIG_WIDTH)


// Bits 15-8
`define _CPU_REG_INDEX_HI_WIDTH 8
`define CPU_REG_INDEX_HI_MSB_POS `CPU_REG_INDEX_BIG_MSB_POS
`define CPU_REG_INDEX_HI_LSB_POS `_CPU_REG_INDEX_HI_WIDTH

// Bits 7-0
`define _CPU_REG_INDEX_LO_WIDTH 8
`define CPU_REG_INDEX_LO_MSB_POS (`CPU_REG_INDEX_HI_LSB_POS - 1)
`define CPU_REG_INDEX_LO_LSB_POS 0



// Stack Pointer (SP)


// Native Mode
`define _CPU_REG_SP_WIDTH 16
`define CPU_REG_SP_MSB_POS `WIDTH_TO_MSB_POS(`_CPU_REG_SP_WIDTH)


// Emulation Mode

// Bits 15-8 (Always 0x01 in Emulation Mode)
`define _CPU_REG_SP_EMU_HI_WIDTH 8
`define CPU_REG_SP_EMU_HI_MSB_POS `WIDTH_TO_MSB_POS(`_CPU_REG_SP_WIDTH)
`define CPU_REG_SP_EMU_HI_LSB_POS `_CPU_REG_SP_EMU_HI_WIDTH

// Bits 7-0
`define _CPU_REG_SP_EMU_LO_WIDTH 8
`define CPU_REG_SP_EMU_LO_MSB_POS (`CPU_REG_SP_EMU_HI_LSB_POS - 1)
`define CPU_REG_SP_EMU_LO_LSB_POS 0



// Program Counter (PC)

// The PC is officially 16-bit as far as I can tell, even in Native Mode.
`define _CPU_REG_PC_WIDTH 16
`define CPU_REG_PC_MSB_POS `WIDTH_TO_MSB_POS(`_CPU_REG_PC_WIDTH)


`endif		// cpu_defines_vinc

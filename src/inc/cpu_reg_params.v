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



// Accumulator
// C
parameter __reg_c_msb_pos = `CPU_REG_C_MSB_POS;

// B
parameter __reg_b_msb_pos = `CPU_REG_B_MSB_POS;
parameter __reg_b_lsb_pos = `CPU_REG_B_LSB_POS;

// A
parameter __reg_a_msb_pos = `CPU_REG_A_MSB_POS;
parameter __reg_a_lsb_pos = `CPU_REG_A_LSB_POS;



// Index registers:  X, Y
parameter __reg_index_big_msb_pos = `CPU_REG_INDEX_BIG_MSB_POS;


// Bits 15-8
parameter __reg_index_hi_msb_pos = `CPU_REG_INDEX_HI_MSB_POS;
parameter __reg_index_hi_lsb_pos = `CPU_REG_INDEX_HI_LSB_POS;

// Bits 7-0
parameter __reg_index_lo_msb_pos = `CPU_REG_INDEX_LO_MSB_POS;
parameter __reg_index_lo_lsb_pos = `CPU_REG_INDEX_LO_LSB_POS;

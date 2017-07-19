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


// These are used for debugging purposes... as the names suggest.
parameter __debug_addr_0 = `_CPU_ACTUAL_ADDR_WIDTH'hf000;
parameter __debug_addr_1 = __debug_addr_0 + `_CPU_ACTUAL_ADDR_WIDTH'h100;
parameter __debug_addr_2 = __debug_addr_0 + `_CPU_ACTUAL_ADDR_WIDTH'h500;

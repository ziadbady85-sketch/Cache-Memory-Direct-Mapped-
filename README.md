# Cache Memory (Direct-Mapped)

## Overview
This project implements a simple Direct-Mapped Cache Memory in Verilog.

The cache checks if the requested address exists (hit) or not (miss).  
On a miss, data is fetched from RAM and stored in the cache.

## Features
- Direct-mapped cache architecture
- Configurable parameters (data width, tag width, number of lines)
- Hit/Miss detection
- Valid bit implementation
- Automatic cache update on miss

## Parameters
- DATA_WIDTH = 8
- LINES = 4
- TAG_WIDTH = 6

## Inputs
- clk
- rst
- re_en (read enable)
- address
- data_ram

## Outputs
- hit
- read_ram
- data_out
- addr2ram

## How It Works
- Cache uses index bits to select a line
- Tag is compared to determine hit or miss
- If miss:
  - Read from RAM
  - Update cache line
- If hit:
  - Return data directly

## Simulation
- Apply reset
- Send addresses
- Observe:
  - hit signal
  - read_ram signal
  - data_out

## Future Improvements
- Set-Associative Cache
- Write Policy (Write-through / Write-back)
- LRU Replacement Policy

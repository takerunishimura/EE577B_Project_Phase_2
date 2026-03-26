# EE577B Project Phase 2 — Cardinal Processor

**University of Southern California | EE577B Spring 2026 | Group 14**

## Overview

This repository contains the RTL design and verification of the 64-bit Cardinal Processor, implemented in Verilog as part of the EE577B project series. The processor executes the full Cardinal ISA with support for variable data widths (WW bits), and is designed to be fully synthesizable for later integration with the Cardinal Mesh Network from Phase 1.

## Architecture

The processor implements a 4-stage pipeline:

| Stage | Description |
|---|---|
| **IF** | Instruction Fetch — 32-bit PC increments by 4 each cycle |
| **ID** | Instruction Decode & Register Fetch — branch resolution happens here |
| **EX/MEM** | ALU/SFU Execution & Memory Access (combined due to immediate-only addressing) |
| **WB** | Write Back to register file |

## Key Design Features

- 32 × 64-bit general-purpose register file (2 async read ports, 1 sync write port)
- R0 hardwired to zero and read-only
- Synchronous active-high reset — all pipeline registers cleared at reset
- Branch resolved in ID stage — taken branch flushes the IF stage (no delayed slots)
- SFU instantiates Synopsys DesignWare components for division and square root
- Variable data width support via WW bits per the Cardinal ISA
- Simulation clock: 4ns (250 MHz)

## Tools

- **Simulation:** Cadence NC-Sim
- **Synthesis:** Synopsys Design Compiler with gscl45nm 45nm library
- **DesignWare:** Used for SFU higher-level arithmetic operations

## Work Division

> **Note:** This split is tentative and may be adjusted as development progresses.

| Module | Owner |
|---|---|
| ALU | Tak |
| Instruction Decode / Control | Tak |
| Pipeline integration & branch flushing | Tak |
| Register File | Alexandra |
| SFU (DesignWare instantiation) | Alexandra |
| Top-level `cardinal_processor.v` | Alexandra |
| Testbench & `.fill` files | Alexandra |

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

# EE577B Project Phase 2 — Cardinal Processor

**University of Southern California | EE577B Spring 2026 | Group 14**

---

## Overview

This repository contains the RTL design and verification of the 64-bit Cardinal Processor, implemented in Verilog as part of the EE577B project series. The processor executes the full Cardinal ISA with support for variable data widths (WW bits), and is fully synthesizable for later integration with the Cardinal Mesh NoC in Phase 3.

---

## Architecture

The processor implements a 4-stage pipeline:

| Stage | Description |
|---|---|
| **IF** | Instruction Fetch — 32-bit PC increments by 4 each cycle |
| **ID** | Instruction Decode & Register Fetch — branch resolution happens here |
| **EX/MEM** | ALU/SFU Execution & Memory Access (combined due to immediate-only addressing) |
| **WB** | Write Back to register file |

---

## Key Design Features

- 32 × 64-bit general-purpose register file (2 async read ports, 1 sync write port)
- R0 hardwired to zero and read-only
- Synchronous active-high reset — all pipeline registers cleared at reset
- **Data forwarding** — resolves RAW hazards without stalling where possible
- **Load-use stall detection** — inserts a bubble when a load is immediately followed by a dependent instruction
- **Branch hazard handling** — branch resolved in ID stage; taken branch flushes the IF stage (no delayed slots)
- SFU instantiates Synopsys DesignWare components (DW_div, DW_sqrt) for division and square root
- Variable data width support via WW bits per the Cardinal ISA
- Simulation clock: 4ns (250 MHz)

---

## File Structure

```
EE577B_Project_Phase_2/
├── processor/
│   ├── design/        # Cardinal processor .v design files (cardinal_cpu.v, alu.v, etc.)
│   ├── tb/            # Processor testbench and .fill files
│   ├── include/
│   ├── scripts/
│   ├── src/
│   ├── netlist/
│   ├── report/
│   ├── reports/
│   └── work/
├── router/
│   ├── design/        # Router .v design files (carried from Phase 1)
│   ├── tb/
│   ├── include/
│   ├── scripts/
│   ├── src/
│   ├── netlist/
│   ├── report/
│   ├── reports/
│   └── work/
├── mesh/
│   ├── design/        # Mesh interconnect .v files
│   ├── tb/
│   ├── include/
│   ├── scripts/
│   ├── src/
│   ├── netlist/
│   ├── report/
│   ├── reports/
│   └── work/
├── nic/
│   ├── design/        # NIC .v design files
│   ├── tb/
│   ├── include/
│   ├── scripts/
│   ├── src/
│   ├── netlist/
│   ├── report/
│   ├── reports/
│   └── work/
├── .gitignore
└── README.md
```

---

## Tools

- **Simulation:** Cadence NC-Sim
- **Synthesis:** Synopsys Design Compiler with gscl45nm 45nm library
- **DesignWare:** DW_div, DW_sqrt for SFU arithmetic operations

---

## Work Division

| Module | Owner |
|---|---|
| ALU | Tak |
| Instruction Decode / Control | Tak |
| Pipeline integration, forwarding, stall & branch flushing | Tak |
| Register File | Alexandra |
| SFU (DesignWare instantiation) | Alexandra |
| Top-level processor module | Alexandra |
| Testbench & `.fill` files | Alexandra |

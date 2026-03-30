#!/usr/bin/env python3
# gen_imem2.py
# Generates imem_2.fill - tests all Cardinal ISA instructions with all WW settings
# Results stored to memory starting at address 32 for verification

lines = []

# ================================================================
# Instruction encoding helpers
# ================================================================
def vld(rD, addr):
    inst = (0b100000 << 26) | (rD << 21) | addr
    return f"{inst:08X}  // VLD r{rD}, {addr}"

def vsd(rD, addr):
    inst = (0b100001 << 26) | (rD << 21) | addr
    return f"{inst:08X}  // VSD r{rD}, {addr}"

def vnop():
    return f"F0000000  // VNOP"

def rtype(rD, rA, rB, ww, func, name):
    inst = (0b101010 << 26) | (rD << 21) | (rA << 16) | (rB << 11) | (ww << 6) | func
    ww_names = {0b00: 'b', 0b01: 'h', 0b10: 'w', 0b11: 'd'}
    return f"{inst:08X}  // {name}{ww_names[ww]} r{rD}, r{rA}, r{rB}"

def rtype2(rD, rA, ww, func, name):
    # For instructions with no rB (VNOT, VMOV, VRTTH, VSQEU, VSQOU, VSQRT)
    inst = (0b101010 << 26) | (rD << 21) | (rA << 16) | (0 << 11) | (ww << 6) | func
    ww_names = {0b00: 'b', 0b01: 'h', 0b10: 'w', 0b11: 'd'}
    return f"{inst:08X}  // {name}{ww_names[ww]} r{rD}, r{rA}"

# Function codes
VAND  = 0b000001
VOR   = 0b000010
VXOR  = 0b000011
VNOT  = 0b000100
VMOV  = 0b000101
VADD  = 0b000110
VSUB  = 0b000111
VMULEU = 0b001000
VMULOU = 0b001001
VSLL  = 0b001010
VSRL  = 0b001011
VSRA  = 0b001100
VRTTH = 0b001101
VDIV  = 0b001110
VMOD  = 0b001111
VSQEU = 0b010000
VSQOU = 0b010001
VSQRT = 0b010010

# WW values
WW_B = 0b00  # 8-bit
WW_H = 0b01  # 16-bit
WW_W = 0b10  # 32-bit
WW_D = 0b11  # 64-bit

# ================================================================
# Load source data from dmem
# dmem[0]  = 0000000000000000
# dmem[1]  = 1111111111111111
# dmem[2]  = 2222222222222222
# dmem[3]  = 3333333333333333
# dmem[4]  = 4444444444444444
# dmem[5]  = 5555555555555555
# dmem[15] = FFFFFFFFFFFFFFFF
# dmem[16] = 0F0F0F0F0F0F0F0F
# dmem[31] = F0F0F0F0F0F0F0F0
# ================================================================
lines.append("// =============================================")
lines.append("// LOAD SOURCE REGISTERS")
lines.append("// =============================================")
lines.append(vld(1, 1))   # r1 = 1111111111111111
lines.append(vld(2, 2))   # r2 = 2222222222222222
lines.append(vld(3, 3))   # r3 = 3333333333333333
lines.append(vld(4, 4))   # r4 = 4444444444444444
lines.append(vld(5, 5))   # r5 = 5555555555555555
lines.append(vld(6, 15))  # r6 = FFFFFFFFFFFFFFFF
lines.append(vld(7, 16))  # r7 = 0F0F0F0F0F0F0F0F
lines.append(vld(8, 31))  # r8 = F0F0F0F0F0F0F0F0
lines.append(vld(9, 0))   # r9 = 0000000000000000

store_addr = 32  # results stored starting here

# ================================================================
# VAND - all WW settings
# r1 & r2 = 1111 & 2222 = 0000000000000000
# ================================================================
lines.append("// =============================================")
lines.append("// VAND")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 1, 2, ww, VAND, "VAND"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VOR - all WW settings
# r1 | r2 = 1111 | 2222 = 3333333333333333
# ================================================================
lines.append("// =============================================")
lines.append("// VOR")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 1, 2, ww, VOR, "VOR"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VXOR - all WW settings
# r1 ^ r2 = 1111 ^ 2222 = 3333333333333333
# ================================================================
lines.append("// =============================================")
lines.append("// VXOR")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 1, 2, ww, VXOR, "VXOR"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VNOT - all WW settings
# ~r1 = ~1111111111111111 = EEEEEEEEEEEEEEEE
# ================================================================
lines.append("// =============================================")
lines.append("// VNOT")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype2(10, 1, ww, VNOT, "VNOT"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VMOV - all WW settings
# r1 -> r10 = 1111111111111111
# ================================================================
lines.append("// =============================================")
lines.append("// VMOV")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype2(10, 1, ww, VMOV, "VMOV"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VADD - all WW settings
# r1 + r2 = 1111 + 2222 = 3333333333333333
# ================================================================
lines.append("// =============================================")
lines.append("// VADD")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 1, 2, ww, VADD, "VADD"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VSUB - all WW settings
# r2 - r1 = 2222 - 1111 = 1111111111111111
# ================================================================
lines.append("// =============================================")
lines.append("// VSUB")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 2, 1, ww, VSUB, "VSUB"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VMULEU - WW=00,01,10 (WW=11 not supported)
# even lanes of r1 * even lanes of r2
# WW=00: 0x11*0x22=0x0242 per 16-bit output
# WW=01: 0x1111*0x2222=0x02468642 per 32-bit output  
# WW=10: 0x11111111*0x22222222=0x0246913DF5E22222 (64-bit)
# ================================================================
lines.append("// =============================================")
lines.append("// VMULEU")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W]:
    lines.append(rtype(10, 1, 2, ww, VMULEU, "VMULEU"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VMULOU - WW=00,01,10 (WW=11 not supported)
# odd lanes of r1 * odd lanes of r2
# same values as VMULEU since r1,r2 are uniform
# ================================================================
lines.append("// =============================================")
lines.append("// VMULOU")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W]:
    lines.append(rtype(10, 1, 2, ww, VMULOU, "VMULOU"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VSLL - all WW settings
# shift r1 left by amount in r2
# r2 = 2222... so shift amount = lower bits of each lane of r2
# WW=00: shift by 2 (lower 3 bits of 0x22 = 010) -> 0x11<<2 = 0x44
# WW=01: shift by 2 (lower 4 bits of 0x2222 = 0010) -> 0x1111<<2 = 0x4444
# WW=10: shift by 2 -> 0x11111111<<2 = 0x44444444
# WW=11: shift by 2 -> 0x1111111111111111<<2 = 0x4444444444444444
# ================================================================
lines.append("// =============================================")
lines.append("// VSLL")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 1, 2, ww, VSLL, "VSLL"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VSRL - all WW settings
# shift r2 right logical by amount in r1
# r1 = 1111... so shift amount = lower bits of each lane of r1
# WW=00: shift by 1 (lower 3 bits of 0x11 = 001) -> 0x22>>1 = 0x11
# WW=01: shift by 1 -> 0x2222>>1 = 0x1111
# WW=10: shift by 1 -> 0x22222222>>1 = 0x11111111
# WW=11: shift by 1 -> 0x2222222222222222>>1 = 0x1111111111111111
# ================================================================
lines.append("// =============================================")
lines.append("// VSRL")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 2, 1, ww, VSRL, "VSRL"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VSRA - all WW settings
# shift r6 (FFFF...) right arithmetic by amount in r1
# r6 = FFFFFFFFFFFFFFFF (all ones, negative)
# shift by 1 -> sign extended -> FFFFFFFFFFFFFFFF
# ================================================================
lines.append("// =============================================")
lines.append("// VSRA")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 6, 1, ww, VSRA, "VSRA"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VRTTH - all WW settings
# rotate r7 (0F0F0F0F0F0F0F0F) by half
# WW=00 (8-bit): swap nibbles -> F0F0F0F0F0F0F0F0
# WW=01 (16-bit): swap bytes -> F00FF00FF00FF00F
# WW=10 (32-bit): swap halfwords -> 0F0FF0F00F0FF0F0 (actually swap upper/lower 16 bits)
# WW=11 (64-bit): swap upper/lower 32 bits -> 0F0F0F0F0F0F0F0F (same since uniform)
# ================================================================
lines.append("// =============================================")
lines.append("// VRTTH")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype2(10, 7, ww, VRTTH, "VRTTH"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VDIV - all WW settings
# r4 / r2 = 4444.../2222... = 2222... (integer division)
# ================================================================
lines.append("// =============================================")
lines.append("// VDIV")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 4, 2, ww, VDIV, "VDIV"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VMOD - all WW settings
# r3 % r2 = 3333.../2222... = 1111... remainder
# ================================================================
lines.append("// =============================================")
lines.append("// VMOD")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype(10, 3, 2, ww, VMOD, "VMOD"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VSQEU - WW=00,01,10 (WW=11 not supported)
# square even lanes of r1 (1111...)
# WW=00: 0x11^2 = 0x0121 per 16-bit output
# WW=01: 0x1111^2 = 0x01234321 per 32-bit output
# WW=10: 0x11111111^2 per 64-bit output
# ================================================================
lines.append("// =============================================")
lines.append("// VSQEU")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W]:
    lines.append(rtype2(10, 1, ww, VSQEU, "VSQEU"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VSQOU - WW=00,01,10 (WW=11 not supported)
# square odd lanes of r1 (same values as even since uniform)
# ================================================================
lines.append("// =============================================")
lines.append("// VSQOU")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W]:
    lines.append(rtype2(10, 1, ww, VSQOU, "VSQOU"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# VSQRT - all WW settings
# sqrt of r4 (4444...)
# WW=00: sqrt(0x44) = sqrt(68) = 8
# WW=01: sqrt(0x4444) = sqrt(17476) = 132
# WW=10: sqrt(0x44444444) = sqrt(1145324612) = 33852 (approx)
# WW=11: sqrt(0x4444444444444444)
# ================================================================
lines.append("// =============================================")
lines.append("// VSQRT")
lines.append("// =============================================")
for ww in [WW_B, WW_H, WW_W, WW_D]:
    lines.append(rtype2(10, 4, ww, VSQRT, "VSQRT"))
    lines.append(vsd(10, store_addr))
    store_addr += 1

# ================================================================
# RAW HAZARD TESTS - exercises forwarding unit
# Back-to-back dependent instructions
# ================================================================
lines.append("// =============================================")
lines.append("// RAW HAZARD TEST - forwarding from WB to EX")
lines.append("// =============================================")
lines.append(vld(20, 1))                              # r20 = 1111111111111111
lines.append(rtype(21, 20, 20, WW_D, VADD, "VADD"))  # r21 = r20+r20 = 2222 (RAW: r20 just loaded)
lines.append(rtype(22, 21, 20, WW_D, VADD, "VADD"))  # r22 = r21+r20 = 3333 (RAW: r21 just computed)
lines.append(vsd(21, store_addr))
store_addr += 1
lines.append(vsd(22, store_addr))
store_addr += 1

lines.append("// =============================================")
lines.append("// LOAD-USE HAZARD TEST")
lines.append("// =============================================")
lines.append(vld(23, 3))                              # r23 = 3333333333333333
lines.append(rtype(24, 23, 23, WW_D, VADD, "VADD"))  # r24 = r23+r23 = 6666 (load-use hazard)
lines.append(vsd(24, store_addr))
store_addr += 1

# ================================================================
# End program
# ================================================================
lines.append("// =============================================")
lines.append("// END PROGRAM")
lines.append("// =============================================")
lines.append(vnop())
lines.append(vnop())
lines.append(vnop())
lines.append(vnop())
lines.append("00000000  // End of program")

# Output
for line in lines:
    print(line)
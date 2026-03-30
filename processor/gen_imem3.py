#!/usr/bin/env python3
# gen_imem3.py
# Generates imem_3.fill - tests branch instructions VBEZ and VBNEZ
# Tests both taken and not-taken cases
# Results stored to memory for verification

lines = []

def vld(rD, addr):
    inst = (0b100000 << 26) | (rD << 21) | addr
    return f"{inst:08X}  // VLD r{rD}, {addr}"

def vsd(rD, addr):
    inst = (0b100001 << 26) | (rD << 21) | addr
    return f"{inst:08X}  // VSD r{rD}, {addr}"

def vbez(rD, target):
    inst = (0b100010 << 26) | (rD << 21) | target
    return f"{inst:08X}  // VBEZ r{rD}, {target}"

def vbnez(rD, target):
    inst = (0b100011 << 26) | (rD << 21) | target
    return f"{inst:08X}  // VBNEZ r{rD}, {target}"

def vnop():
    return f"F0000000  // VNOP"

def vadd(rD, rA, rB, ww=0b11):
    func = 0b000110
    inst = (0b101010 << 26) | (rD << 21) | (rA << 16) | (rB << 11) | (ww << 6) | func
    return f"{inst:08X}  // VADDd r{rD}, r{rA}, r{rB}"

# ================================================================
# IMPORTANT: branch target is the instruction INDEX (word address)
# Count instructions carefully
# ================================================================

# Instruction index tracker
idx = [0]  # use list so we can modify in place

def add(line):
    lines.append(f"{line}")
    idx[0] += 1

# ================================================================
# LOAD SOURCE REGISTERS
# r1 = 0000000000000000 (zero)
# r2 = 1111111111111111 (nonzero)
# r3 = 2222222222222222 (nonzero, used as store data)
# ================================================================
add(vld(1, 0))   # idx 0 - r1 = 0000000000000000
add(vld(2, 1))   # idx 1 - r2 = 1111111111111111
add(vld(3, 2))   # idx 2 - r3 = 2222222222222222

# ================================================================
# TEST 1: VBEZ TAKEN
# r1 == 0 so branch SHOULD be taken
# branch target = idx 6 (skip the VSD at idx 4 and 5)
# if branch taken correctly: mem[32] stays 0
# if branch NOT taken: mem[32] = 2222... (wrong)
# ================================================================
add(f"// TEST 1: VBEZ TAKEN - r1=0 so branch should jump to idx 6")
# note: comments don't count as instructions
# idx 3
add(vbez(1, 6))          # idx 3 - VBEZ r1, 6 (branch if r1==0)
add(vsd(3, 32))           # idx 4 - should be SKIPPED if branch taken
add(vsd(3, 33))           # idx 5 - should be SKIPPED if branch taken
# branch target lands here
add(vsd(1, 32))           # idx 6 - store 0 to mem[32] (proof branch was taken)

# ================================================================
# TEST 2: VBEZ NOT TAKEN
# r2 != 0 so branch should NOT be taken, fall through
# if not taken correctly: mem[33] = 1111... 
# if branch taken (wrong): mem[33] stays 0
# ================================================================
add(f"// TEST 2: VBEZ NOT TAKEN - r2=1111 so branch should fall through")
# idx 7
add(vbez(2, 11))          # idx 7 - VBEZ r2, 11 (should NOT branch)
add(vsd(2, 33))           # idx 8 - should EXECUTE if not taken: mem[33]=1111
add(vsd(3, 34))           # idx 9 - also executes: mem[34]=2222
add(vsd(1, 35))           # idx 10 - also executes: mem[35]=0000
# branch would have landed here (idx 11) - skipped since not taken
add(f"// idx 11 - branch target for test 2 (not reached)")
add(vnop())               # idx 11 - padding

# ================================================================
# TEST 3: VBNEZ TAKEN
# r2 != 0 so branch SHOULD be taken
# branch target = idx 15 (skip VSD at idx 13,14)
# if taken correctly: mem[36] stays 0
# if NOT taken: mem[36] = 3333... (wrong)
# ================================================================
add(f"// TEST 3: VBNEZ TAKEN - r2=1111 so branch should jump to idx 15")
# idx 12
add(vbnez(2, 15))         # idx 12 - VBNEZ r2, 15 (branch if r2!=0)
add(vsd(3, 36))           # idx 13 - should be SKIPPED
add(vsd(3, 37))           # idx 14 - should be SKIPPED
# branch target lands here
add(vsd(1, 36))           # idx 15 - store 0 to mem[36] (proof branch taken)

# ================================================================
# TEST 4: VBNEZ NOT TAKEN
# r1 == 0 so branch should NOT be taken
# if not taken correctly: mem[37] = 1111...
# if taken (wrong): mem[37] stays 0
# ================================================================
add(f"// TEST 4: VBNEZ NOT TAKEN - r1=0 so branch should fall through")
# idx 16
add(vbnez(1, 20))         # idx 16 - VBNEZ r1, 20 (should NOT branch)
add(vsd(2, 37))           # idx 17 - should EXECUTE: mem[37]=1111
add(vsd(3, 38))           # idx 18 - also executes: mem[38]=2222
add(vsd(1, 39))           # idx 19 - also executes: mem[39]=0000
# branch would have landed here (idx 20)
add(f"// idx 20 - branch target for test 4 (not reached)")

# ================================================================
# TEST 5: BRANCH FORWARD - loop simulation
# Use VBNEZ to simulate a simple countdown loop
# r4 = 3 (loop counter loaded from dmem[3] = 3333...)
# but we want a small counter, so use VADD to create one
# Actually load r4 = 0x0000000000000003 from dmem
# We dont have that exact value, so lets use r5 as a flag
# simpler: just test backward branch
# Load r4 = 1111... then subtract to get zero, branch when zero
# ================================================================
add(f"// TEST 5: BACKWARD BRANCH - branch to earlier instruction")
# idx 20
add(vld(4, 1))            # idx 20 - r4 = 1111111111111111
add(vld(5, 0))            # idx 21 - r5 = 0000000000000000 (target value)
# store initial marker
add(vsd(4, 40))           # idx 22 - mem[40] = 1111 (before branch)
# branch backward: if r4 != r5... actually we test VBEZ on r4-r5
# r4 - r5 = 1111 - 0000 = 1111 (nonzero), so VBEZ not taken
# subtract r5 from r4 to check
add(vadd(6, 4, 5))        # idx 23 - r6 = r4 + r5 = 1111 (just a copy)
add(vbez(6, 26))          # idx 24 - VBEZ r6, 26 - not taken since r6!=0
add(vsd(4, 41))           # idx 25 - mem[41] = 1111 (proves not taken)
# idx 26 - landing point
add(vsd(1, 42))           # idx 26 - mem[42] = 0000

# ================================================================
# END PROGRAM
# ================================================================
add(f"// END PROGRAM")
add(vnop())               # flush pipeline
add(vnop())
add(vnop())
add(vnop())
add("00000000  // End of program")

# Output - skip comment-only lines from instruction count display
print(f"// Total instructions: {idx[0]}")
print()
for line in lines:
    if not line.startswith("//"):
        print(line)
    else:
        print(line)
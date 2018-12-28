#!/usr/bin/env luajit

local ffi = require [[ffi]]
local lq = require [[quantum]]

ffi.cdef [[void srand(unsigned int seed);]];
local srand = ffi.C.srand
local time = os.time
local result

srand(time())

reg = lq.quantum_new_qureg(0, 1)

lq.quantum_hadamard(0, reg)

result = lq.quantum_bmeasure(0, reg)

print(([[The Quantum RNG returned %i!]]):format(result))
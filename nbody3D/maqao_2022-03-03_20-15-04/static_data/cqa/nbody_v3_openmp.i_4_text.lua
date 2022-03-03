_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - rand@plt: 8 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant non-unit stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - VCVTSI2SS (INT32/64 to FP32, scalar): 7 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "8 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 8 FP arithmetical operations:\n - 8: multiply\nThe binary loop is loading 64 bytes (16 single precision FP elements).\nThe binary loop is storing 32 bytes (8 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.08 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 50\nloop length        : 251\nused x86 registers : 8\nused mmx registers : 0\nused xmm registers : 4\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 6\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 16.00 cycles\ninstruction queue    : 25.00 cycles\ndecoding             : 25.00 cycles\nmicro-operation queue: 29.00 cycles\nfront end            : 29.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 7.50 | 7.50 | 10.00 | 10.00 | 8.00 | 8.00 | 8.00\ncycles | 7.50 | 7.50 | 10.00 | 10.00 | 8.00 | 8.00 | 8.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 29.00\nDispatch  : 10.00\nData deps.: 1.00\nOverall L1: 29.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 29%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 100%\nINT+FP\nall     : 20%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 38%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 6%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 6%\nFP\nall     : 11%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 25%\nINT+FP\nall     : 10%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 13%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 29.00 cycles. At this rate:\n - 1% of peak load performance is reached (2.21 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (1.10 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 29.00 to 25.00 cycles (1.16x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4024f3\n\nInstruction                     | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nMOV %EAX,%EBX                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nCMP %EAX,%EBX                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nMOV $0x1,%EAX                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVXORPS %XMM0,%XMM0,%XMM0\nMOV $-0x1,%EDX                  | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMOVA %EAX,%EDX                 | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 2       | 1\nVCVTSI2SS %EDX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nVMOVSS %XMM0,(%RSP)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x10(%RSP),%RAX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xfd8b(%RIP),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMULSS (%RSP),%XMM1,%XMM2       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%RAX,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x18(%RSP),%RAX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xfd66(%RIP),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%RAX,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVMOVSS 0xfd53(%RIP),%XMM0       | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVXORPS %XMM2,%XMM2,%XMM2\nVCVTSI2SS %EAX,%XMM2,%XMM2      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nVMULSS (%RSP),%XMM0,%XMM1       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,0x28(%RSP)         | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMULSS %XMM2,%XMM1,%XMM3        | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM3,(%R14,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x20(%RSP),%RAX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xfd1c(%RIP),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%RAX,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nVMULSS 0x28(%RSP),%XMM0,%XMM1   | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R13,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nVMULSS 0xfce7(%RIP),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R12,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%R15                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP 0x8(%RSP),%R15              | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nJB 4024f3 <main+0x1a3>          | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.28 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 29.00 to 17.00 cycles (1.71x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 10% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 29.00 to 1.81 cycles (16.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - rand@plt: 8 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant non-unit stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - VCVTSI2SS (INT32/64 to FP32, scalar): 7 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "8 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 8 FP arithmetical operations:\n - 8: multiply\nThe binary loop is loading 64 bytes (16 single precision FP elements).\nThe binary loop is storing 32 bytes (8 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.08 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 50\nloop length        : 251\nused x86 registers : 8\nused mmx registers : 0\nused xmm registers : 4\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 6\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 16.00 cycles\ninstruction queue    : 25.00 cycles\ndecoding             : 25.00 cycles\nmicro-operation queue: 29.00 cycles\nfront end            : 29.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 7.50 | 7.50 | 10.00 | 10.00 | 8.00 | 8.00 | 8.00\ncycles | 7.50 | 7.50 | 10.00 | 10.00 | 8.00 | 8.00 | 8.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 29.00\nDispatch  : 10.00\nData deps.: 1.00\nOverall L1: 29.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 29%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 100%\nINT+FP\nall     : 20%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 38%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 6%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 6%\nFP\nall     : 11%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 25%\nINT+FP\nall     : 10%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 13%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 29.00 cycles. At this rate:\n - 1% of peak load performance is reached (2.21 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (1.10 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 29.00 to 25.00 cycles (1.16x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4024f3\n\nInstruction                     | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nMOV %EAX,%EBX                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nCMP %EAX,%EBX                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nMOV $0x1,%EAX                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVXORPS %XMM0,%XMM0,%XMM0\nMOV $-0x1,%EDX                  | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMOVA %EAX,%EDX                 | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 2       | 1\nVCVTSI2SS %EDX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nVMOVSS %XMM0,(%RSP)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x10(%RSP),%RAX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xfd8b(%RIP),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMULSS (%RSP),%XMM1,%XMM2       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%RAX,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x18(%RSP),%RAX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xfd66(%RIP),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%RAX,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVMOVSS 0xfd53(%RIP),%XMM0       | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVXORPS %XMM2,%XMM2,%XMM2\nVCVTSI2SS %EAX,%XMM2,%XMM2      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nVMULSS (%RSP),%XMM0,%XMM1       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,0x28(%RSP)         | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMULSS %XMM2,%XMM1,%XMM3        | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM3,(%R14,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x20(%RSP),%RAX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xfd1c(%RIP),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%RAX,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nVMULSS 0x28(%RSP),%XMM0,%XMM1   | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R13,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 4021b0 <rand@plt>          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVXORPS %XMM0,%XMM0,%XMM0\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nVMULSS 0xfce7(%RIP),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R12,%R15,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%R15                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP 0x8(%RSP),%R15              | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nJB 4024f3 <main+0x1a3>          | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.28 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 29.00 to 17.00 cycles (1.71x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 10% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 29.00 to 1.81 cycles (16.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}

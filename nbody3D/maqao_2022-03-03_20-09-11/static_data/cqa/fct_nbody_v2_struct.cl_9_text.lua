_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - puts@plt: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "3 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function is composed of 6 FP arithmetical operations:\n - 3: addition or subtraction (all inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary function is loading 168 bytes (42 single precision FP elements).\nThe binary function is storing 16 bytes (4 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.03 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 72\nloop length        : 293\nused x86 registers : 13\nused mmx registers : 0\nused xmm registers : 7\nused ymm registers : 1\nused zmm registers : 2\nnb stack references: 1\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 19.00 cycles\ninstruction queue    : 36.00 cycles\ndecoding             : 36.00 cycles\nmicro-operation queue: 38.00 cycles\nfront end            : 38.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4    | P5    | P6\n-----------------------------------------------------------\nuops   | 3.00 | 3.00 | 15.00 | 15.00 | 18.00 | 18.00 | 7.00\ncycles | 3.00 | 3.00 | 15.00 | 15.00 | 18.00 | 18.00 | 7.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 38.00\nDispatch  : 18.00\nOverall L1: 38.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 26%\nload    : 9%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 66%\nINT+FP\nall     : 15%\nload    : 8%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 23%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 11%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 12%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 10%\nFP\nall     : 12%\nload    : 10%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 18%\nINT+FP\nall     : 11%\nload    : 10%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 12%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 13%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 38.00 cycles. At this rate:\n - 3% of peak load performance is reached (4.42 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.42 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 38.00 to 36.00 cycles (1.06x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4012e0\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nPUSH %R15                             | 1     | 0    | 0    | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %R14                             | 1     | 0    | 0    | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %RBX                             | 1     | 0    | 0    | 0    | 0    | 1    | 1    | 0  | 0       | 1\nSUB $0x10,%RSP                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nMOV %RSI,%RBX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVMOVAPS %XMM0,%XMM8                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMOV %RDI,%R14                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVMOVSS %XMM0,0xc(%RSP)                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nTEST %RSI,%RSI                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 401675 <move_particles+0x395>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV 0x18(%R14),%R8                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x20(%R14),%R9                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x28(%R14),%R10                   | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV (%R14),%RDI                       | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x8(%R14),%RAX                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x10(%R14),%RCX                   | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV %RBX,%R15                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nAND $-0x20,%R15                       | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nXOR %R11D,%R11D\nVMOVSS 0xcdd(%RIP),%XMM9              | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS 0xcd9(%RIP),%XMM10             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVBROADCASTSS 0xccb(%RIP),%ZMM25       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVBROADCASTSS 0xcc5(%RIP),%ZMM17       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJMP 401381 <move_particles+0xa1>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nNOPL (%RAX)                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nNOP                                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nTEST %DL,%DL                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4016e6 <move_particles+0x406>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV $0x402117,%EDI                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCALL 401040 <puts@plt>                | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nTEST %RBX,%RBX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4017cd <move_particles+0x4ed>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVUPS 0xc(%RSP),%YMM0               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVXORPS %XMM1,%XMM1,%XMM1\nXOR %EAX,%EAX\nVXORPS %XMM2,%XMM2,%XMM2\nVXORPS %XMM3,%XMM3,%XMM3\nJMP 4017cd <move_particles+0x4ed>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nTEST %RBX,%RBX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4017cd <move_particles+0x4ed>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV 0x18(%R14),%RDX                   | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV (%R14),%RSI                       | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x8(%R14),%RCX                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x20(%R14),%R9                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x28(%R14),%R8                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x10(%R14),%RAX                   | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV %EBX,%R10D                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nAND $0x1,%R10D                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP $0x1,%RBX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 40171a <move_particles+0x43a>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nXOR %EDI,%EDI\nJMP 401796 <move_particles+0x4b6>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nSUB %R10,%RBX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nXOR %EDI,%EDI\nNOP                                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nTEST %R10,%R10                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4017cd <move_particles+0x4ed>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVSS (%RDX,%RDI,4),%XMM0            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%RSI,%RDI,4),%XMM8,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RSI,%RDI,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R9,%RDI,4),%XMM0             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%RCX,%RDI,4),%XMM8,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RCX,%RDI,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R8,%RDI,4),%XMM0             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%RAX,%RDI,4),%XMM8,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RAX,%RDI,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x10,%RSP                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nPOP %RBX                              | 2     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %R14                              | 2     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %R15                              | 2     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nRET\nNOPW (%RAX,%RAX,1)                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.16 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 38.00 to 14.00 cycles (2.71x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 11% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 38.00 to 2.87 cycles (13.24x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 3 FMA (fused multiply-add) operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - puts@plt: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "3 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function is composed of 6 FP arithmetical operations:\n - 3: addition or subtraction (all inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary function is loading 168 bytes (42 single precision FP elements).\nThe binary function is storing 16 bytes (4 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.03 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 72\nloop length        : 293\nused x86 registers : 13\nused mmx registers : 0\nused xmm registers : 7\nused ymm registers : 1\nused zmm registers : 2\nnb stack references: 1\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 19.00 cycles\ninstruction queue    : 36.00 cycles\ndecoding             : 36.00 cycles\nmicro-operation queue: 38.00 cycles\nfront end            : 38.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4    | P5    | P6\n-----------------------------------------------------------\nuops   | 3.00 | 3.00 | 15.00 | 15.00 | 18.00 | 18.00 | 7.00\ncycles | 3.00 | 3.00 | 15.00 | 15.00 | 18.00 | 18.00 | 7.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 38.00\nDispatch  : 18.00\nOverall L1: 38.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 26%\nload    : 9%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 66%\nINT+FP\nall     : 15%\nload    : 8%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 23%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 11%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 12%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 10%\nFP\nall     : 12%\nload    : 10%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 18%\nINT+FP\nall     : 11%\nload    : 10%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 12%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 13%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 38.00 cycles. At this rate:\n - 3% of peak load performance is reached (4.42 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.42 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 38.00 to 36.00 cycles (1.06x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4012e0\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nPUSH %R15                             | 1     | 0    | 0    | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %R14                             | 1     | 0    | 0    | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %RBX                             | 1     | 0    | 0    | 0    | 0    | 1    | 1    | 0  | 0       | 1\nSUB $0x10,%RSP                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nMOV %RSI,%RBX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVMOVAPS %XMM0,%XMM8                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMOV %RDI,%R14                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVMOVSS %XMM0,0xc(%RSP)                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nTEST %RSI,%RSI                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 401675 <move_particles+0x395>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV 0x18(%R14),%R8                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x20(%R14),%R9                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x28(%R14),%R10                   | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV (%R14),%RDI                       | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x8(%R14),%RAX                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x10(%R14),%RCX                   | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV %RBX,%R15                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nAND $-0x20,%R15                       | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nXOR %R11D,%R11D\nVMOVSS 0xcdd(%RIP),%XMM9              | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS 0xcd9(%RIP),%XMM10             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVBROADCASTSS 0xccb(%RIP),%ZMM25       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVBROADCASTSS 0xcc5(%RIP),%ZMM17       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJMP 401381 <move_particles+0xa1>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nNOPL (%RAX)                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nNOP                                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nTEST %DL,%DL                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4016e6 <move_particles+0x406>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV $0x402117,%EDI                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCALL 401040 <puts@plt>                | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nTEST %RBX,%RBX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4017cd <move_particles+0x4ed>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVUPS 0xc(%RSP),%YMM0               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVXORPS %XMM1,%XMM1,%XMM1\nXOR %EAX,%EAX\nVXORPS %XMM2,%XMM2,%XMM2\nVXORPS %XMM3,%XMM3,%XMM3\nJMP 4017cd <move_particles+0x4ed>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nTEST %RBX,%RBX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4017cd <move_particles+0x4ed>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV 0x18(%R14),%RDX                   | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV (%R14),%RSI                       | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x8(%R14),%RCX                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x20(%R14),%R9                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x28(%R14),%R8                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x10(%R14),%RAX                   | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV %EBX,%R10D                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nAND $0x1,%R10D                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP $0x1,%RBX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 40171a <move_particles+0x43a>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nXOR %EDI,%EDI\nJMP 401796 <move_particles+0x4b6>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nSUB %R10,%RBX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nXOR %EDI,%EDI\nNOP                                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nTEST %R10,%R10                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4017cd <move_particles+0x4ed>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVSS (%RDX,%RDI,4),%XMM0            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%RSI,%RDI,4),%XMM8,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RSI,%RDI,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R9,%RDI,4),%XMM0             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%RCX,%RDI,4),%XMM8,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RCX,%RDI,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R8,%RDI,4),%XMM0             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%RAX,%RDI,4),%XMM8,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RAX,%RDI,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x10,%RSP                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nPOP %RBX                              | 2     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %R14                              | 2     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %R15                              | 2     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nRET\nNOPW (%RAX,%RAX,1)                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.16 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 38.00 to 14.00 cycles (2.71x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 11% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 38.00 to 2.87 cycles (13.24x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 3 FMA (fused multiply-add) operations.",
        },
      },
    },
  common = {
    header = {
      "",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}

_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 3 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n9 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n3 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 69 FP arithmetical operations:\n - 66: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 72 bytes (18 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.82 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 64\nloop length        : 330\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 12\nused ymm registers : 4\nused zmm registers : 9\nnb stack references: 6\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 21.00 cycles\ninstruction queue    : 32.00 cycles\ndecoding             : 32.00 cycles\nmicro-operation queue: 32.00 cycles\nfront end            : 32.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 19.00 | 19.00 | 7.50 | 7.50 | 7.00 | 7.00 | 3.00\ncycles | 19.00 | 19.00 | 7.50 | 7.50 | 7.00 | 7.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 32.00\nDispatch  : 19.00\nOverall L1: 32.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 33%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 42%\nFP\nall     : 61%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 77%\nINT+FP\nall     : 56%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 68%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 24%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 27%\nFP\nall     : 25%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 26%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 35%\nINT+FP\nall     : 25%\nload    : 8%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 26%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 33%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n - 1% of peak load performance is reached (2.25 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.38 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 32.00 to 21.00 cycles (1.52x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 17c0\n\nInstruction                              | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------\nMOV 0x60(%RSP),%RDX                      | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nXOR %EAX,%EAX\nVMOVSS (%RCX,%R8,4),%XMM2                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS %XMM15,%XMM15,%XMM5               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVMOVSS (%RDI,%R8,4),%XMM3                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVAPS %ZMM15,%ZMM16                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nCMP %RDX,0x68(%RSP)                      | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nVMOVAPS %ZMM15,%ZMM17                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVSS (%RSI,%R8,4),%XMM4                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJA 19d0 <move_particles._omp_fn.0+0x380> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nTEST %R9,%R9                             | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 1862 <move_particles._omp_fn.0+0x212> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nNOPL (%RAX)                              | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nLEA (%R9),%RAX                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVXORPS %XMM6,%XMM6,%XMM6\nVBROADCASTSS %XMM2,%ZMM23                | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM3,%ZMM22                | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM4,%ZMM21                | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nXOR %EDX,%EDX\nVMOVAPS %ZMM6,%ZMM7                      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM6,%ZMM8                      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nNOPW %CS:(%RAX,%RAX,1)                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM6,%YMM0           | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM6,%YMM0,%YMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOV 0x58(%RSP),%RDX                      | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVEXTRACTF128 $0x1,%YMM6,%XMM0            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nADD %RDX,%RAX                            | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVADDPS %XMM6,%XMM0,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nCMP 0x50(%RSP),%RDX                      | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nVMOVHLPS %XMM6,%XMM6,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM6,%XMM0,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM6,%XMM6,%XMM0          | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM6,%XMM0,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM5,%XMM0,%XMM5                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM7,%YMM0           | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM7,%YMM0,%YMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM0,%XMM7            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM0,%XMM7,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVHLPS %XMM7,%XMM7,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM7,%XMM0,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM7,%XMM7,%XMM0          | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM7,%XMM0,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM16,%XMM0,%XMM16               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM8,%YMM0           | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM8,%YMM0,%YMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM0,%XMM8            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM0,%XMM8,%XMM8                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVHLPS %XMM8,%XMM8,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM8,%XMM0,%XMM8                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM8,%XMM8,%XMM0          | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM8,%XMM0,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM17,%XMM0,%XMM17               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nJE 1a35 <move_particles._omp_fn.0+0x3e5> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nNOPL (%RAX)                              | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nMOV 0x70(%RSP),%RAX                      | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVFMADD213SS (%R15,%R8,4),%XMM13,%XMM17   | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM17,(%R15,%R8,4)               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R14,%R8,4),%XMM13,%XMM16   | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM16,(%R14,%R8,4)               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%RAX,%R8,4),%XMM13,%XMM5    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM5,(%RAX,%R8,4)                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nLEA 0x1(%R8),%R8                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP 0x78(%RSP),%R8                       | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nJB 17c0 <move_particles._omp_fn.0+0x170> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "3% of peak computational performance is used (2.16 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 32.00 to 26.00 cycles (1.23x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "56% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 68% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 25% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 32.00 to 4.87 cycles (6.56x speedup).",
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
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 3 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n9 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n3 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 69 FP arithmetical operations:\n - 66: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 72 bytes (18 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.82 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 64\nloop length        : 330\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 12\nused ymm registers : 4\nused zmm registers : 9\nnb stack references: 6\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 21.00 cycles\ninstruction queue    : 32.00 cycles\ndecoding             : 32.00 cycles\nmicro-operation queue: 32.00 cycles\nfront end            : 32.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 19.00 | 19.00 | 7.50 | 7.50 | 7.00 | 7.00 | 3.00\ncycles | 19.00 | 19.00 | 7.50 | 7.50 | 7.00 | 7.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 32.00\nDispatch  : 19.00\nOverall L1: 32.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 33%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 42%\nFP\nall     : 61%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 77%\nINT+FP\nall     : 56%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 68%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 24%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 27%\nFP\nall     : 25%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 26%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 35%\nINT+FP\nall     : 25%\nload    : 8%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 26%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 33%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n - 1% of peak load performance is reached (2.25 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.38 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 32.00 to 21.00 cycles (1.52x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 17c0\n\nInstruction                              | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------\nMOV 0x60(%RSP),%RDX                      | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nXOR %EAX,%EAX\nVMOVSS (%RCX,%R8,4),%XMM2                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS %XMM15,%XMM15,%XMM5               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVMOVSS (%RDI,%R8,4),%XMM3                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVAPS %ZMM15,%ZMM16                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nCMP %RDX,0x68(%RSP)                      | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nVMOVAPS %ZMM15,%ZMM17                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVSS (%RSI,%R8,4),%XMM4                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJA 19d0 <move_particles._omp_fn.0+0x380> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nTEST %R9,%R9                             | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 1862 <move_particles._omp_fn.0+0x212> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nNOPL (%RAX)                              | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nLEA (%R9),%RAX                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVXORPS %XMM6,%XMM6,%XMM6\nVBROADCASTSS %XMM2,%ZMM23                | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM3,%ZMM22                | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM4,%ZMM21                | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nXOR %EDX,%EDX\nVMOVAPS %ZMM6,%ZMM7                      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM6,%ZMM8                      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nNOPW %CS:(%RAX,%RAX,1)                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM6,%YMM0           | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM6,%YMM0,%YMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOV 0x58(%RSP),%RDX                      | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVEXTRACTF128 $0x1,%YMM6,%XMM0            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nADD %RDX,%RAX                            | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVADDPS %XMM6,%XMM0,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nCMP 0x50(%RSP),%RDX                      | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nVMOVHLPS %XMM6,%XMM6,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM6,%XMM0,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM6,%XMM6,%XMM0          | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM6,%XMM0,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM5,%XMM0,%XMM5                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM7,%YMM0           | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM7,%YMM0,%YMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM0,%XMM7            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM0,%XMM7,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVHLPS %XMM7,%XMM7,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM7,%XMM0,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM7,%XMM7,%XMM0          | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM7,%XMM0,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM16,%XMM0,%XMM16               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM8,%YMM0           | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM8,%YMM0,%YMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM0,%XMM8            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM0,%XMM8,%XMM8                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVHLPS %XMM8,%XMM8,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM8,%XMM0,%XMM8                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM8,%XMM8,%XMM0          | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM8,%XMM0,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM17,%XMM0,%XMM17               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nJE 1a35 <move_particles._omp_fn.0+0x3e5> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nNOPL (%RAX)                              | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nMOV 0x70(%RSP),%RAX                      | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVFMADD213SS (%R15,%R8,4),%XMM13,%XMM17   | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM17,(%R15,%R8,4)               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R14,%R8,4),%XMM13,%XMM16   | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM16,(%R14,%R8,4)               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%RAX,%R8,4),%XMM13,%XMM5    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM5,(%RAX,%R8,4)                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nLEA 0x1(%R8),%R8                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP 0x78(%RSP),%R8                       | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nJB 17c0 <move_particles._omp_fn.0+0x170> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "3% of peak computational performance is used (2.16 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 32.00 to 26.00 cycles (1.23x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "56% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 68% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 25% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 32.00 to 4.87 cycles (6.56x speedup).",
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
      "Warnings:\n - Non-innermost loop: analyzing only self part (ignoring child loops).\n - Ignoring paths for analysis\n - Too many paths. Rerun with max-paths=5\n - RecMII not computed since number of paths is unknown or > max_paths\n - Streams not analyzed since number of paths is unknown or > max_paths\n",
      "Try to simplify control and/or increase the maximum number of paths per function/loop through the 'max-paths-nb' option.\n",
      "This loop has 5 execution paths.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside loop: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the loop)\n - turning them into conditional moves, MIN or MAX\n\n",
    },
    nb_paths = 5,
  },
}

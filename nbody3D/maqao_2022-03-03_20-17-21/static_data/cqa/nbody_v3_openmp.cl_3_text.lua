_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant non-unit stride: 3 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          title = "Type of elements and instruction set",
          txt = "3 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 6 FP arithmetical operations:\n - 3: addition or subtraction (all inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 36 bytes (9 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 23\nloop length        : 118\nused x86 registers : 11\nused mmx registers : 0\nused xmm registers : 7\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 8.00 cycles\ninstruction queue    : 11.50 cycles\ndecoding             : 11.50 cycles\nmicro-operation queue: 12.00 cycles\nfront end            : 12.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6\n-------------------------------------------------------\nuops   | 1.50 | 1.50 | 6.00 | 6.00 | 3.00 | 4.00 | 3.00\ncycles | 1.50 | 1.50 | 6.00 | 6.00 | 3.00 | 4.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.00\nDispatch  : 6.00\nData deps.: 4.00\nOverall L1: 12.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 20%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 100%\nINT+FP\nall     : 17%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 60%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 9%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 9%\nFP\nall     : 10%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 25%\nINT+FP\nall     : 9%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 18%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 12.00 cycles. At this rate:\n - 2% of peak load performance is reached (3.00 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (1.00 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401503\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nVMOVSS (%R13),%XMM2                   | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%R9,%RCX,4),%XMM7,%XMM2  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%R9,%RCX,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R13),%XMM2                   | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%R10,%RCX,4),%XMM1,%XMM2 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%R10,%RCX,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R13),%XMM1                   | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%R11,%RCX,4),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R11,%RCX,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%RCX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %R8,%RCX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJAE 4017f5 <.omp_outlined.+0x435>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMP $0x20,%RDX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMOVSS (%RAX,%RCX,4),%XMM26           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RSI,%RCX,4),%XMM30           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RDI,%RCX,4),%XMM31           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJAE 401540 <.omp_outlined.+0x180>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVXORPS %XMM7,%XMM7,%XMM7\nVXORPS %XMM1,%XMM1,%XMM1\nVXORPS %XMM0,%XMM0,%XMM0\nXOR %EBX,%EBX\nJMP 401790 <.omp_outlined.+0x3d0>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nJMP 4014c0 <.omp_outlined.+0x100>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.50 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 12.00 to 9.00 cycles (1.33x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 9% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 12.00 to 0.78 cycles (15.33x speedup).",
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
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant non-unit stride: 3 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 3 occurrences\n - VEXTRACTF64X4: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 6 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n6 AVX-512 instructions are processing arithmetic or math operations on single precision FP elements in vector mode (sixteen at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 129 FP arithmetical operations:\n - 126: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 36 bytes (9 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 2.69 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 64\nloop length        : 329\nused x86 registers : 12\nused mmx registers : 0\nused xmm registers : 14\nused ymm registers : 4\nused zmm registers : 12\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 21.00 cycles\ninstruction queue    : 32.00 cycles\ndecoding             : 32.00 cycles\nmicro-operation queue: 32.00 cycles\nfront end            : 32.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 19.50 | 19.50 | 6.00 | 6.00 | 6.00 | 6.00 | 3.00\ncycles | 19.50 | 19.50 | 6.00 | 6.00 | 6.00 | 6.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 32.00\nDispatch  : 19.50\nData deps.: 4.00\nOverall L1: 32.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 33%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 33%\nFP\nall     : 64%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 86%\nINT+FP\nall     : 60%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 75%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 40%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 40%\nFP\nall     : 28%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 24%\nINT+FP\nall     : 29%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 27%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n - 0% of peak load performance is reached (1.13 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.38 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 32.00 to 21.00 cycles (1.52x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401503\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nVMOVSS (%R13),%XMM2                   | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%R9,%RCX,4),%XMM7,%XMM2  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%R9,%RCX,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R13),%XMM2                   | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%R10,%RCX,4),%XMM1,%XMM2 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%R10,%RCX,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R13),%XMM1                   | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%R11,%RCX,4),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R11,%RCX,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%RCX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %R8,%RCX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJAE 4017f5 <.omp_outlined.+0x435>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMP $0x20,%RDX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMOVSS (%RAX,%RCX,4),%XMM26           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RSI,%RCX,4),%XMM30           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RDI,%RCX,4),%XMM31           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJAE 401540 <.omp_outlined.+0x180>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVAPS %XMM9,%XMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM8,%XMM2                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVBROADCASTSS %XMM26,%ZMM9             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM30,%ZMM10            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM31,%ZMM11            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVPXORD %ZMM22,%ZMM22,%ZMM22           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMOV $0,%EBX                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVPXORD %ZMM23,%ZMM23,%ZMM23           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVXORPS %XMM13,%XMM13,%XMM13\nVXORPS %XMM14,%XMM14,%XMM14\nVXORPS %XMM0,%XMM0,%XMM0\nVXORPS %XMM15,%XMM15,%XMM15\nXCHG %AX,%AX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nCMP %RBP,%RDX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVADDPS %ZMM0,%ZMM15,%ZMM0             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM0,%YMM1        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM1,%ZMM0,%ZMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM0,%XMM1         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM1,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM0,%XMM1            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM1,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM0,%XMM1                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM1,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM13,%ZMM14,%ZMM1            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM1,%YMM4        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM4,%ZMM1,%ZMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM1,%XMM4         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM4,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM1,%XMM4            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM4,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM1,%XMM4                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM4,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM22,%ZMM23,%ZMM4            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM4,%YMM7        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM7,%ZMM4,%ZMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM4,%XMM7         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM7,%XMM4,%XMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM4,%XMM7            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM7,%XMM4,%XMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM4,%XMM7                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM7,%XMM4,%XMM7              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOV %RBP,%RBX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVMOVAPS %XMM2,%XMM8                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM3,%XMM9                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nJE 4014c0 <.omp_outlined.+0x100>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nNOPL (%RAX,%RAX,1)                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nJMP 4014c0 <.omp_outlined.+0x100>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\n",
        },
      },
      header = {
        "6% of peak computational performance is used (4.03 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 32.00 to 28.00 cycles (1.14x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "60% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 75% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 29% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 32.00 to 17.44 cycles (1.84x speedup).",
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
    {
      hint = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 3 occurrences\n - VEXTRACTF64X4: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 6 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n6 AVX-512 instructions are processing arithmetic or math operations on single precision FP elements in vector mode (sixteen at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 129 FP arithmetical operations:\n - 126: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 36 bytes (9 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 2.69 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 62\nloop length        : 319\nused x86 registers : 12\nused mmx registers : 0\nused xmm registers : 14\nused ymm registers : 4\nused zmm registers : 12\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 20.00 cycles\ninstruction queue    : 31.00 cycles\ndecoding             : 31.00 cycles\nmicro-operation queue: 31.00 cycles\nfront end            : 31.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 19.50 | 19.50 | 6.00 | 6.00 | 5.00 | 5.00 | 3.00\ncycles | 19.50 | 19.50 | 6.00 | 6.00 | 5.00 | 5.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 31.00\nDispatch  : 19.50\nData deps.: 4.00\nOverall L1: 31.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 33%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 33%\nFP\nall     : 64%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 86%\nINT+FP\nall     : 60%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 75%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 40%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 40%\nFP\nall     : 28%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 24%\nINT+FP\nall     : 29%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 27%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 31.00 cycles. At this rate:\n - 0% of peak load performance is reached (1.16 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.39 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 31.00 to 20.00 cycles (1.55x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401503\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nVMOVSS (%R13),%XMM2                   | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%R9,%RCX,4),%XMM7,%XMM2  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%R9,%RCX,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R13),%XMM2                   | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%R10,%RCX,4),%XMM1,%XMM2 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%R10,%RCX,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVMOVSS (%R13),%XMM1                   | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFMADD213SS (%R11,%RCX,4),%XMM0,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R11,%RCX,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%RCX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %R8,%RCX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJAE 4017f5 <.omp_outlined.+0x435>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMP $0x20,%RDX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMOVSS (%RAX,%RCX,4),%XMM26           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RSI,%RCX,4),%XMM30           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RDI,%RCX,4),%XMM31           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJAE 401540 <.omp_outlined.+0x180>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVAPS %XMM9,%XMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM8,%XMM2                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVBROADCASTSS %XMM26,%ZMM9             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM30,%ZMM10            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM31,%ZMM11            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVPXORD %ZMM22,%ZMM22,%ZMM22           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMOV $0,%EBX                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVPXORD %ZMM23,%ZMM23,%ZMM23           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVXORPS %XMM13,%XMM13,%XMM13\nVXORPS %XMM14,%XMM14,%XMM14\nVXORPS %XMM0,%XMM0,%XMM0\nVXORPS %XMM15,%XMM15,%XMM15\nXCHG %AX,%AX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nCMP %RBP,%RDX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVADDPS %ZMM0,%ZMM15,%ZMM0             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM0,%YMM1        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM1,%ZMM0,%ZMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM0,%XMM1         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM1,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM0,%XMM1            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM1,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM0,%XMM1                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM1,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM13,%ZMM14,%ZMM1            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM1,%YMM4        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM4,%ZMM1,%ZMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM1,%XMM4         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM4,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM1,%XMM4            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM4,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM1,%XMM4                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM4,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM22,%ZMM23,%ZMM4            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM4,%YMM7        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM7,%ZMM4,%ZMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM4,%XMM7         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM7,%XMM4,%XMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM4,%XMM7            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM7,%XMM4,%XMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM4,%XMM7                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM7,%XMM4,%XMM7              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOV %RBP,%RBX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVMOVAPS %XMM2,%XMM8                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM3,%XMM9                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nJE 4014c0 <.omp_outlined.+0x100>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "6% of peak computational performance is used (4.16 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 31.00 to 28.00 cycles (1.11x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "60% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 75% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 29% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 31.00 to 16.44 cycles (1.89x speedup).",
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
          title = "Type of elements and instruction set",
          txt = "5 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n4 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n4 AVX-512 instructions are processing arithmetic or math operations on single precision FP elements in vector mode (sixteen at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 88 FP arithmetical operations:\n - 85: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 36 bytes (9 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.83 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 49.67\nloop length        : 255.33\nused x86 registers : 11.67\nused mmx registers : 0\nused xmm registers : 11.67\nused ymm registers : 2.67\nused zmm registers : 8\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 16.33 cycles\ninstruction queue    : 24.83 cycles\ndecoding             : 24.83 cycles\nmicro-operation queue: 25.00 cycles\nfront end            : 25.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 13.50 | 13.50 | 6.00 | 6.00 | 4.67 | 5.00 | 3.00\ncycles | 13.50 | 13.50 | 6.00 | 6.00 | 4.67 | 5.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 25.00\nDispatch  : 15.00\nData deps.: 4.00\nOverall L1: 25.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 22%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 22%\nFP\nall     : 49%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 91%\nINT+FP\nall     : 46%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 70%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 30%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 30%\nFP\nall     : 22%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 24%\nINT+FP\nall     : 22%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 24%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 25.00 cycles. At this rate:\n - 1% of peak load performance is reached (1.76 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.59 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
      },
      header = {
        "4% of peak computational performance is used (2.90 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "46% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 70% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is poorly vectorized.\nOnly 22% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 25.00 to 11.55 cycles (2.16x speedup).",
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
      "Warnings:\nNon-innermost loop: analyzing only self part (ignoring child loops).",
      "This loop has 3 execution paths.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside loop: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the loop)\n - turning them into conditional moves, MIN or MAX\n\n",
    },
    nb_paths = 3,
  },
}

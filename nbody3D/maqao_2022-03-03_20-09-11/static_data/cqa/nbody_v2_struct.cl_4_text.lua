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
          txt = "The binary loop is composed of 6 FP arithmetical operations:\n - 3: addition or subtraction (all inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 24 bytes (6 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.17 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 20\nloop length        : 100\nused x86 registers : 9\nused mmx registers : 0\nused xmm registers : 7\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 7.00 cycles\ninstruction queue    : 10.00 cycles\ndecoding             : 10.00 cycles\nmicro-operation queue: 10.00 cycles\nfront end            : 10.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6\n-------------------------------------------------------\nuops   | 1.50 | 1.50 | 4.50 | 4.50 | 3.00 | 4.00 | 3.00\ncycles | 1.50 | 1.50 | 4.50 | 4.50 | 3.00 | 4.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 10.00\nDispatch  : 4.50\nData deps.: 4.00\nOverall L1: 10.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 25%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 100%\nINT+FP\nall     : 21%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 60%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 9%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 9%\nFP\nall     : 10%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 25%\nINT+FP\nall     : 10%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 18%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 10.00 cycles. At this rate:\n - 1% of peak load performance is reached (2.40 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (1.20 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 10.00 to 7.00 cycles (1.43x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401381\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nVFMADD213SS (%R8,%R11,4),%XMM8,%XMM5  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM5,(%R8,%R11,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R9,%R11,4),%XMM8,%XMM2  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%R9,%R11,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R10,%R11,4),%XMM8,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R10,%R11,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%R11                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %RBX,%R11                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 401675 <move_particles+0x395>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMP $0x20,%RBX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMOVSS (%RDI,%R11,4),%XMM18           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RAX,%R11,4),%XMM27           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RCX,%R11,4),%XMM31           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJAE 4013b0 <move_particles+0xd0>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVXORPS %XMM5,%XMM5,%XMM5\nVXORPS %XMM2,%XMM2,%XMM2\nVXORPS %XMM1,%XMM1,%XMM1\nXOR %ESI,%ESI\nJMP 401610 <move_particles+0x330>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nJMP 401350 <move_particles+0x70>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.60 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 10.00 to 8.00 cycles (1.25x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 10% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 10.00 to 0.66 cycles (15.24x speedup).",
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
          txt = "The binary loop is composed of 129 FP arithmetical operations:\n - 126: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 24 bytes (6 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 3.58 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 64\nloop length        : 327\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 15\nused ymm registers : 4\nused zmm registers : 12\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 21.00 cycles\ninstruction queue    : 32.00 cycles\ndecoding             : 32.00 cycles\nmicro-operation queue: 32.00 cycles\nfront end            : 32.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 21.00 | 21.00 | 4.50 | 4.50 | 6.50 | 6.50 | 3.00\ncycles | 21.00 | 21.00 | 4.50 | 4.50 | 6.50 | 6.50 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 32.00\nDispatch  : 21.00\nData deps.: 4.00\nOverall L1: 32.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 42%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 42%\nFP\nall     : 68%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 87%\nINT+FP\nall     : 65%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 77%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 49%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 49%\nFP\nall     : 29%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 24%\nINT+FP\nall     : 31%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 29%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n - 0% of peak load performance is reached (0.75 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.38 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 32.00 to 21.00 cycles (1.52x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401381\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nVFMADD213SS (%R8,%R11,4),%XMM8,%XMM5  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM5,(%R8,%R11,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R9,%R11,4),%XMM8,%XMM2  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%R9,%R11,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R10,%R11,4),%XMM8,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R10,%R11,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%R11                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %RBX,%R11                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 401675 <move_particles+0x395>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMP $0x20,%RBX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMOVSS (%RDI,%R11,4),%XMM18           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RAX,%R11,4),%XMM27           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RCX,%R11,4),%XMM31           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJAE 4013b0 <move_particles+0xd0>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVAPS %XMM10,%XMM4                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM9,%XMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM8,%XMM0                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVBROADCASTSS %XMM18,%ZMM10            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM27,%ZMM11            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM31,%ZMM12            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVPXORD %ZMM23,%ZMM23,%ZMM23           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMOV $0,%ESI                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVPXORD %ZMM24,%ZMM24,%ZMM24           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVXORPS %XMM13,%XMM13,%XMM13\nVXORPS %XMM15,%XMM15,%XMM15\nVXORPS %XMM1,%XMM1,%XMM1\nVPXORD %ZMM16,%ZMM16,%ZMM16           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nNOPW %CS:(%RAX,%RAX,1)                | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nNOPL (%RAX)                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nCMP %RBX,%R15                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVADDPS %ZMM1,%ZMM16,%ZMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM1,%YMM2        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM2,%ZMM1,%ZMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM1,%XMM2         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM2,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM1,%XMM2            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM2,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM1,%XMM2                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM2,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM13,%ZMM15,%ZMM2            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM2,%YMM5        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM5,%ZMM2,%ZMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM2,%XMM5         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM5,%XMM2,%XMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM2,%XMM5            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM5,%XMM2,%XMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM2,%XMM5                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM5,%XMM2,%XMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM23,%ZMM24,%ZMM5            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM5,%YMM6        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM6,%ZMM5,%ZMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM5,%XMM6         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM6,%XMM5,%XMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM5,%XMM6            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM6,%XMM5,%XMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM5,%XMM6                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM6,%XMM5,%XMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOV %R15,%RSI                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVMOVAPS %XMM0,%XMM8                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM3,%XMM9                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM4,%XMM10                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nJE 401350 <move_particles+0x70>       | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nNOP                                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nJMP 401350 <move_particles+0x70>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\n",
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
          details = "65% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 77% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 31% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 32.00 to 18.84 cycles (1.70x speedup).",
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
          txt = "The binary loop is composed of 129 FP arithmetical operations:\n - 126: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 24 bytes (6 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 3.58 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 62\nloop length        : 321\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 15\nused ymm registers : 4\nused zmm registers : 12\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 21.00 cycles\ninstruction queue    : 31.00 cycles\ndecoding             : 31.00 cycles\nmicro-operation queue: 31.00 cycles\nfront end            : 31.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 21.00 | 21.00 | 4.50 | 4.50 | 5.50 | 5.50 | 3.00\ncycles | 21.00 | 21.00 | 4.50 | 4.50 | 5.50 | 5.50 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 31.00\nDispatch  : 21.00\nData deps.: 4.00\nOverall L1: 31.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 42%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 42%\nFP\nall     : 68%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 87%\nINT+FP\nall     : 65%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 77%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 49%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 49%\nFP\nall     : 29%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 24%\nINT+FP\nall     : 31%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 29%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 31.00 cycles. At this rate:\n - 0% of peak load performance is reached (0.77 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.39 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 31.00 to 21.00 cycles (1.48x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401381\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nVFMADD213SS (%R8,%R11,4),%XMM8,%XMM5  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM5,(%R8,%R11,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R9,%R11,4),%XMM8,%XMM2  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,(%R9,%R11,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R10,%R11,4),%XMM8,%XMM1 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R10,%R11,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%R11                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %RBX,%R11                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 401675 <move_particles+0x395>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMP $0x20,%RBX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMOVSS (%RDI,%R11,4),%XMM18           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RAX,%R11,4),%XMM27           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%RCX,%R11,4),%XMM31           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJAE 4013b0 <move_particles+0xd0>      | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVAPS %XMM10,%XMM4                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM9,%XMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM8,%XMM0                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVBROADCASTSS %XMM18,%ZMM10            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM27,%ZMM11            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVBROADCASTSS %XMM31,%ZMM12            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVPXORD %ZMM23,%ZMM23,%ZMM23           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMOV $0,%ESI                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVPXORD %ZMM24,%ZMM24,%ZMM24           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVXORPS %XMM13,%XMM13,%XMM13\nVXORPS %XMM15,%XMM15,%XMM15\nVXORPS %XMM1,%XMM1,%XMM1\nVPXORD %ZMM16,%ZMM16,%ZMM16           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nNOPW %CS:(%RAX,%RAX,1)                | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nNOPL (%RAX)                           | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nCMP %RBX,%R15                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVADDPS %ZMM1,%ZMM16,%ZMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM1,%YMM2        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM2,%ZMM1,%ZMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM1,%XMM2         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM2,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM1,%XMM2            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM2,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM1,%XMM2                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM2,%XMM1,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM13,%ZMM15,%ZMM2            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM2,%YMM5        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM5,%ZMM2,%ZMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM2,%XMM5         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM5,%XMM2,%XMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM2,%XMM5            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM5,%XMM2,%XMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM2,%XMM5                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM5,%XMM2,%XMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM23,%ZMM24,%ZMM5            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM5,%YMM6        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %ZMM6,%ZMM5,%ZMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM5,%XMM6         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM6,%XMM5,%XMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMILPD $0x1,%XMM5,%XMM6            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM6,%XMM5,%XMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSHDUP %XMM5,%XMM6                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDSS %XMM6,%XMM5,%XMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOV %R15,%RSI                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVMOVAPS %XMM0,%XMM8                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM3,%XMM9                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %XMM4,%XMM10                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nJE 401350 <move_particles+0x70>       | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
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
          details = "65% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 77% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 31% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 31.00 to 17.84 cycles (1.74x speedup).",
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
          txt = "The binary loop is composed of 88 FP arithmetical operations:\n - 85: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 24 bytes (6 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 2.44 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 48.67\nloop length        : 249.33\nused x86 registers : 9.67\nused mmx registers : 0\nused xmm registers : 12.33\nused ymm registers : 2.67\nused zmm registers : 8\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 16.33 cycles\ninstruction queue    : 24.33 cycles\ndecoding             : 24.33 cycles\nmicro-operation queue: 24.33 cycles\nfront end            : 24.33 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 14.50 | 14.50 | 4.50 | 4.50 | 5.00 | 5.33 | 3.00\ncycles | 14.50 | 14.50 | 4.50 | 4.50 | 5.00 | 5.33 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 24.33\nDispatch  : 15.50\nData deps.: 4.00\nOverall L1: 24.33\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 28%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 28%\nFP\nall     : 54%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 91%\nINT+FP\nall     : 50%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 71%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 35%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 35%\nFP\nall     : 23%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 24%\nINT+FP\nall     : 24%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 51%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 26%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.33 cycles. At this rate:\n - 1% of peak load performance is reached (1.31 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (0.65 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
      },
      header = {
        "4% of peak computational performance is used (2.93 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "50% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 71% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 24% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 24.33 to 12.45 cycles (1.95x speedup).",
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

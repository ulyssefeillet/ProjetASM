_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF64X4: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 3 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n12 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 105 FP arithmetical operations:\n - 102: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 96 bytes (24 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.97 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 79\nloop length        : 411\nused x86 registers : 14\nused mmx registers : 0\nused xmm registers : 8\nused ymm registers : 14\nused zmm registers : 7\nnb stack references: 9\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 26.00 cycles\ninstruction queue    : 39.50 cycles\ndecoding             : 39.50 cycles\nmicro-operation queue: 40.00 cycles\nfront end            : 40.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4    | P5    | P6\n-----------------------------------------------------------\nuops   | 19.50 | 19.50 | 9.00 | 9.00 | 14.00 | 14.00 | 3.00\ncycles | 19.50 | 19.50 | 9.00 | 9.00 | 14.00 | 14.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 40.00\nDispatch  : 19.50\nOverall L1: 40.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 25%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 30%\nFP\nall     : 69%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 83%\nINT+FP\nall     : 58%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 64%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 15%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 16%\nFP\nall     : 40%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 41%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 51%\nINT+FP\nall     : 34%\nload    : 8%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 41%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 38%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 40.00 cycles. At this rate:\n - 1% of peak load performance is reached (2.40 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.30 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 40301b\n\nInstruction                            | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------------------\nVMOVAPS %ZMM16,%ZMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM3,%ZMM2                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM2,%ZMM0                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nCMP $0x960,%R12                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJB 403246 <main+0xef6>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV %R11,%RBX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nTEST %R11,%R11                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 402d70 <main+0xa20>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMPQ $0,0x40(%RSP)                     | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nJNE 40323e <main+0xeee>                | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMP %RCX,%R12                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nMOV %RCX,%RBX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nCMOVB %R12,%RBX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 2       | 1\nMOV %R12,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nSUB %RBX,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nAND $0xf,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nNEG %R14                               | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nADD %R12,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP $0x1,%RBX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJB 402d75 <main+0xa25>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV 0x28(%RSP),%R14                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nLEA 0x10(%RBX),%RDI                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %RDI,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJB 402ea6 <main+0xb56>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVBROADCASTSS (%RDX,%R10,4),%ZMM24      | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVBROADCASTSS (%RAX,%R10,4),%ZMM25      | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVBROADCASTSS (%R9,%R10,4),%ZMM26       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOV 0x48(%RSP),%RDI                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x50(%RSP),%R8                     | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x80(%RSP),%R13                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nLEA 0x1(%R14),%RBX                     | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %R12,%RBX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJA 40301b <main+0xccb>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVEXTRACTF64X4 $0x1,%ZMM2,%YMM13        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nMOV 0x30(%RSP),%RBX                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x38(%RSP),%RDI                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVEXTRACTF64X4 $0x1,%ZMM0,%YMM4         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM0,%YMM4,%YMM6               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM2,%YMM13,%YMM15             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMPD $-0x56,%YMM6,%YMM7             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $0x55,%YMM6,%YMM8              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $-0x1,%YMM6,%YMM5              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $-0x1,%YMM15,%YMM14            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $-0x56,%YMM15,%YMM0            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $0x55,%YMM15,%YMM2             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDPS %YMM8,%YMM7,%YMM10              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM3,%YMM8         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM6,%YMM5,%YMM9               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM15,%YMM14,%YMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM2,%YMM0,%YMM5               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM3,%YMM8,%YMM8               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM5,%YMM4,%YMM6               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMPD $-0x1,%YMM8,%YMM3              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $-0x56,%YMM8,%YMM0             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $0x55,%YMM8,%YMM2              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDPS %YMM8,%YMM3,%YMM4               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM2,%YMM0,%YMM5               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%XMM6,%XMM7               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDSS %XMM6,%XMM7,%XMM23              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM5,%YMM4,%YMM6               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM10,%YMM9,%YMM11             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%XMM6,%XMM7               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDSS %XMM6,%XMM7,%XMM22              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%XMM11,%XMM12             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDSS %XMM11,%XMM12,%XMM21            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213SS (%RSI,%R10,4),%XMM1,%XMM22 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM22,(%RSI,%R10,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%RBX,%R10,4),%XMM1,%XMM23 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM23,(%RBX,%R10,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%RDI,%R10,4),%XMM1,%XMM21 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM21,(%RDI,%R10,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%R10                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP 0x88(%RSP),%R10                    | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nJB 402bb4 <main+0x864>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nXOR %R14D,%R14D\nJMP 402ea6 <main+0xb56>                | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nMOV (%RSP),%R14                        | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nXOR %EBX,%EBX\nJMP 402d75 <main+0xa25>                | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\n",
        },
      },
      header = {
        "4% of peak computational performance is used (2.63 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 40.00 to 26.00 cycles (1.54x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "58% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 64% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 34% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 40.00 to 8.39 cycles (4.77x speedup).",
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
          details = " - VEXTRACTF64X4: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 3 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n12 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 105 FP arithmetical operations:\n - 102: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 96 bytes (24 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.97 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 79\nloop length        : 411\nused x86 registers : 14\nused mmx registers : 0\nused xmm registers : 8\nused ymm registers : 14\nused zmm registers : 7\nnb stack references: 9\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 26.00 cycles\ninstruction queue    : 39.50 cycles\ndecoding             : 39.50 cycles\nmicro-operation queue: 40.00 cycles\nfront end            : 40.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4    | P5    | P6\n-----------------------------------------------------------\nuops   | 19.50 | 19.50 | 9.00 | 9.00 | 14.00 | 14.00 | 3.00\ncycles | 19.50 | 19.50 | 9.00 | 9.00 | 14.00 | 14.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 40.00\nDispatch  : 19.50\nOverall L1: 40.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 25%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 30%\nFP\nall     : 69%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 83%\nINT+FP\nall     : 58%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 64%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 15%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 16%\nFP\nall     : 40%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 41%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 51%\nINT+FP\nall     : 34%\nload    : 8%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 41%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 38%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 40.00 cycles. At this rate:\n - 1% of peak load performance is reached (2.40 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.30 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 40301b\n\nInstruction                            | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------------------\nVMOVAPS %ZMM16,%ZMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM3,%ZMM2                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM2,%ZMM0                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nCMP $0x960,%R12                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJB 403246 <main+0xef6>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV %R11,%RBX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nTEST %R11,%R11                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 402d70 <main+0xa20>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMPQ $0,0x40(%RSP)                     | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nJNE 40323e <main+0xeee>                | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCMP %RCX,%R12                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nMOV %RCX,%RBX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nCMOVB %R12,%RBX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 2       | 1\nMOV %R12,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nSUB %RBX,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nAND $0xf,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nNEG %R14                               | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nADD %R12,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP $0x1,%RBX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJB 402d75 <main+0xa25>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV 0x28(%RSP),%R14                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nLEA 0x10(%RBX),%RDI                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %RDI,%R14                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJB 402ea6 <main+0xb56>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVBROADCASTSS (%RDX,%R10,4),%ZMM24      | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVBROADCASTSS (%RAX,%R10,4),%ZMM25      | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVBROADCASTSS (%R9,%R10,4),%ZMM26       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOV 0x48(%RSP),%RDI                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x50(%RSP),%R8                     | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x80(%RSP),%R13                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nLEA 0x1(%R14),%RBX                     | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %R12,%RBX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJA 40301b <main+0xccb>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVEXTRACTF64X4 $0x1,%ZMM2,%YMM13        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nMOV 0x30(%RSP),%RBX                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nMOV 0x38(%RSP),%RDI                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVEXTRACTF64X4 $0x1,%ZMM0,%YMM4         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM0,%YMM4,%YMM6               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM2,%YMM13,%YMM15             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMPD $-0x56,%YMM6,%YMM7             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $0x55,%YMM6,%YMM8              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $-0x1,%YMM6,%YMM5              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $-0x1,%YMM15,%YMM14            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $-0x56,%YMM15,%YMM0            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $0x55,%YMM15,%YMM2             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDPS %YMM8,%YMM7,%YMM10              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM3,%YMM8         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM6,%YMM5,%YMM9               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM15,%YMM14,%YMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM2,%YMM0,%YMM5               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM3,%YMM8,%YMM8               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM5,%YMM4,%YMM6               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPERMPD $-0x1,%YMM8,%YMM3              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $-0x56,%YMM8,%YMM0             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVPERMPD $0x55,%YMM8,%YMM2              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDPS %YMM8,%YMM3,%YMM4               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM2,%YMM0,%YMM5               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%XMM6,%XMM7               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDSS %XMM6,%XMM7,%XMM23              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM5,%YMM4,%YMM6               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %YMM10,%YMM9,%YMM11             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%XMM6,%XMM7               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDSS %XMM6,%XMM7,%XMM22              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%XMM11,%XMM12             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVADDSS %XMM11,%XMM12,%XMM21            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213SS (%RSI,%R10,4),%XMM1,%XMM22 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM22,(%RSI,%R10,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%RBX,%R10,4),%XMM1,%XMM23 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM23,(%RBX,%R10,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%RDI,%R10,4),%XMM1,%XMM21 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM21,(%RDI,%R10,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nADD $0x1,%R10                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP 0x88(%RSP),%R10                    | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nJB 402bb4 <main+0x864>                 | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nXOR %R14D,%R14D\nJMP 402ea6 <main+0xb56>                | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nMOV (%RSP),%R14                        | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nXOR %EBX,%EBX\nJMP 402d75 <main+0xa25>                | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\n",
        },
      },
      header = {
        "4% of peak computational performance is used (2.63 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 40.00 to 26.00 cycles (1.54x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "58% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 80% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 64% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 34% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 40.00 to 8.39 cycles (4.77x speedup).",
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
      "Warnings:\n - Non-innermost loop: analyzing only self part (ignoring child loops).\n - Ignoring paths for analysis\n - Failed to get the number of paths\n - RecMII not computed since number of paths is unknown or > max_paths\n - Streams not analyzed since number of paths is unknown or > max_paths\n",
    },
  },
}

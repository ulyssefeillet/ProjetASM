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
          txt = "The binary loop is composed of 69 FP arithmetical operations:\n - 66: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 56 bytes (14 single precision FP elements).\nThe binary loop is storing 20 bytes (5 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.91 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 78\nloop length        : 387\nused x86 registers : 14\nused mmx registers : 0\nused xmm registers : 13\nused ymm registers : 5\nused zmm registers : 9\nnb stack references: 4\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 25.00 cycles\ninstruction queue    : 39.00 cycles\ndecoding             : 39.00 cycles\nmicro-operation queue: 39.00 cycles\nfront end            : 39.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4    | P5    | P6\n-----------------------------------------------------------\nuops   | 22.00 | 22.00 | 7.00 | 7.00 | 10.00 | 10.00 | 4.00\ncycles | 22.00 | 22.00 | 7.00 | 7.00 | 10.00 | 10.00 | 4.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 39.00\nDispatch  : 22.00\nOverall L1: 39.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 23%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 30%\nFP\nall     : 60%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 70%\nINT+FP\nall     : 52%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 75%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 58%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 19%\nload   : 12%\nstore  : 12%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 12%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 21%\nFP\nall     : 29%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 26%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 39%\nINT+FP\nall     : 27%\nload    : 8%\nstore   : 7%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 25%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 34%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 39.00 cycles. At this rate:\n - 1% of peak load performance is reached (1.44 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.51 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 39.00 to 25.00 cycles (1.56x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1420\n\nInstruction                            | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------------------\nVMOVSS (%RSI,%RAX,4),%XMM11            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nCMP %R10,0x48(%RSP)                    | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nVMOVSS (%R8,%RAX,4),%XMM7              | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%R9,%RAX,4),%XMM6              | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJB 17f8 <main+0x678>                   | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nTEST %RCX,%RCX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 1810 <main+0x690>                   | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVAPS %ZMM5,%ZMM16                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM5,%ZMM17                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVSS %XMM5,%XMM5,%XMM15              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nXOR %EDX,%EDX\nNOPW (%RAX,%RAX,1)                     | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nLEA (%RCX),%RDX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVXORPS %XMM13,%XMM13,%XMM13\nVBROADCASTSS %XMM11,%ZMM22             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nMOV %R13,0xd8(%RSP)                    | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nVBROADCASTSS %XMM7,%ZMM21              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nLEA (%R14),%R13                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVBROADCASTSS %XMM6,%ZMM20              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nXOR %EDI,%EDI\nVMOVAPS %ZMM13,%ZMM12                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM13,%ZMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nLEA (%RAX),%R14                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nNOPL (%RAX)                            | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM13,%YMM0        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nLEA (%R14),%RAX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVADDPS %YMM13,%YMM0,%YMM13             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM3,%YMM1         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM3,%YMM1,%YMM1               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOV 0x68(%RSP),%RDI                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nLEA (%R13),%R14                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVEXTRACTF128 $0x1,%YMM13,%XMM0         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM13,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM1,%XMM3          | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM1,%XMM3,%XMM3               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADD %RDI,%RDX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nMOV 0xd8(%RSP),%R13                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nCMP 0x60(%RSP),%RDI                    | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nVMOVHLPS %XMM0,%XMM0,%XMM13            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM0,%XMM13,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVHLPS %XMM3,%XMM3,%XMM1             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM3,%XMM1,%XMM3               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM0,%XMM0,%XMM13       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM0,%XMM13,%XMM13             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM12,%YMM0        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSHUFPS $0x55,%XMM3,%XMM3,%XMM1        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %YMM12,%YMM0,%YMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %XMM3,%XMM1,%XMM1               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM13,%XMM16,%XMM16            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM0,%XMM12         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM0,%XMM12,%XMM12             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM1,%XMM15,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVHLPS %XMM12,%XMM12,%XMM0           | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM12,%XMM0,%XMM12             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM12,%XMM12,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM12,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM0,%XMM17,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nJE 16d2 <main+0x552>                   | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nNOPL (%RAX)                            | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVFMADD213SS (%R11,%RAX,4),%XMM4,%XMM1  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R11,%RAX,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%RBX,%RAX,4),%XMM4,%XMM0  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RBX,%RAX,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R12,%RAX,4),%XMM4,%XMM16 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM16,(%R12,%RAX,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nLEA 0x1(%RAX),%RAX                     | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %R13,%RAX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 1420 <main+0x2a0>                  | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVAPS %ZMM5,%ZMM16                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVSS %XMM5,%XMM5,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVMOVSS %XMM5,%XMM5,%XMM1               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nXOR %EDX,%EDX\nJMP 1670 <main+0x4f0>                  | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nXOR %EDX,%EDX\nVMOVAPS %ZMM5,%ZMM16                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM5,%ZMM17                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVSS %XMM5,%XMM5,%XMM15              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nJMP 14c9 <main+0x349>                  | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\n",
        },
      },
      header = {
        "2% of peak computational performance is used (1.77 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 39.00 to 30.00 cycles (1.30x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "52% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 75% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 58% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 27% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 39.00 to 5.34 cycles (7.30x speedup).",
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
          txt = "The binary loop is composed of 69 FP arithmetical operations:\n - 66: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 56 bytes (14 single precision FP elements).\nThe binary loop is storing 20 bytes (5 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.91 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 78\nloop length        : 387\nused x86 registers : 14\nused mmx registers : 0\nused xmm registers : 13\nused ymm registers : 5\nused zmm registers : 9\nnb stack references: 4\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 25.00 cycles\ninstruction queue    : 39.00 cycles\ndecoding             : 39.00 cycles\nmicro-operation queue: 39.00 cycles\nfront end            : 39.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4    | P5    | P6\n-----------------------------------------------------------\nuops   | 22.00 | 22.00 | 7.00 | 7.00 | 10.00 | 10.00 | 4.00\ncycles | 22.00 | 22.00 | 7.00 | 7.00 | 10.00 | 10.00 | 4.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 39.00\nDispatch  : 22.00\nOverall L1: 39.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 23%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 30%\nFP\nall     : 60%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 80%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 70%\nINT+FP\nall     : 52%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 75%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 58%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 19%\nload   : 12%\nstore  : 12%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 12%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 21%\nFP\nall     : 29%\nload    : 6%\nstore   : 6%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 26%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 39%\nINT+FP\nall     : 27%\nload    : 8%\nstore   : 7%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 25%\nfma     : 6%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 34%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 39.00 cycles. At this rate:\n - 1% of peak load performance is reached (1.44 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 0% of peak store performance is reached (0.51 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 39.00 to 25.00 cycles (1.56x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1420\n\nInstruction                            | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------------------\nVMOVSS (%RSI,%RAX,4),%XMM11            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nCMP %R10,0x48(%RSP)                    | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nVMOVSS (%R8,%RAX,4),%XMM7              | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS (%R9,%RAX,4),%XMM6              | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nJB 17f8 <main+0x678>                   | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nTEST %RCX,%RCX                         | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 1810 <main+0x690>                   | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVAPS %ZMM5,%ZMM16                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM5,%ZMM17                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVSS %XMM5,%XMM5,%XMM15              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nXOR %EDX,%EDX\nNOPW (%RAX,%RAX,1)                     | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nLEA (%RCX),%RDX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVXORPS %XMM13,%XMM13,%XMM13\nVBROADCASTSS %XMM11,%ZMM22             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nMOV %R13,0xd8(%RSP)                    | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nVBROADCASTSS %XMM7,%ZMM21              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nLEA (%R14),%R13                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVBROADCASTSS %XMM6,%ZMM20              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nXOR %EDI,%EDI\nVMOVAPS %ZMM13,%ZMM12                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM13,%ZMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nLEA (%RAX),%R14                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nNOPL (%RAX)                            | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM13,%YMM0        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nLEA (%R14),%RAX                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVADDPS %YMM13,%YMM0,%YMM13             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM3,%YMM1         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %YMM3,%YMM1,%YMM1               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOV 0x68(%RSP),%RDI                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nLEA (%R13),%R14                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVEXTRACTF128 $0x1,%YMM13,%XMM0         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM13,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM1,%XMM3          | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM1,%XMM3,%XMM3               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADD %RDI,%RDX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nMOV 0xd8(%RSP),%R13                    | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nCMP 0x60(%RSP),%RDI                    | 1     | 0    | 0    | 1    | 0    | 0.50 | 0.50 | 0  | 1       | 1\nVMOVHLPS %XMM0,%XMM0,%XMM13            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM0,%XMM13,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVHLPS %XMM3,%XMM3,%XMM1             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM3,%XMM1,%XMM3               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM0,%XMM0,%XMM13       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM0,%XMM13,%XMM13             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTI64X4 $0x1,%ZMM12,%YMM0        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSHUFPS $0x55,%XMM3,%XMM3,%XMM1        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %YMM12,%YMM0,%YMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %XMM3,%XMM1,%XMM1               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM13,%XMM16,%XMM16            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF128 $0x1,%YMM0,%XMM12         | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM0,%XMM12,%XMM12             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM1,%XMM15,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVHLPS %XMM12,%XMM12,%XMM0           | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVADDPS %XMM12,%XMM0,%XMM12             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSHUFPS $0x55,%XMM12,%XMM12,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4-7     | 2\nVADDPS %XMM12,%XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM0,%XMM17,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nJE 16d2 <main+0x552>                   | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nNOPL (%RAX)                            | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nVFMADD213SS (%R11,%RAX,4),%XMM4,%XMM1  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM1,(%R11,%RAX,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%RBX,%RAX,4),%XMM4,%XMM0  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RBX,%RAX,4)             | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nVFMADD213SS (%R12,%RAX,4),%XMM4,%XMM16 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM16,(%R12,%RAX,4)            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nLEA 0x1(%RAX),%RAX                     | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %R13,%RAX                          | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 1420 <main+0x2a0>                  | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVAPS %ZMM5,%ZMM16                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVSS %XMM5,%XMM5,%XMM0               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVMOVSS %XMM5,%XMM5,%XMM1               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nXOR %EDX,%EDX\nJMP 1670 <main+0x4f0>                  | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\nXOR %EDX,%EDX\nVMOVAPS %ZMM5,%ZMM16                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM5,%ZMM17                   | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVSS %XMM5,%XMM5,%XMM15              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nJMP 14c9 <main+0x349>                  | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 2\n",
        },
      },
      header = {
        "2% of peak computational performance is used (1.77 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 39.00 to 30.00 cycles (1.30x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "52% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 75% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 58% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 27% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 39.00 to 5.34 cycles (7.30x speedup).",
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

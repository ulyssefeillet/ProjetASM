_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF64X4: 2 occurrences\n - VINSERTF64X4: 2 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 4 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 4 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 4 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "24 AVX-512 instructions are processing arithmetic or math operations on single precision FP elements in vector mode (sixteen at a time).\n8 AVX-512 instructions are processing arithmetic or math operations on double precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 704 FP arithmetical operations:\n - 352: addition or subtraction (256 inside FMA instructions)\n - 288: multiply (256 inside FMA instructions)\n - 32: fast reciprocal\n - 32: square root\nThe binary loop is loading 384 bytes (96 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.83 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 59\nloop length        : 362\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 4\nused zmm registers : 25\nnb stack references: 0\nADD-SUB / MUL ratio: 1.50\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 23.00 cycles\ninstruction queue    : 29.50 cycles\ndecoding             : 29.50 cycles\nmicro-operation queue: 30.00 cycles\nfront end            : 30.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 94.00 | 32.00 | 3.00 | 3.00 | 1.50 | 1.50 | 0.00\ncycles | 94.00 | 32.00 | 3.00 | 3.00 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: 64.00-68.00\nLongest recurrence chain latency (RecMII): 10.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 30.00\nDispatch  : 94.00\nDIV/SQRT  : 64.00-68.00\nData deps.: 10.00\nOverall L1: 94.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\nINT+FP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 92%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 75%\nINT+FP\nall     : 92%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 77%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 94.00 cycles. At this rate:\n - 3% of peak load performance is reached (4.09 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401580\n\nInstruction                          | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------\nVMOVAPS %ZMM14,%ZMM1                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM13,%ZMM17                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM23,%ZMM18              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM22,%ZMM19              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVUPS (%RAX,%RBX,4),%ZMM7          | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVUPS 0x40(%RAX,%RBX,4),%ZMM8      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM9,%ZMM7,%ZMM22            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM9,%ZMM8,%ZMM23            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVUPS (%RSI,%RBX,4),%ZMM13         | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVUPS 0x40(%RSI,%RBX,4),%ZMM14     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM10,%ZMM13,%ZMM13          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM10,%ZMM14,%ZMM14          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVUPS (%RDI,%RBX,4),%ZMM20         | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVUPS 0x40(%RDI,%RBX,4),%ZMM21     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM11,%ZMM20,%ZMM20          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM11,%ZMM21,%ZMM21          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVAPS %ZMM22,%ZMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVFMADD213PS %ZMM24,%ZMM22,%ZMM7      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVAPS %ZMM23,%ZMM8                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVFMADD213PS %ZMM24,%ZMM23,%ZMM8      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM13,%ZMM13,%ZMM7      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM14,%ZMM14,%ZMM8      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM20,%ZMM20,%ZMM7      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM21,%ZMM21,%ZMM8      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM7,%YMM12      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVCVTPS2PD %YMM12,%ZMM12              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPS2PD %YMM7,%ZMM7                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM7,%ZMM25                 | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVEXTRACTF64X4 $0x1,%ZMM8,%YMM4       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSQRTPD %ZMM12,%ZMM27                | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVCVTPS2PD %YMM8,%ZMM8                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM8,%ZMM28                 | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVCVTPS2PD %YMM4,%ZMM4                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM4,%ZMM29                 | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVMULPD %ZMM12,%ZMM27,%ZMM12          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMULPD %ZMM7,%ZMM25,%ZMM7            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM7,%YMM7                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM12,%YMM12              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM12,%ZMM7,%ZMM7 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVRCP14PS %ZMM7,%ZMM12                | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVMULPD %ZMM4,%ZMM29,%ZMM4            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMULPD %ZMM8,%ZMM28,%ZMM8            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM8,%YMM8                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM4,%YMM4                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM4,%ZMM8,%ZMM4  | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVRCP14PS %ZMM4,%ZMM8                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVFNMADD213PS %ZMM16,%ZMM12,%ZMM7     | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD132PS %ZMM12,%ZMM12,%ZMM7      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFNMADD213PS %ZMM16,%ZMM8,%ZMM4      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD132PS %ZMM8,%ZMM8,%ZMM4        | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM19,%ZMM7,%ZMM22      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM18,%ZMM4,%ZMM23      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM17,%ZMM7,%ZMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM1,%ZMM4,%ZMM14       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM7,%ZMM20,%ZMM0       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM4,%ZMM21,%ZMM15      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADD $0x20,%RBX                       | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %RBX,%RBP                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 401580 <.omp_outlined.+0x1c0>    | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "11% of peak computational performance is used (7.49 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 92% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 94.00 to 88.00 cycles (1.07x speedup).",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Reduce the number of FP add instructions\n - Reduce the number of FP multiply/FMA instructions\n - Reduce arithmetical operations on array elements\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - execution of divide and square root operations (the divide/square root unit is a bottleneck)\n - execution of FP add operations (the FP add unit is a bottleneck)\n - execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)\n - execution of INT/FP operations in vector registers (the VPU is a bottleneck)\n",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 256 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF64X4: 2 occurrences\n - VINSERTF64X4: 2 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 4 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 4 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 4 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "24 AVX-512 instructions are processing arithmetic or math operations on single precision FP elements in vector mode (sixteen at a time).\n8 AVX-512 instructions are processing arithmetic or math operations on double precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 704 FP arithmetical operations:\n - 352: addition or subtraction (256 inside FMA instructions)\n - 288: multiply (256 inside FMA instructions)\n - 32: fast reciprocal\n - 32: square root\nThe binary loop is loading 384 bytes (96 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.83 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 59\nloop length        : 362\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 4\nused zmm registers : 25\nnb stack references: 0\nADD-SUB / MUL ratio: 1.50\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 23.00 cycles\ninstruction queue    : 29.50 cycles\ndecoding             : 29.50 cycles\nmicro-operation queue: 30.00 cycles\nfront end            : 30.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 94.00 | 32.00 | 3.00 | 3.00 | 1.50 | 1.50 | 0.00\ncycles | 94.00 | 32.00 | 3.00 | 3.00 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: 64.00-68.00\nLongest recurrence chain latency (RecMII): 10.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 30.00\nDispatch  : 94.00\nDIV/SQRT  : 64.00-68.00\nData deps.: 10.00\nOverall L1: 94.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\nINT+FP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 92%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 75%\nINT+FP\nall     : 92%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 77%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 94.00 cycles. At this rate:\n - 3% of peak load performance is reached (4.09 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401580\n\nInstruction                          | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------\nVMOVAPS %ZMM14,%ZMM1                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVAPS %ZMM13,%ZMM17                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM23,%ZMM18              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM22,%ZMM19              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVUPS (%RAX,%RBX,4),%ZMM7          | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVUPS 0x40(%RAX,%RBX,4),%ZMM8      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM9,%ZMM7,%ZMM22            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM9,%ZMM8,%ZMM23            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVUPS (%RSI,%RBX,4),%ZMM13         | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVUPS 0x40(%RSI,%RBX,4),%ZMM14     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM10,%ZMM13,%ZMM13          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM10,%ZMM14,%ZMM14          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVUPS (%RDI,%RBX,4),%ZMM20         | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVUPS 0x40(%RDI,%RBX,4),%ZMM21     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM11,%ZMM20,%ZMM20          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM11,%ZMM21,%ZMM21          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVAPS %ZMM22,%ZMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVFMADD213PS %ZMM24,%ZMM22,%ZMM7      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVAPS %ZMM23,%ZMM8                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVFMADD213PS %ZMM24,%ZMM23,%ZMM8      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM13,%ZMM13,%ZMM7      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM14,%ZMM14,%ZMM8      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM20,%ZMM20,%ZMM7      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM21,%ZMM21,%ZMM8      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM7,%YMM12      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVCVTPS2PD %YMM12,%ZMM12              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPS2PD %YMM7,%ZMM7                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM7,%ZMM25                 | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVEXTRACTF64X4 $0x1,%ZMM8,%YMM4       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSQRTPD %ZMM12,%ZMM27                | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVCVTPS2PD %YMM8,%ZMM8                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM8,%ZMM28                 | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVCVTPS2PD %YMM4,%ZMM4                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM4,%ZMM29                 | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVMULPD %ZMM12,%ZMM27,%ZMM12          | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMULPD %ZMM7,%ZMM25,%ZMM7            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM7,%YMM7                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM12,%YMM12              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM12,%ZMM7,%ZMM7 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVRCP14PS %ZMM7,%ZMM12                | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVMULPD %ZMM4,%ZMM29,%ZMM4            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMULPD %ZMM8,%ZMM28,%ZMM8            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM8,%YMM8                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM4,%YMM4                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM4,%ZMM8,%ZMM4  | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVRCP14PS %ZMM4,%ZMM8                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVFNMADD213PS %ZMM16,%ZMM12,%ZMM7     | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD132PS %ZMM12,%ZMM12,%ZMM7      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFNMADD213PS %ZMM16,%ZMM8,%ZMM4      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD132PS %ZMM8,%ZMM8,%ZMM4        | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM19,%ZMM7,%ZMM22      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM18,%ZMM4,%ZMM23      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM17,%ZMM7,%ZMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM1,%ZMM4,%ZMM14       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM7,%ZMM20,%ZMM0       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM4,%ZMM21,%ZMM15      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADD $0x20,%RBX                       | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %RBX,%RBP                        | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 401580 <.omp_outlined.+0x1c0>    | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "11% of peak computational performance is used (7.49 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 92% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 94.00 to 88.00 cycles (1.07x speedup).",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Reduce the number of FP add instructions\n - Reduce the number of FP multiply/FMA instructions\n - Reduce arithmetical operations on array elements\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - execution of divide and square root operations (the divide/square root unit is a bottleneck)\n - execution of FP add operations (the FP add unit is a bottleneck)\n - execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)\n - execution of INT/FP operations in vector registers (the VPU is a bottleneck)\n",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 256 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}

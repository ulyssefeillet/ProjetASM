_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 3 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VINSERTF64X4: 1 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 1 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "11 AVX-512 instructions are processing arithmetic or math operations on single precision FP elements in vector mode (sixteen at a time).\n4 AVX-512 instructions are processing arithmetic or math operations on double precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 288 FP arithmetical operations:\n - 144: addition or subtraction (80 inside FMA instructions)\n - 112: multiply (80 inside FMA instructions)\n - 16: fast reciprocal\n - 16: square root\nThe binary loop is loading 192 bytes (48 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.50 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 27\nloop length        : 163\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 2\nused zmm registers : 14\nnb stack references: 0\nADD-SUB / MUL ratio: 1.33\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 11.00 cycles\ninstruction queue    : 13.50 cycles\ndecoding             : 13.50 cycles\nmicro-operation queue: 14.00 cycles\nfront end            : 14.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 47.00 | 12.00 | 1.50 | 1.50 | 1.50 | 1.50 | 0.00\ncycles | 47.00 | 12.00 | 1.50 | 1.50 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: 32.00-34.00\nLongest recurrence chain latency (RecMII): 6.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 14.00\nDispatch  : 47.00\nDIV/SQRT  : 32.00-34.00\nData deps.: 6.00\nOverall L1: 47.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\nINT+FP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 50%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 50%\nFP\nall     : 93%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 70%\nINT+FP\nall     : 91%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 66%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 47.00 cycles. At this rate:\n - 3% of peak load performance is reached (4.09 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1890\n\nInstruction                               | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------\nVMOVAPS (%R13,%RDX,1),%ZMM1               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM23,%ZMM1,%ZMM20                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVUPS (%R12,%RDX,1),%ZMM1               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM22,%ZMM1,%ZMM19                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVUPS (%R10,%RDX,1),%ZMM1               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM21,%ZMM1,%ZMM18                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nLEA 0x40(%RDX),%RDX                       | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %R11,%RDX                             | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMULPS %ZMM19,%ZMM19,%ZMM0                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM20,%ZMM20,%ZMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM14,%ZMM0,%ZMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM18,%ZMM18,%ZMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPS2PD %YMM0,%ZMM25                    | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVEXTRACTI64X4 $0x1,%ZMM0,%YMM0            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVCVTPS2PD %YMM0,%ZMM0                     | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM25,%ZMM1                      | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVSQRTPD %ZMM0,%ZMM24                      | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVMULPD %ZMM25,%ZMM1,%ZMM1                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMULPD %ZMM0,%ZMM24,%ZMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM1,%YMM1                     | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM0,%YMM0                     | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM0,%ZMM1,%ZMM1       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVRCP28PS %ZMM1,%ZMM1                      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVFMADD231PS %ZMM20,%ZMM1,%ZMM8            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM19,%ZMM1,%ZMM7            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM18,%ZMM1,%ZMM6            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nJNE 1890 <move_particles._omp_fn.0+0x240> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "9% of peak computational performance is used (6.13 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 91% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 47.00 to 44.00 cycles (1.07x speedup).",
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
          txt = "Detected 80 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 3 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VINSERTF64X4: 1 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 1 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "11 AVX-512 instructions are processing arithmetic or math operations on single precision FP elements in vector mode (sixteen at a time).\n4 AVX-512 instructions are processing arithmetic or math operations on double precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 288 FP arithmetical operations:\n - 144: addition or subtraction (80 inside FMA instructions)\n - 112: multiply (80 inside FMA instructions)\n - 16: fast reciprocal\n - 16: square root\nThe binary loop is loading 192 bytes (48 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.50 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 27\nloop length        : 163\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 2\nused zmm registers : 14\nnb stack references: 0\nADD-SUB / MUL ratio: 1.33\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 11.00 cycles\ninstruction queue    : 13.50 cycles\ndecoding             : 13.50 cycles\nmicro-operation queue: 14.00 cycles\nfront end            : 14.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 47.00 | 12.00 | 1.50 | 1.50 | 1.50 | 1.50 | 0.00\ncycles | 47.00 | 12.00 | 1.50 | 1.50 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: 32.00-34.00\nLongest recurrence chain latency (RecMII): 6.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 14.00\nDispatch  : 47.00\nDIV/SQRT  : 32.00-34.00\nData deps.: 6.00\nOverall L1: 47.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\nINT+FP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 50%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 50%\nFP\nall     : 93%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 70%\nINT+FP\nall     : 91%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 66%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 47.00 cycles. At this rate:\n - 3% of peak load performance is reached (4.09 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1890\n\nInstruction                               | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------\nVMOVAPS (%R13,%RDX,1),%ZMM1               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM23,%ZMM1,%ZMM20                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVUPS (%R12,%RDX,1),%ZMM1               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM22,%ZMM1,%ZMM19                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVUPS (%R10,%RDX,1),%ZMM1               | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBPS %ZMM21,%ZMM1,%ZMM18                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nLEA 0x40(%RDX),%RDX                       | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %R11,%RDX                             | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMULPS %ZMM19,%ZMM19,%ZMM0                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM20,%ZMM20,%ZMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDPS %ZMM14,%ZMM0,%ZMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM18,%ZMM18,%ZMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPS2PD %YMM0,%ZMM25                    | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVEXTRACTI64X4 $0x1,%ZMM0,%YMM0            | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVCVTPS2PD %YMM0,%ZMM0                     | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM25,%ZMM1                      | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVSQRTPD %ZMM0,%ZMM24                      | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVMULPD %ZMM25,%ZMM1,%ZMM1                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMULPD %ZMM0,%ZMM24,%ZMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM1,%YMM1                     | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM0,%YMM0                     | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM0,%ZMM1,%ZMM1       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVRCP28PS %ZMM1,%ZMM1                      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVFMADD231PS %ZMM20,%ZMM1,%ZMM8            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM19,%ZMM1,%ZMM7            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM18,%ZMM1,%ZMM6            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nJNE 1890 <move_particles._omp_fn.0+0x240> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "9% of peak computational performance is used (6.13 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 91% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 47.00 to 44.00 cycles (1.07x speedup).",
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
          txt = "Detected 80 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
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

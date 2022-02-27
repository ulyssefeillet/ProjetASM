_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - VCVTSD2SS (FP64 to FP32, scalar): 1 occurrences\n - VCVTSS2SD (FP32 to FP64, scalar): 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "11 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n2 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 18 FP arithmetical operations:\n - 9: addition or subtraction (5 inside FMA instructions)\n - 7: multiply (5 inside FMA instructions)\n - 1: divide\n - 1: square root\nThe binary loop is loading 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.50 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 22\nloop length        : 98\nused x86 registers : 2\nused mmx registers : 0\nused xmm registers : 13\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 2.00\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 7.00 cycles\ninstruction queue    : 11.00 cycles\ndecoding             : 11.00 cycles\nmicro-operation queue: 11.00 cycles\nfront end            : 11.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 10.00 | 10.00 | 1.50 | 1.50 | 1.50 | 1.50 | 0.00\ncycles | 10.00 | 10.00 | 1.50 | 1.50 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: 44.00-50.00\nLongest recurrence chain latency (RecMII): 6.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 11.00\nDispatch  : 10.00\nDIV/SQRT  : 44.00-50.00\nData deps.: 6.00\nOverall L1: 44.00-50.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : 0%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 0%\nadd-sub : 0%\nfma     : 0%\ndiv/sqrt: 0%\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 7%\nload    : 6%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 9%\nadd-sub : 6%\nfma     : 6%\ndiv/sqrt: 9%\nother   : 8%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 50.00 cycles. At this rate:\n - 0% of peak load performance is reached (0.24 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1630\n\nInstruction                    | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------\nVMOVSS 0x4(%RAX),%XMM3         | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nLEA 0x18(%RAX),%RAX            | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVSUBSS %XMM10,%XMM3,%XMM3      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSS -0x10(%RAX),%XMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBSS %XMM9,%XMM2,%XMM2       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSS -0x18(%RAX),%XMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBSS %XMM11,%XMM4,%XMM4      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nCMP %RAX,%RSI                  | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMULSS %XMM3,%XMM3,%XMM1       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,%XMM2,%XMM8       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVFMADD132SS %XMM2,%XMM13,%XMM8 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231SS %XMM4,%XMM4,%XMM1  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM8,%XMM1,%XMM1       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTSS2SD %XMM1,%XMM1,%XMM1    | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVSQRTSD %XMM1,%XMM1,%XMM8      | 3     | 3    | 0    | 0    | 0    | 0    | 0    | 0  | 40-42   | 32-33\nVMULSD %XMM8,%XMM1,%XMM1       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTSD2SS %XMM1,%XMM1,%XMM1    | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVDIVSS %XMM1,%XMM12,%XMM1      | 3     | 3    | 0    | 0    | 0    | 0    | 0    | 0  | 25-27   | 12-17\nVFMADD231SS %XMM1,%XMM4,%XMM5  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231SS %XMM1,%XMM3,%XMM6  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231SS %XMM1,%XMM2,%XMM7  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nJNE 1630 <move_particles+0x50> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.36 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 7% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 50.00 to 5.19 cycles (9.64x speedup).",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 50.00 to 11.00 cycles (4.55x speedup).\n",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 5 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - VCVTSD2SS (FP64 to FP32, scalar): 1 occurrences\n - VCVTSS2SD (FP32 to FP64, scalar): 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "11 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n2 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 18 FP arithmetical operations:\n - 9: addition or subtraction (5 inside FMA instructions)\n - 7: multiply (5 inside FMA instructions)\n - 1: divide\n - 1: square root\nThe binary loop is loading 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.50 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 22\nloop length        : 98\nused x86 registers : 2\nused mmx registers : 0\nused xmm registers : 13\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 2.00\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 7.00 cycles\ninstruction queue    : 11.00 cycles\ndecoding             : 11.00 cycles\nmicro-operation queue: 11.00 cycles\nfront end            : 11.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 10.00 | 10.00 | 1.50 | 1.50 | 1.50 | 1.50 | 0.00\ncycles | 10.00 | 10.00 | 1.50 | 1.50 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: 44.00-50.00\nLongest recurrence chain latency (RecMII): 6.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 11.00\nDispatch  : 10.00\nDIV/SQRT  : 44.00-50.00\nData deps.: 6.00\nOverall L1: 44.00-50.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : 0%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 0%\nadd-sub : 0%\nfma     : 0%\ndiv/sqrt: 0%\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 7%\nload    : 6%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 9%\nadd-sub : 6%\nfma     : 6%\ndiv/sqrt: 9%\nother   : 8%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 50.00 cycles. At this rate:\n - 0% of peak load performance is reached (0.24 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1630\n\nInstruction                    | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------\nVMOVSS 0x4(%RAX),%XMM3         | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nLEA 0x18(%RAX),%RAX            | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVSUBSS %XMM10,%XMM3,%XMM3      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSS -0x10(%RAX),%XMM2       | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBSS %XMM9,%XMM2,%XMM2       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSS -0x18(%RAX),%XMM4       | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVSUBSS %XMM11,%XMM4,%XMM4      | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nCMP %RAX,%RSI                  | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nVMULSS %XMM3,%XMM3,%XMM1       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM2,%XMM2,%XMM8       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVFMADD132SS %XMM2,%XMM13,%XMM8 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231SS %XMM4,%XMM4,%XMM1  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVADDSS %XMM8,%XMM1,%XMM1       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTSS2SD %XMM1,%XMM1,%XMM1    | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVSQRTSD %XMM1,%XMM1,%XMM8      | 3     | 3    | 0    | 0    | 0    | 0    | 0    | 0  | 40-42   | 32-33\nVMULSD %XMM8,%XMM1,%XMM1       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTSD2SS %XMM1,%XMM1,%XMM1    | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 2       | 1\nVDIVSS %XMM1,%XMM12,%XMM1      | 3     | 3    | 0    | 0    | 0    | 0    | 0    | 0  | 25-27   | 12-17\nVFMADD231SS %XMM1,%XMM4,%XMM5  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231SS %XMM1,%XMM3,%XMM6  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231SS %XMM1,%XMM2,%XMM7  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nJNE 1630 <move_particles+0x50> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.36 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 7% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 50.00 to 5.19 cycles (9.64x speedup).",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 50.00 to 11.00 cycles (4.55x speedup).\n",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 5 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
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

_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant non-unit stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - CVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - CVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "20 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n4 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 88 FP arithmetical operations:\n - 44: addition or subtraction\n - 36: multiply\n - 4: fast reciprocal\n - 4: square root\nThe binary loop is loading 64 bytes (16 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.37 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 58\nloop length        : 227\nused x86 registers : 2\nused mmx registers : 0\nused xmm registers : 16\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.10\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 15.00 cycles\ninstruction queue    : 29.00 cycles\ndecoding             : 29.00 cycles\nmicro-operation queue: 29.00 cycles\nfront end            : 29.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 56.00 | 24.00 | 6.50 | 6.50 | 1.50 | 1.50 | 0.00\ncycles | 56.00 | 24.00 | 6.50 | 6.50 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: 32.00-34.00\nLongest recurrence chain latency (RecMII): 6.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 29.00\nDispatch  : 56.00\nDIV/SQRT  : 32.00-34.00\nData deps.: 6.00\nOverall L1: 56.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 76%\nload    : 7%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 94%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 17%\nload    : 7%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 25%\nadd-sub : 25%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 25%\nother   : 15%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 56.00 cycles. At this rate:\n - 0% of peak load performance is reached (1.14 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4013d0\n\nInstruction                       | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------\nMOVSS -0x8(%RCX),%XMM5            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x20(%RCX),%XMM0           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x50(%RCX),%XMM8           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x4c(%RCX),%XMM4           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nUNPCKLPS %XMM5,%XMM0              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVSS -0x48(%RCX),%XMM5           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x38(%RCX),%XMM9           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x4(%RCX),%XMM10           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nUNPCKLPS %XMM9,%XMM8              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVSS -0x1c(%RCX),%XMM6           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nUNPCKLPS %XMM10,%XMM6             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVSS -0x34(%RCX),%XMM7           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVLHPS %XMM0,%XMM8               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nUNPCKLPS %XMM7,%XMM4              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVLHPS %XMM6,%XMM4               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nMOVSS (%RCX),%XMM0                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nSUBPS %XMM15,%XMM8                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVSS -0x18(%RCX),%XMM6           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nUNPCKLPS %XMM0,%XMM6              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVSS -0x30(%RCX),%XMM0           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nSUBPS %XMM13,%XMM4                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nUNPCKLPS %XMM0,%XMM5              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVLHPS %XMM6,%XMM5               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nSUBPS %XMM14,%XMM5                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVAPS %XMM8,%XMM0                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMULPS %XMM8,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVAPS %XMM4,%XMM6                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMULPS %XMM4,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVAPS %XMM5,%XMM7                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMULPS %XMM5,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM12,%XMM0                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM6,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM0,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nCVTPS2PD %XMM7,%XMM0              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nMOVHLPS %XMM7,%XMM7               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nCVTPS2PD %XMM7,%XMM6              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nSQRTPD %XMM0,%XMM7                | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nSQRTPD %XMM6,%XMM3                | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nMULPD %XMM6,%XMM3                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPD %XMM0,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nCVTPD2PS %XMM7,%XMM0              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nCVTPD2PS %XMM3,%XMM3              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nUNPCKLPD %XMM3,%XMM0              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nRCPPS %XMM0,%XMM3                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 2\nMULPS %XMM3,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVAPS 0xba8(%RIP),%XMM6          | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nSUBPS %XMM0,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPS %XMM3,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM3,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPS %XMM6,%XMM8                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM8,%XMM11                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPS %XMM6,%XMM4                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM4,%XMM1                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPS %XMM5,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM6,%XMM2                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADD $0x60,%RCX                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nADD $-0x4,%RAX                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 4013d0 <move_particles+0x100> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "2% of peak computational performance is used (1.57 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "76% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 7% of SSE/AVX loads are used in vector version.\n - 94% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 17% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 56.00 to 11.87 cycles (4.72x speedup).",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Reduce the number of FP add instructions\n - Reduce the number of FP multiply/FMA instructions\n - Reduce arithmetical operations on array elements\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - execution of divide and square root operations (the divide/square root unit is a bottleneck)\n - execution of FP add operations (the FP add unit is a bottleneck)\n - execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)\n - execution of INT/FP operations in vector registers (the VPU is a bottleneck)\n",
        },
      },
      potential = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).\n",
          title = "FMA",
          txt = "Presence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant non-unit stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - CVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - CVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "20 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n4 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 88 FP arithmetical operations:\n - 44: addition or subtraction\n - 36: multiply\n - 4: fast reciprocal\n - 4: square root\nThe binary loop is loading 64 bytes (16 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.37 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 58\nloop length        : 227\nused x86 registers : 2\nused mmx registers : 0\nused xmm registers : 16\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.10\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 15.00 cycles\ninstruction queue    : 29.00 cycles\ndecoding             : 29.00 cycles\nmicro-operation queue: 29.00 cycles\nfront end            : 29.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 56.00 | 24.00 | 6.50 | 6.50 | 1.50 | 1.50 | 0.00\ncycles | 56.00 | 24.00 | 6.50 | 6.50 | 1.50 | 1.50 | 0.00\n\nCycles executing div or sqrt instructions: 32.00-34.00\nLongest recurrence chain latency (RecMII): 6.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 29.00\nDispatch  : 56.00\nDIV/SQRT  : 32.00-34.00\nData deps.: 6.00\nOverall L1: 56.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 76%\nload    : 7%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 94%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 17%\nload    : 7%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 25%\nadd-sub : 25%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 25%\nother   : 15%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 56.00 cycles. At this rate:\n - 0% of peak load performance is reached (1.14 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4013d0\n\nInstruction                       | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------\nMOVSS -0x8(%RCX),%XMM5            | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x20(%RCX),%XMM0           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x50(%RCX),%XMM8           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x4c(%RCX),%XMM4           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nUNPCKLPS %XMM5,%XMM0              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVSS -0x48(%RCX),%XMM5           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x38(%RCX),%XMM9           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVSS -0x4(%RCX),%XMM10           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nUNPCKLPS %XMM9,%XMM8              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVSS -0x1c(%RCX),%XMM6           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nUNPCKLPS %XMM10,%XMM6             | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVSS -0x34(%RCX),%XMM7           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nMOVLHPS %XMM0,%XMM8               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nUNPCKLPS %XMM7,%XMM4              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVLHPS %XMM6,%XMM4               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nMOVSS (%RCX),%XMM0                | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nSUBPS %XMM15,%XMM8                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVSS -0x18(%RCX),%XMM6           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nUNPCKLPS %XMM0,%XMM6              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVSS -0x30(%RCX),%XMM0           | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nSUBPS %XMM13,%XMM4                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nUNPCKLPS %XMM0,%XMM5              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nMOVLHPS %XMM6,%XMM5               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nSUBPS %XMM14,%XMM5                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVAPS %XMM8,%XMM0                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMULPS %XMM8,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVAPS %XMM4,%XMM6                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMULPS %XMM4,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVAPS %XMM5,%XMM7                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nMULPS %XMM5,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM12,%XMM0                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM6,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM0,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nCVTPS2PD %XMM7,%XMM0              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nMOVHLPS %XMM7,%XMM7               | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nCVTPS2PD %XMM7,%XMM6              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nSQRTPD %XMM0,%XMM7                | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nSQRTPD %XMM6,%XMM3                | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nMULPD %XMM6,%XMM3                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPD %XMM0,%XMM7                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nCVTPD2PS %XMM7,%XMM0              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nCVTPD2PS %XMM3,%XMM3              | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nUNPCKLPD %XMM3,%XMM0              | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 4       | 2\nRCPPS %XMM0,%XMM3                 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 2\nMULPS %XMM3,%XMM0                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMOVAPS 0xba8(%RIP),%XMM6          | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nSUBPS %XMM0,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPS %XMM3,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM3,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPS %XMM6,%XMM8                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM8,%XMM11                | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPS %XMM6,%XMM4                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM4,%XMM1                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nMULPS %XMM5,%XMM6                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADDPS %XMM6,%XMM2                 | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nADD $0x60,%RCX                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nADD $-0x4,%RAX                    | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 4013d0 <move_particles+0x100> | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "2% of peak computational performance is used (1.57 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "76% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 7% of SSE/AVX loads are used in vector version.\n - 94% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 17% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 56.00 to 11.87 cycles (4.72x speedup).",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Reduce the number of FP add instructions\n - Reduce the number of FP multiply/FMA instructions\n - Reduce arithmetical operations on array elements\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - execution of divide and square root operations (the divide/square root unit is a bottleneck)\n - execution of FP add operations (the FP add unit is a bottleneck)\n - execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)\n - execution of INT/FP operations in vector registers (the VPU is a bottleneck)\n",
        },
      },
      potential = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).\n",
          title = "FMA",
          txt = "Presence of both ADD/SUB and MUL operations.",
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

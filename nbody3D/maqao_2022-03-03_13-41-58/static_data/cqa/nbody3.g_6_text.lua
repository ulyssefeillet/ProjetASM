_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - unknown: 8 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - VCVTSI2SS (INT32/64 to FP32, scalar): 6 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 6 FP arithmetical operations:\n - 6: multiply\nThe binary loop is loading 76 bytes (19 single precision FP elements).\nThe binary loop is storing 32 bytes (8 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.06 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 42\nloop length        : 205\nused x86 registers : 7\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 7\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 13.00 cycles\ninstruction queue    : 21.00 cycles\ndecoding             : 21.00 cycles\nmicro-operation queue: 25.00 cycles\nfront end            : 25.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 6.00 | 6.00 | 10.50 | 10.50 | 7.00 | 7.00 | 8.00\ncycles | 6.00 | 6.00 | 10.50 | 10.50 | 7.00 | 7.00 | 8.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 25.00\nDispatch  : 10.50\nData deps.: 1.00\nOverall L1: 25.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 8%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 6%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 8%\nFP\nall     : 6%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 7%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 8%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 25.00 cycles. At this rate:\n - 2% of peak load performance is reached (3.04 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 2% of peak store performance is reached (1.28 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 25.00 to 21.00 cycles (1.19x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1b70\n\nInstruction                     | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nMOVSXD %EAX,%R13                | 1     | 0    | 0    | 0    | 0    | 1    | 0    | 0  | 1       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nMOVL $0x30000000,0xc(%RSP)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 1       | 1\nCLTQ\nCMP %RAX,%R13                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJA 1b9a <init+0x4a>             | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nVMOVSS 0x590(%RIP),%XMM2        | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVMOVSS %XMM2,0xc(%RSP)          | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV (%RBP),%RDX                 | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xc(%RSP),%XMM0,%XMM0    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x8(%RBP),%RDX              | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0x559(%RIP),%XMM0,%XMM0  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x10(%RBP),%RDX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xc(%RSP),%XMM0,%XMM0    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x18(%RBP),%RDX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0x527(%RIP),%XMM0,%XMM0  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x20(%RBP),%RDX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xc(%RSP),%XMM0,%XMM0    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x28(%RBP),%RDX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0x4f5(%RIP),%XMM0,%XMM0  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nLEA 0x1(%RBX),%RBX              | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %RBX,%R12                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 1b70 <init+0x20>            | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.24 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 25.00 to 13.00 cycles (1.92x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 7% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 25.00 to 1.64 cycles (15.27x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - unknown: 8 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - VCVTSI2SS (INT32/64 to FP32, scalar): 6 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 6 FP arithmetical operations:\n - 6: multiply\nThe binary loop is loading 72 bytes (18 single precision FP elements).\nThe binary loop is storing 28 bytes (7 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.06 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 40\nloop length        : 191\nused x86 registers : 7\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 7\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 12.00 cycles\ninstruction queue    : 20.00 cycles\ndecoding             : 20.00 cycles\nmicro-operation queue: 24.00 cycles\nfront end            : 24.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6\n-------------------------------------------------------\nuops   | 6.00 | 6.00 | 9.50 | 9.50 | 7.00 | 7.00 | 7.00\ncycles | 6.00 | 6.00 | 9.50 | 9.50 | 7.00 | 7.00 | 7.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 24.00\nDispatch  : 9.50\nData deps.: 1.00\nOverall L1: 24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 8%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 6%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 8%\nFP\nall     : 6%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 7%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 8%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 2% of peak load performance is reached (3.00 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (1.17 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 24.00 to 20.00 cycles (1.20x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1b70\n\nInstruction                     | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nMOVSXD %EAX,%R13                | 1     | 0    | 0    | 0    | 0    | 1    | 0    | 0  | 1       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nMOVL $0x30000000,0xc(%RSP)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 1       | 1\nCLTQ\nCMP %RAX,%R13                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJA 1b9a <init+0x4a>             | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV (%RBP),%RDX                 | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xc(%RSP),%XMM0,%XMM0    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x8(%RBP),%RDX              | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0x559(%RIP),%XMM0,%XMM0  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x10(%RBP),%RDX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xc(%RSP),%XMM0,%XMM0    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x18(%RBP),%RDX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0x527(%RIP),%XMM0,%XMM0  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x20(%RBP),%RDX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0xc(%RSP),%XMM0,%XMM0    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nCALL 11d0 <.plt.sec@start+0xc0> | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 2\nVCVTSI2SS %EAX,%XMM0,%XMM0      | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 5       | 1\nMOV 0x28(%RBP),%RDX             | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0  | 4       | 1\nVMULSS 0x4f5(%RIP),%XMM0,%XMM0  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 6       | 0.50\nVMOVSS %XMM0,(%RDX,%RBX,4)      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 1  | 2       | 1\nLEA 0x1(%RBX),%RBX              | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nCMP %RBX,%R12                   | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 1b70 <init+0x20>            | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.25 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 24.00 to 12.00 cycles (2.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 7% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 24.00 to 1.58 cycles (15.24x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - unknown: 8 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - VCVTSI2SS (INT32/64 to FP32, scalar): 6 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 6 FP arithmetical operations:\n - 6: multiply\nThe binary loop is loading 74 bytes (18 single precision FP elements).\nThe binary loop is storing 30 bytes (7 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.06 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 41\nloop length        : 198\nused x86 registers : 7\nused mmx registers : 0\nused xmm registers : 1.50\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 7\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 12.50 cycles\ninstruction queue    : 20.50 cycles\ndecoding             : 20.50 cycles\nmicro-operation queue: 24.50 cycles\nfront end            : 24.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4   | P5   | P6\n---------------------------------------------------------\nuops   | 6.00 | 6.00 | 10.00 | 10.00 | 7.00 | 7.00 | 7.50\ncycles | 6.00 | 6.00 | 10.00 | 10.00 | 7.00 | 7.00 | 7.50\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 24.50\nDispatch  : 10.00\nData deps.: 1.00\nOverall L1: 24.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 8%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 6%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 8%\nFP\nall     : 6%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 7%\nload    : 6%\nstore   : 6%\nmul     : 6%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 8%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.50 cycles. At this rate:\n - 2% of peak load performance is reached (3.02 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (1.22 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.24 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 7% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 24.50 to 1.61 cycles (15.26x speedup).",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
      "The structure of this loop is probably <if then [else] end>.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside loop: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the loop)\n - turning them into conditional moves, MIN or MAX\n\n",
    },
    nb_paths = 2,
  },
}

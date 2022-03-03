_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function does not load or store any data.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 19\nloop length        : 57\nused x86 registers : 8\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 4.00 cycles\ninstruction queue    : 9.50 cycles\ndecoding             : 9.50 cycles\nmicro-operation queue: 12.00 cycles\nfront end            : 12.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6\n-------------------------------------------------------\nuops   | 0.00 | 0.00 | 2.00 | 2.00 | 9.00 | 9.00 | 4.00\ncycles | 0.00 | 0.00 | 2.00 | 2.00 | 9.00 | 9.00 | 4.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.00\nDispatch  : 9.00\nOverall L1: 12.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 10%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 10%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 12.00 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 12.00 to 9.50 cycles (1.26x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4011d0\n\nInstruction            | Nb FU | P0 | P1 | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------\nPUSH %RBP              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %R15              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %R14              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %RBX              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %RAX              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nTEST %RSI,%RSI         | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4012c7 <init+0xf7>  | 1     | 0  | 0  | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV %RSI,%R14          | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nMOV %RDI,%R15          | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nXOR %EBX,%EBX\nNOPL (%RAX,%RAX,1)     | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nADD $0x8,%RSP          | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nPOP %RBX               | 2     | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %R14               | 2     | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %R15               | 2     | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %RBP               | 2     | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nRET\nNOPW %CS:(%RAX,%RAX,1) | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nNOPL (%RAX)            | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 10% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 12.00 to 0.79 cycles (15.20x speedup).",
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
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function does not load or store any data.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 19\nloop length        : 57\nused x86 registers : 8\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 4.00 cycles\ninstruction queue    : 9.50 cycles\ndecoding             : 9.50 cycles\nmicro-operation queue: 12.00 cycles\nfront end            : 12.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6\n-------------------------------------------------------\nuops   | 0.00 | 0.00 | 2.00 | 2.00 | 9.00 | 9.00 | 4.00\ncycles | 0.00 | 0.00 | 2.00 | 2.00 | 9.00 | 9.00 | 4.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.00\nDispatch  : 9.00\nOverall L1: 12.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 10%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 10%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 12.00 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 12.00 to 9.50 cycles (1.26x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4011d0\n\nInstruction            | Nb FU | P0 | P1 | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------\nPUSH %RBP              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %R15              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %R14              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %RBX              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nPUSH %RAX              | 1     | 0  | 0  | 0    | 0    | 1    | 1    | 0  | 0       | 1\nTEST %RSI,%RSI         | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJE 4012c7 <init+0xf7>  | 1     | 0  | 0  | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\nMOV %RSI,%R14          | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nMOV %RDI,%R15          | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nXOR %EBX,%EBX\nNOPL (%RAX,%RAX,1)     | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nADD $0x8,%RSP          | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nPOP %RBX               | 2     | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %R14               | 2     | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %R15               | 2     | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nPOP %RBP               | 2     | 0  | 0  | 0.50 | 0.50 | 0    | 0    | 1  | 0       | 1\nRET\nNOPW %CS:(%RAX,%RAX,1) | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\nNOPL (%RAX)            | 1     | 0  | 0  | 0    | 0    | 0.50 | 0.50 | 0  | 0       | 0.50\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 10% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 12.00 to 0.79 cycles (15.20x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}

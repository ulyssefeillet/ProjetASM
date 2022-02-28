_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Try to remove indirect accesses. If applicable, precompute elements out of the innermost loop.",
          details = " - Irregular (variable stride) or indirect: 7 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF64X4: 2 occurrences\n - VINSERTF64X4: 8 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 10 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Try to simplify your code and/or replace indirect accesses with unit-stride ones.",
          details = " - VGATHERQPS: 12 occurrences\n",
          title = "Gather/scatter instructions",
          txt = "Detected gather/scatter instructions (typically caused by indirect accesses).",
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
          txt = "The binary loop is composed of 704 FP arithmetical operations:\n - 352: addition or subtraction (256 inside FMA instructions)\n - 288: multiply (256 inside FMA instructions)\n - 32: fast reciprocal\n - 32: square root\nThe binary loop is loading 780 bytes (195 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.90 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 108\nloop length        : 704\nused x86 registers : 1\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 7\nused zmm registers : 32\nnb stack references: 0\nADD-SUB / MUL ratio: 1.50\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 44.00 cycles\ninstruction queue    : 54.00 cycles\ndecoding             : 54.00 cycles\nmicro-operation queue: 60.00 cycles\nfront end            : 60.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0     | P1    | P2   | P3   | P4   | P5   | P6\n----------------------------------------------------------\nuops   | 116.00 | 66.00 | 7.00 | 7.00 | 1.00 | 1.00 | 0.00\ncycles | 116.00 | 66.00 | 7.00 | 7.00 | 1.00 | 1.00 | 0.00\n\nCycles executing div or sqrt instructions: 64.00-68.00\nLongest recurrence chain latency (RecMII): 10.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 60.00\nDispatch  : 116.00\nDIV/SQRT  : 64.00-68.00\nData deps.: 10.00\nOverall L1: 116.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 96%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 88%\nFP\nall     : 98%\nload    : 92%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 96%\nINT+FP\nall     : 97%\nload    : 85%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 95%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 96%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 90%\nFP\nall     : 78%\nload    : 46%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 57%\nINT+FP\nall     : 84%\nload    : 44%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 64%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 116.00 cycles. At this rate:\n - 5% of peak load performance is reached (6.72 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401440\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nVMOVDQA64 %ZMM29,%ZMM25               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM27,%ZMM28               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM22,%ZMM26               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM19,%ZMM30               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPMULUDQ %ZMM9,%ZMM24,%ZMM1           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%ZMM24,%ZMM3             | 4     | 4    | 0    | 0    | 0    | 0    | 0    | 0  | 11      | 8\nVPMULUDQ %ZMM9,%ZMM3,%ZMM3            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSLLQ $0x20,%ZMM3,%ZMM3              | 4     | 4    | 0    | 0    | 0    | 0    | 0    | 0  | 11      | 8\nVPADDQ %ZMM2,%ZMM1,%ZMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM1,%ZMM3,%ZMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPMULUDQ %ZMM9,%ZMM23,%ZMM3           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%ZMM23,%ZMM4             | 4     | 4    | 0    | 0    | 0    | 0    | 0    | 0  | 11      | 8\nVPMULUDQ %ZMM9,%ZMM4,%ZMM4            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSLLQ $0x20,%ZMM4,%ZMM4              | 4     | 4    | 0    | 0    | 0    | 0    | 0    | 0  | 11      | 8\nVPADDQ %ZMM2,%ZMM3,%ZMM3              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM3,%ZMM4,%ZMM3              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM5,%ZMM3,%ZMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM5,%ZMM1,%ZMM19             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM1,1),%YMM14{%K1}     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM3,1),%YMM0{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM14,%ZMM0,%ZMM0  | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM19,1),%YMM14{%K1}    | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM4,1),%YMM15{%K1}     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM14,%ZMM15,%ZMM4 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSUBPS %ZMM16,%ZMM0,%ZMM19            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM16,%ZMM4,%ZMM22            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPADDQ %ZMM6,%ZMM3,%ZMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM6,%ZMM1,%ZMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM10,%ZMM3,%ZMM14            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM10,%ZMM1,%ZMM15            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM4,1),%YMM8{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM0,1),%YMM4{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM8,%ZMM4,%ZMM0   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM15,1),%YMM4{%K1}     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM14,1),%YMM8{%K1}     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM4,%ZMM8,%ZMM4   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSUBPS %ZMM17,%ZMM0,%ZMM27            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM17,%ZMM4,%ZMM29            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPADDQ %ZMM7,%ZMM3,%ZMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM7,%ZMM1,%ZMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM11,%ZMM3,%ZMM3             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM11,%ZMM1,%ZMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM4,1),%YMM8{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM0,1),%YMM4{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM8,%ZMM4,%ZMM0   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM1,1),%YMM4{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM3,1),%YMM1{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM4,%ZMM1,%ZMM1   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSUBPS %ZMM18,%ZMM0,%ZMM0             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM18,%ZMM1,%ZMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVAPS %ZMM19,%ZMM3                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVFMADD213PS %ZMM12,%ZMM19,%ZMM3       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVAPS %ZMM22,%ZMM4                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVFMADD213PS %ZMM12,%ZMM22,%ZMM4       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM27,%ZMM27,%ZMM3       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM29,%ZMM29,%ZMM4       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM0,%ZMM0,%ZMM3         | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM1,%ZMM1,%ZMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM3,%YMM8        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVCVTPS2PD %YMM8,%ZMM8                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPS2PD %YMM3,%ZMM3                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVEXTRACTF64X4 $0x1,%ZMM4,%YMM14       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSQRTPD %ZMM3,%ZMM15                  | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVCVTPS2PD %YMM14,%ZMM14               | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM8,%ZMM31                  | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVCVTPS2PD %YMM4,%ZMM4                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM4,%ZMM13                  | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVMULPD %ZMM8,%ZMM31,%ZMM8             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSQRTPD %ZMM14,%ZMM31                 | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVMULPD %ZMM3,%ZMM15,%ZMM3             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMULPD %ZMM14,%ZMM31,%ZMM14           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM3,%YMM3                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM8,%YMM8                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM8,%ZMM3,%ZMM3   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVRCP14PS %ZMM3,%ZMM8                  | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVMULPD %ZMM4,%ZMM13,%ZMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVBROADCASTSS 0x1981(%RIP),%ZMM13      | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFNMADD213PS %ZMM13,%ZMM8,%ZMM3       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD132PS %ZMM8,%ZMM8,%ZMM3         | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM4,%YMM4                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM14,%YMM8                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM8,%ZMM4,%ZMM4   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVFMADD213PS %ZMM30,%ZMM3,%ZMM19       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVRCP14PS %ZMM4,%ZMM8                  | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVFMADD213PS %ZMM28,%ZMM3,%ZMM27       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM3,%ZMM0,%ZMM20        | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFNMADD213PS %ZMM13,%ZMM8,%ZMM4       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD132PS %ZMM8,%ZMM8,%ZMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM26,%ZMM4,%ZMM22       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM25,%ZMM4,%ZMM29       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPBROADCASTQ 0x1a0c(%RIP),%ZMM0       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PS %ZMM4,%ZMM1,%ZMM21        | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPADDQ %ZMM0,%ZMM23,%ZMM23            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM0,%ZMM24,%ZMM24            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nADD $-0x20,%RAX                       | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 401440 <move_particles+0x190>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "9% of peak computational performance is used (6.07 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "97% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 85% of SSE/AVX loads are used in vector version.\n - 95% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is highly vectorized.\n84% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 116.00 to 107.00 cycles (1.08x speedup).",
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
          workaround = "Try to remove indirect accesses. If applicable, precompute elements out of the innermost loop.",
          details = " - Irregular (variable stride) or indirect: 7 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF64X4: 2 occurrences\n - VINSERTF64X4: 8 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 10 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Try to simplify your code and/or replace indirect accesses with unit-stride ones.",
          details = " - VGATHERQPS: 12 occurrences\n",
          title = "Gather/scatter instructions",
          txt = "Detected gather/scatter instructions (typically caused by indirect accesses).",
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
          txt = "The binary loop is composed of 704 FP arithmetical operations:\n - 352: addition or subtraction (256 inside FMA instructions)\n - 288: multiply (256 inside FMA instructions)\n - 32: fast reciprocal\n - 32: square root\nThe binary loop is loading 780 bytes (195 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.90 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 108\nloop length        : 704\nused x86 registers : 1\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 7\nused zmm registers : 32\nnb stack references: 0\nADD-SUB / MUL ratio: 1.50\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\ninstruction fetch    : 44.00 cycles\ninstruction queue    : 54.00 cycles\ndecoding             : 54.00 cycles\nmicro-operation queue: 60.00 cycles\nfront end            : 60.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0     | P1    | P2   | P3   | P4   | P5   | P6\n----------------------------------------------------------\nuops   | 116.00 | 66.00 | 7.00 | 7.00 | 1.00 | 1.00 | 0.00\ncycles | 116.00 | 66.00 | 7.00 | 7.00 | 1.00 | 1.00 | 0.00\n\nCycles executing div or sqrt instructions: 64.00-68.00\nLongest recurrence chain latency (RecMII): 10.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 60.00\nDispatch  : 116.00\nDIV/SQRT  : 64.00-68.00\nData deps.: 10.00\nOverall L1: 116.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 96%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 88%\nFP\nall     : 98%\nload    : 92%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 96%\nINT+FP\nall     : 97%\nload    : 85%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 95%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 96%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 90%\nFP\nall     : 78%\nload    : 46%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 57%\nINT+FP\nall     : 84%\nload    : 44%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 64%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 116.00 cycles. At this rate:\n - 5% of peak load performance is reached (6.72 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401440\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4   | P5   | P6 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nVMOVDQA64 %ZMM29,%ZMM25               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM27,%ZMM28               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM22,%ZMM26               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVMOVDQA64 %ZMM19,%ZMM30               | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPMULUDQ %ZMM9,%ZMM24,%ZMM1           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%ZMM24,%ZMM3             | 4     | 4    | 0    | 0    | 0    | 0    | 0    | 0  | 11      | 8\nVPMULUDQ %ZMM9,%ZMM3,%ZMM3            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSLLQ $0x20,%ZMM3,%ZMM3              | 4     | 4    | 0    | 0    | 0    | 0    | 0    | 0  | 11      | 8\nVPADDQ %ZMM2,%ZMM1,%ZMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM1,%ZMM3,%ZMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPMULUDQ %ZMM9,%ZMM23,%ZMM3           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSRLQ $0x20,%ZMM23,%ZMM4             | 4     | 4    | 0    | 0    | 0    | 0    | 0    | 0  | 11      | 8\nVPMULUDQ %ZMM9,%ZMM4,%ZMM4            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPSLLQ $0x20,%ZMM4,%ZMM4              | 4     | 4    | 0    | 0    | 0    | 0    | 0    | 0  | 11      | 8\nVPADDQ %ZMM2,%ZMM3,%ZMM3              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM3,%ZMM4,%ZMM3              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM5,%ZMM3,%ZMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM5,%ZMM1,%ZMM19             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM1,1),%YMM14{%K1}     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM3,1),%YMM0{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM14,%ZMM0,%ZMM0  | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM19,1),%YMM14{%K1}    | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM4,1),%YMM15{%K1}     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM14,%ZMM15,%ZMM4 | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSUBPS %ZMM16,%ZMM0,%ZMM19            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM16,%ZMM4,%ZMM22            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPADDQ %ZMM6,%ZMM3,%ZMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM6,%ZMM1,%ZMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM10,%ZMM3,%ZMM14            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM10,%ZMM1,%ZMM15            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM4,1),%YMM8{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM0,1),%YMM4{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM8,%ZMM4,%ZMM0   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM15,1),%YMM4{%K1}     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM14,1),%YMM8{%K1}     | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM4,%ZMM8,%ZMM4   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSUBPS %ZMM17,%ZMM0,%ZMM27            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM17,%ZMM4,%ZMM29            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPADDQ %ZMM7,%ZMM3,%ZMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM7,%ZMM1,%ZMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM11,%ZMM3,%ZMM3             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM11,%ZMM1,%ZMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM4,1),%YMM8{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM0,1),%YMM4{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM8,%ZMM4,%ZMM0   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM1,1),%YMM4{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nKXNORW %K0,%K0,%K1                    | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVGATHERQPS (,%ZMM3,1),%YMM1{%K1}      | 1     | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0  | 15      | 5\nVINSERTF64X4 $0x1,%YMM4,%ZMM1,%ZMM1   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSUBPS %ZMM18,%ZMM0,%ZMM0             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSUBPS %ZMM18,%ZMM1,%ZMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVAPS %ZMM19,%ZMM3                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVFMADD213PS %ZMM12,%ZMM19,%ZMM3       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMOVAPS %ZMM22,%ZMM4                  | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVFMADD213PS %ZMM12,%ZMM22,%ZMM4       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM27,%ZMM27,%ZMM3       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM29,%ZMM29,%ZMM4       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM0,%ZMM0,%ZMM3         | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM1,%ZMM1,%ZMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVEXTRACTF64X4 $0x1,%ZMM3,%YMM8        | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVCVTPS2PD %YMM8,%ZMM8                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPS2PD %YMM3,%ZMM3                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVEXTRACTF64X4 $0x1,%ZMM4,%YMM14       | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVSQRTPD %ZMM3,%ZMM15                  | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVCVTPS2PD %YMM14,%ZMM14               | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM8,%ZMM31                  | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVCVTPS2PD %YMM4,%ZMM4                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVSQRTPD %ZMM4,%ZMM13                  | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVMULPD %ZMM8,%ZMM31,%ZMM8             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVSQRTPD %ZMM14,%ZMM31                 | 18    | 18   | 0    | 0    | 0    | 0    | 0    | 0  | 37      | 16-17\nVMULPD %ZMM3,%ZMM15,%ZMM3             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVMULPD %ZMM14,%ZMM31,%ZMM14           | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM3,%YMM3                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM8,%YMM8                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM8,%ZMM3,%ZMM3   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVRCP14PS %ZMM3,%ZMM8                  | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVMULPD %ZMM4,%ZMM13,%ZMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVBROADCASTSS 0x1981(%RIP),%ZMM13      | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 5       | 0.50\nVFNMADD213PS %ZMM13,%ZMM8,%ZMM3       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD132PS %ZMM8,%ZMM8,%ZMM3         | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVCVTPD2PS %ZMM4,%YMM4                 | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVCVTPD2PS %ZMM14,%YMM8                | 2     | 2    | 0    | 0    | 0    | 0    | 0    | 0  | 7       | 7\nVINSERTF64X4 $0x1,%YMM8,%ZMM4,%ZMM4   | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 3-6     | 1\nVFMADD213PS %ZMM30,%ZMM3,%ZMM19       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVRCP14PS %ZMM4,%ZMM8                  | 1     | 1    | 0    | 0    | 0    | 0    | 0    | 0  | 8       | 3\nVFMADD213PS %ZMM28,%ZMM3,%ZMM27       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD231PS %ZMM3,%ZMM0,%ZMM20        | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFNMADD213PS %ZMM13,%ZMM8,%ZMM4       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD132PS %ZMM8,%ZMM8,%ZMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM26,%ZMM4,%ZMM22       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVFMADD213PS %ZMM25,%ZMM4,%ZMM29       | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPBROADCASTQ 0x1a0c(%RIP),%ZMM0       | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0    | 0    | 0  | 3       | 0.50\nVFMADD231PS %ZMM4,%ZMM1,%ZMM21        | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 6       | 0.50\nVPADDQ %ZMM0,%ZMM23,%ZMM23            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nVPADDQ %ZMM0,%ZMM24,%ZMM24            | 1     | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 0  | 2       | 0.50\nADD $-0x20,%RAX                       | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0  | 1       | 0.50\nJNE 401440 <move_particles+0x190>     | 1     | 0    | 0    | 0    | 0    | 0    | 1    | 0  | 0       | 1-2\n",
        },
      },
      header = {
        "9% of peak computational performance is used (6.07 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "97% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 85% of SSE/AVX loads are used in vector version.\n - 95% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is highly vectorized.\n84% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 116.00 to 107.00 cycles (1.08x speedup).",
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

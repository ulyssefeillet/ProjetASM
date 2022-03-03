_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "<ul><li>Pass to your compiler a micro-architecture specialization option:\n<ul><li>Please read your compiler manual</li></ul></li><li>Use vector aligned instructions:\n<ol><li>align your arrays on 64 bytes boundaries</li><li>inform your compiler that your arrays are vector aligned: read your compiler manual.</li></ol></li></ul>",
          details = "<ul><li>VEXTRACTF64X4: 2 occurrences</li><li>VINSERTF64X4: 2 occurrences</li></ul>",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 4 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = "<ul><li>VCVTPD2PS (FP64 to FP32, SIMD): 4 occurrences</li><li>VCVTPS2PD (FP32 to FP64, SIMD): 4 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "24 AVX-512 instructions are processing arithmetic or math operations on single precision FP elements in vector mode (sixteen at a time).\n8 AVX-512 instructions are processing arithmetic or math operations on double precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 704 FP arithmetical operations:\n<ul><li>352: addition or subtraction (256 inside FMA instructions)</li><li>288: multiply (256 inside FMA instructions)</li><li>32: fast reciprocal</li><li>32: square root</li></ul>The binary loop is loading 384 bytes (96 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.83 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>59</td></tr><tr><td>loop length</td><td>362</td></tr><tr><td>used x86 registers</td><td>5</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>0</td></tr><tr><td>used ymm registers</td><td>4</td></tr><tr><td>used zmm registers</td><td>25</td></tr><tr><td>nb stack references</td><td>0</td></tr><tr><td>ADD-SUB / MUL ratio</td><td>1.50</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\n<table><tr><td>instruction fetch</td><td>23.00 cycles</td></tr><tr><td>instruction queue</td><td>29.50 cycles</td></tr><tr><td>decoding</td><td>29.50 cycles</td></tr><tr><td>micro-operation queue</td><td>30.00 cycles</td></tr><tr><td>front end</td><td>30.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th></tr><tr><td>uops</td><td>94.00</td><td>32.00</td><td>3.00</td><td>3.00</td><td>1.50</td><td>1.50</td><td>0.00</td></tr><tr><td>cycles</td><td>94.00</td><td>32.00</td><td>3.00</td><td>3.00</td><td>1.50</td><td>1.50</td><td>0.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>64.00-68.00</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>10.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>30.00</td></tr><tr><td>Dispatch</td><td>94.00</td></tr><tr><td>DIV/SQRT</td><td>64.00-68.00</td></tr><tr><td>Data deps.</td><td>10.00</td></tr><tr><td>Overall L1</td><td>94.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\n<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>100%</td></tr></table>FP\n<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>100%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>100%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\n<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>100%</td></tr></table>FP\n<table><tr><td>all</td><td>92%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>75%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>92%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>77%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 94.00 cycles. At this rate:\n<ul><li>3% of peak load performance is reached (4.09 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401580\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>VMOVAPS %ZMM14,%ZMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VMOVAPS %ZMM13,%ZMM17</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VMOVDQA64 %ZMM23,%ZMM18</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VMOVDQA64 %ZMM22,%ZMM19</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VMOVUPS (%RAX,%RBX,4),%ZMM7</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVUPS 0x40(%RAX,%RBX,4),%ZMM8</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM9,%ZMM7,%ZMM22</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM9,%ZMM8,%ZMM23</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMOVUPS (%RSI,%RBX,4),%ZMM13</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVUPS 0x40(%RSI,%RBX,4),%ZMM14</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM10,%ZMM13,%ZMM13</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM10,%ZMM14,%ZMM14</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMOVUPS (%RDI,%RBX,4),%ZMM20</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVUPS 0x40(%RDI,%RBX,4),%ZMM21</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM11,%ZMM20,%ZMM20</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM11,%ZMM21,%ZMM21</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMOVAPS %ZMM22,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM24,%ZMM22,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMOVAPS %ZMM23,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM24,%ZMM23,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM13,%ZMM13,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM14,%ZMM14,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM20,%ZMM20,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM21,%ZMM21,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VEXTRACTF64X4 $0x1,%ZMM7,%YMM12</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3-6</td><td>1</td></tr><tr><td>VCVTPS2PD %YMM12,%ZMM12</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VCVTPS2PD %YMM7,%ZMM7</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VSQRTPD %ZMM7,%ZMM25</td><td>18</td><td>18</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>37</td><td>16-17</td></tr><tr><td>VEXTRACTF64X4 $0x1,%ZMM8,%YMM4</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3-6</td><td>1</td></tr><tr><td>VSQRTPD %ZMM12,%ZMM27</td><td>18</td><td>18</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>37</td><td>16-17</td></tr><tr><td>VCVTPS2PD %YMM8,%ZMM8</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VSQRTPD %ZMM8,%ZMM28</td><td>18</td><td>18</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>37</td><td>16-17</td></tr><tr><td>VCVTPS2PD %YMM4,%ZMM4</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VSQRTPD %ZMM4,%ZMM29</td><td>18</td><td>18</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>37</td><td>16-17</td></tr><tr><td>VMULPD %ZMM12,%ZMM27,%ZMM12</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMULPD %ZMM7,%ZMM25,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VCVTPD2PS %ZMM7,%YMM7</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VCVTPD2PS %ZMM12,%YMM12</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VINSERTF64X4 $0x1,%YMM12,%ZMM7,%ZMM7</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3-6</td><td>1</td></tr><tr><td>VRCP14PS %ZMM7,%ZMM12</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>8</td><td>3</td></tr><tr><td>VMULPD %ZMM4,%ZMM29,%ZMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMULPD %ZMM8,%ZMM28,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VCVTPD2PS %ZMM8,%YMM8</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VCVTPD2PS %ZMM4,%YMM4</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VINSERTF64X4 $0x1,%YMM4,%ZMM8,%ZMM4</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3-6</td><td>1</td></tr><tr><td>VRCP14PS %ZMM4,%ZMM8</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>8</td><td>3</td></tr><tr><td>VFNMADD213PS %ZMM16,%ZMM12,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD132PS %ZMM12,%ZMM12,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFNMADD213PS %ZMM16,%ZMM8,%ZMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD132PS %ZMM8,%ZMM8,%ZMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM19,%ZMM7,%ZMM22</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM18,%ZMM4,%ZMM23</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM17,%ZMM7,%ZMM13</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM1,%ZMM4,%ZMM14</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM7,%ZMM20,%ZMM0</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM4,%ZMM21,%ZMM15</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>ADD $0x20,%RBX</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>CMP %RBX,%RBP</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>JNE 401580 <.omp_outlined.+0x1c0></td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1-2</td></tr></table>",
        },
      },
      header = {
        "11% of peak computational performance is used (7.49 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "<ul><li>Pass to your compiler a micro-architecture specialization option:\n<ul><li>Please read your compiler manual</li></ul></li><li>Use vector aligned instructions:\n<ol><li>align your arrays on 64 bytes boundaries</li><li>inform your compiler that your arrays are vector aligned: read your compiler manual.</li></ol></li></ul>",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 92% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 94.00 to 88.00 cycles (1.07x speedup).",
        },
        {
          workaround = "<ul><li>Reduce the number of division or square root instructions:\n<ul><li>If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.</li></ul></li><li>Reduce the number of FP add instructions</li><li>Reduce the number of FP multiply/FMA instructions</li><li>Reduce arithmetical operations on array elements</li></ul>",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n<ul><li>execution of divide and square root operations (the divide/square root unit is a bottleneck)</li><li>execution of FP add operations (the FP add unit is a bottleneck)</li><li>execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)</li><li>execution of INT/FP operations in vector registers (the VPU is a bottleneck)</li></ul>",
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
          workaround = "<ul><li>Pass to your compiler a micro-architecture specialization option:\n<ul><li>Please read your compiler manual</li></ul></li><li>Use vector aligned instructions:\n<ol><li>align your arrays on 64 bytes boundaries</li><li>inform your compiler that your arrays are vector aligned: read your compiler manual.</li></ol></li></ul>",
          details = "<ul><li>VEXTRACTF64X4: 2 occurrences</li><li>VINSERTF64X4: 2 occurrences</li></ul>",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 4 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = "<ul><li>VCVTPD2PS (FP64 to FP32, SIMD): 4 occurrences</li><li>VCVTPS2PD (FP32 to FP64, SIMD): 4 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "24 AVX-512 instructions are processing arithmetic or math operations on single precision FP elements in vector mode (sixteen at a time).\n8 AVX-512 instructions are processing arithmetic or math operations on double precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 704 FP arithmetical operations:\n<ul><li>352: addition or subtraction (256 inside FMA instructions)</li><li>288: multiply (256 inside FMA instructions)</li><li>32: fast reciprocal</li><li>32: square root</li></ul>The binary loop is loading 384 bytes (96 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.83 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>59</td></tr><tr><td>loop length</td><td>362</td></tr><tr><td>used x86 registers</td><td>5</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>0</td></tr><tr><td>used ymm registers</td><td>4</td></tr><tr><td>used zmm registers</td><td>25</td></tr><tr><td>nb stack references</td><td>0</td></tr><tr><td>ADD-SUB / MUL ratio</td><td>1.50</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\n<table><tr><td>instruction fetch</td><td>23.00 cycles</td></tr><tr><td>instruction queue</td><td>29.50 cycles</td></tr><tr><td>decoding</td><td>29.50 cycles</td></tr><tr><td>micro-operation queue</td><td>30.00 cycles</td></tr><tr><td>front end</td><td>30.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th></tr><tr><td>uops</td><td>94.00</td><td>32.00</td><td>3.00</td><td>3.00</td><td>1.50</td><td>1.50</td><td>0.00</td></tr><tr><td>cycles</td><td>94.00</td><td>32.00</td><td>3.00</td><td>3.00</td><td>1.50</td><td>1.50</td><td>0.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>64.00-68.00</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>10.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>30.00</td></tr><tr><td>Dispatch</td><td>94.00</td></tr><tr><td>DIV/SQRT</td><td>64.00-68.00</td></tr><tr><td>Data deps.</td><td>10.00</td></tr><tr><td>Overall L1</td><td>94.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\n<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>100%</td></tr></table>FP\n<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>100%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>100%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\n<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>100%</td></tr></table>FP\n<table><tr><td>all</td><td>92%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>75%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>92%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>77%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 94.00 cycles. At this rate:\n<ul><li>3% of peak load performance is reached (4.09 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 401580\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>VMOVAPS %ZMM14,%ZMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VMOVAPS %ZMM13,%ZMM17</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VMOVDQA64 %ZMM23,%ZMM18</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VMOVDQA64 %ZMM22,%ZMM19</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VMOVUPS (%RAX,%RBX,4),%ZMM7</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVUPS 0x40(%RAX,%RBX,4),%ZMM8</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM9,%ZMM7,%ZMM22</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM9,%ZMM8,%ZMM23</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMOVUPS (%RSI,%RBX,4),%ZMM13</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVUPS 0x40(%RSI,%RBX,4),%ZMM14</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM10,%ZMM13,%ZMM13</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM10,%ZMM14,%ZMM14</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMOVUPS (%RDI,%RBX,4),%ZMM20</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVUPS 0x40(%RDI,%RBX,4),%ZMM21</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM11,%ZMM20,%ZMM20</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VSUBPS %ZMM11,%ZMM21,%ZMM21</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMOVAPS %ZMM22,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM24,%ZMM22,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMOVAPS %ZMM23,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM24,%ZMM23,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM13,%ZMM13,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM14,%ZMM14,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM20,%ZMM20,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM21,%ZMM21,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VEXTRACTF64X4 $0x1,%ZMM7,%YMM12</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3-6</td><td>1</td></tr><tr><td>VCVTPS2PD %YMM12,%ZMM12</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VCVTPS2PD %YMM7,%ZMM7</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VSQRTPD %ZMM7,%ZMM25</td><td>18</td><td>18</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>37</td><td>16-17</td></tr><tr><td>VEXTRACTF64X4 $0x1,%ZMM8,%YMM4</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3-6</td><td>1</td></tr><tr><td>VSQRTPD %ZMM12,%ZMM27</td><td>18</td><td>18</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>37</td><td>16-17</td></tr><tr><td>VCVTPS2PD %YMM8,%ZMM8</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VSQRTPD %ZMM8,%ZMM28</td><td>18</td><td>18</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>37</td><td>16-17</td></tr><tr><td>VCVTPS2PD %YMM4,%ZMM4</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VSQRTPD %ZMM4,%ZMM29</td><td>18</td><td>18</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>37</td><td>16-17</td></tr><tr><td>VMULPD %ZMM12,%ZMM27,%ZMM12</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMULPD %ZMM7,%ZMM25,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VCVTPD2PS %ZMM7,%YMM7</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VCVTPD2PS %ZMM12,%YMM12</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VINSERTF64X4 $0x1,%YMM12,%ZMM7,%ZMM7</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3-6</td><td>1</td></tr><tr><td>VRCP14PS %ZMM7,%ZMM12</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>8</td><td>3</td></tr><tr><td>VMULPD %ZMM4,%ZMM29,%ZMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VMULPD %ZMM8,%ZMM28,%ZMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VCVTPD2PS %ZMM8,%YMM8</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VCVTPD2PS %ZMM4,%YMM4</td><td>2</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>7</td><td>7</td></tr><tr><td>VINSERTF64X4 $0x1,%YMM4,%ZMM8,%ZMM4</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3-6</td><td>1</td></tr><tr><td>VRCP14PS %ZMM4,%ZMM8</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>8</td><td>3</td></tr><tr><td>VFNMADD213PS %ZMM16,%ZMM12,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD132PS %ZMM12,%ZMM12,%ZMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFNMADD213PS %ZMM16,%ZMM8,%ZMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD132PS %ZMM8,%ZMM8,%ZMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM19,%ZMM7,%ZMM22</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM18,%ZMM4,%ZMM23</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM17,%ZMM7,%ZMM13</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD213PS %ZMM1,%ZMM4,%ZMM14</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM7,%ZMM20,%ZMM0</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>VFMADD231PS %ZMM4,%ZMM21,%ZMM15</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>6</td><td>0.50</td></tr><tr><td>ADD $0x20,%RBX</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>CMP %RBX,%RBP</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>JNE 401580 <.omp_outlined.+0x1c0></td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1-2</td></tr></table>",
        },
      },
      header = {
        "11% of peak computational performance is used (7.49 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "<ul><li>Pass to your compiler a micro-architecture specialization option:\n<ul><li>Please read your compiler manual</li></ul></li><li>Use vector aligned instructions:\n<ol><li>align your arrays on 64 bytes boundaries</li><li>inform your compiler that your arrays are vector aligned: read your compiler manual.</li></ol></li></ul>",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 92% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 94.00 to 88.00 cycles (1.07x speedup).",
        },
        {
          workaround = "<ul><li>Reduce the number of division or square root instructions:\n<ul><li>If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.</li></ul></li><li>Reduce the number of FP add instructions</li><li>Reduce the number of FP multiply/FMA instructions</li><li>Reduce arithmetical operations on array elements</li></ul>",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n<ul><li>execution of divide and square root operations (the divide/square root unit is a bottleneck)</li><li>execution of FP add operations (the FP add unit is a bottleneck)</li><li>execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)</li><li>execution of INT/FP operations in vector registers (the VPU is a bottleneck)</li></ul>",
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

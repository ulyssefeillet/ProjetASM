address;source_location;insn;indent
0x17c0;:0;MOV	0x60(%RSP),%RDX;
0x17c5;:0;XOR	%EAX,%EAX;
0x17c7;:0;VMOVSS	(%RCX,%R8,4),%XMM2;
0x17cd;:0;VMOVSS	%XMM15,%XMM15,%XMM5;
0x17d1;:0;VMOVSS	(%RDI,%R8,4),%XMM3;
0x17d7;:0;VMOVAPS	%ZMM15,%ZMM16;
0x17dd;:0;CMP	%RDX,0x68(%RSP);
0x17e2;:0;VMOVAPS	%ZMM15,%ZMM17;
0x17e8;:0;VMOVSS	(%RSI,%R8,4),%XMM4;
0x17ee;:0;JA	19d0 <move_particles._omp_fn.0+0x380>;
0x17f4;:0;TEST	%R9,%R9;
0x17f7;:0;JE	1862 <move_particles._omp_fn.0+0x212>;
0x17f9;:0;NOPL	(%RAX);
0x1800;:0;VMOVSS	(%RDI,%RAX,4),%XMM7;  (5) 
0x1805;:0;VSUBSS	%XMM3,%XMM7,%XMM7;  (5) 
0x1809;:0;VMOVSS	(%RSI,%RAX,4),%XMM6;  (5) 
0x180e;:0;VSUBSS	%XMM4,%XMM6,%XMM6;  (5) 
0x1812;:0;VMOVSS	(%RCX,%RAX,4),%XMM8;  (5) 
0x1817;:0;VSUBSS	%XMM2,%XMM8,%XMM8;  (5) 
0x181b;:0;LEA	0x1(%RAX),%RAX;  (5) 
0x181f;:0;VMULSS	%XMM7,%XMM7,%XMM0;  (5) 
0x1823;:0;CMP	%R9,%RAX;  (5) 
0x1826;:0;VMOVSS	%XMM6,%XMM6,%XMM1;  (5) 
0x182a;:0;VFMADD132SS	%XMM6,%XMM12,%XMM1;  (5) 
0x182f;:0;VFMADD231SS	%XMM8,%XMM8,%XMM0;  (5) 
0x1834;:0;VADDSS	%XMM1,%XMM0,%XMM1;  (5) 
0x1838;:0;VCVTSS2SD	%XMM1,%XMM1,%XMM1;  (5) 
0x183c;:0;VSQRTSD	%XMM1,%XMM1,%XMM0;  (5) 
0x1840;:0;VMULSD	%XMM1,%XMM0,%XMM0;  (5) 
0x1844;:0;VCVTSD2SS	%XMM0,%XMM0,%XMM0;  (5) 
0x1848;:0;VDIVSS	%XMM0,%XMM11,%XMM0;  (5) 
0x184c;:0;VFMADD231SS	%XMM8,%XMM0,%XMM17;  (5) 
0x1852;:0;VFMADD231SS	%XMM7,%XMM0,%XMM16;  (5) 
0x1858;:0;VFMADD231SS	%XMM6,%XMM0,%XMM5;  (5) 
0x185d;:0;JNE	1800 <move_particles._omp_fn.0+0x1b0>;  (5) 
0x185f;:0;LEA	(%R9),%RAX;
0x1862;:0;VXORPS	%XMM6,%XMM6,%XMM6;
0x1866;:0;VBROADCASTSS	%XMM2,%ZMM23;
0x186c;:0;VBROADCASTSS	%XMM3,%ZMM22;
0x1872;:0;VBROADCASTSS	%XMM4,%ZMM21;
0x1878;:0;XOR	%EDX,%EDX;
0x187a;:0;VMOVAPS	%ZMM6,%ZMM7;
0x1880;:0;VMOVAPS	%ZMM6,%ZMM8;
0x1886;:0;NOPW	%CS:(%RAX,%RAX,1);
0x1890;:0;VMOVAPS	(%R13,%RDX,1),%ZMM1;  (4) 
0x1898;:0;VSUBPS	%ZMM23,%ZMM1,%ZMM20;  (4) 
0x189e;:0;VMOVUPS	(%R12,%RDX,1),%ZMM1;  (4) 
0x18a5;:0;VSUBPS	%ZMM22,%ZMM1,%ZMM19;  (4) 
0x18ab;:0;VMOVUPS	(%R10,%RDX,1),%ZMM1;  (4) 
0x18b2;:0;VSUBPS	%ZMM21,%ZMM1,%ZMM18;  (4) 
0x18b8;:0;LEA	0x40(%RDX),%RDX;  (4) 
0x18bc;:0;CMP	%R11,%RDX;  (4) 
0x18bf;:0;VMULPS	%ZMM19,%ZMM19,%ZMM0;  (4) 
0x18c5;:0;VFMADD231PS	%ZMM20,%ZMM20,%ZMM0;  (4) 
0x18cb;:0;VADDPS	%ZMM14,%ZMM0,%ZMM0;  (4) 
0x18d1;:0;VFMADD231PS	%ZMM18,%ZMM18,%ZMM0;  (4) 
0x18d7;:0;VCVTPS2PD	%YMM0,%ZMM25;  (4) 
0x18dd;:0;VEXTRACTI64X4	$0x1,%ZMM0,%YMM0;  (4) 
0x18e4;:0;VCVTPS2PD	%YMM0,%ZMM0;  (4) 
0x18ea;:0;VSQRTPD	%ZMM25,%ZMM1;  (4) 
0x18f0;:0;VSQRTPD	%ZMM0,%ZMM24;  (4) 
0x18f6;:0;VMULPD	%ZMM25,%ZMM1,%ZMM1;  (4) 
0x18fc;:0;VMULPD	%ZMM0,%ZMM24,%ZMM0;  (4) 
0x1902;:0;VCVTPD2PS	%ZMM1,%YMM1;  (4) 
0x1908;:0;VCVTPD2PS	%ZMM0,%YMM0;  (4) 
0x190e;:0;VINSERTF64X4	$0x1,%YMM0,%ZMM1,%ZMM1;  (4) 
0x1915;:0;VRCP28PS	%ZMM1,%ZMM1;  (4) 
0x191b;:0;VFMADD231PS	%ZMM20,%ZMM1,%ZMM8;  (4) 
0x1921;:0;VFMADD231PS	%ZMM19,%ZMM1,%ZMM7;  (4) 
0x1927;:0;VFMADD231PS	%ZMM18,%ZMM1,%ZMM6;  (4) 
0x192d;:0;JNE	1890 <move_particles._omp_fn.0+0x240>;  (4) 
0x1933;:0;VEXTRACTI64X4	$0x1,%ZMM6,%YMM0;
0x193a;:0;VADDPS	%YMM6,%YMM0,%YMM6;
0x193e;:0;MOV	0x58(%RSP),%RDX;
0x1943;:0;VEXTRACTF128	$0x1,%YMM6,%XMM0;
0x1949;:0;ADD	%RDX,%RAX;
0x194c;:0;VADDPS	%XMM6,%XMM0,%XMM6;
0x1950;:0;CMP	0x50(%RSP),%RDX;
0x1955;:0;VMOVHLPS	%XMM6,%XMM6,%XMM0;
0x1959;:0;VADDPS	%XMM6,%XMM0,%XMM6;
0x195d;:0;VSHUFPS	$0x55,%XMM6,%XMM6,%XMM0;
0x1962;:0;VADDPS	%XMM6,%XMM0,%XMM0;
0x1966;:0;VADDSS	%XMM5,%XMM0,%XMM5;
0x196a;:0;VEXTRACTI64X4	$0x1,%ZMM7,%YMM0;
0x1971;:0;VADDPS	%YMM7,%YMM0,%YMM0;
0x1975;:0;VEXTRACTF128	$0x1,%YMM0,%XMM7;
0x197b;:0;VADDPS	%XMM0,%XMM7,%XMM7;
0x197f;:0;VMOVHLPS	%XMM7,%XMM7,%XMM0;
0x1983;:0;VADDPS	%XMM7,%XMM0,%XMM7;
0x1987;:0;VSHUFPS	$0x55,%XMM7,%XMM7,%XMM0;
0x198c;:0;VADDPS	%XMM7,%XMM0,%XMM0;
0x1990;:0;VADDSS	%XMM16,%XMM0,%XMM16;
0x1996;:0;VEXTRACTI64X4	$0x1,%ZMM8,%YMM0;
0x199d;:0;VADDPS	%YMM8,%YMM0,%YMM0;
0x19a2;:0;VEXTRACTF128	$0x1,%YMM0,%XMM8;
0x19a8;:0;VADDPS	%XMM0,%XMM8,%XMM8;
0x19ac;:0;VMOVHLPS	%XMM8,%XMM8,%XMM0;
0x19b1;:0;VADDPS	%XMM8,%XMM0,%XMM8;
0x19b6;:0;VSHUFPS	$0x55,%XMM8,%XMM8,%XMM0;
0x19bc;:0;VADDPS	%XMM8,%XMM0,%XMM0;
0x19c1;:0;VADDSS	%XMM17,%XMM0,%XMM17;
0x19c7;:0;JE	1a35 <move_particles._omp_fn.0+0x3e5>;
0x19c9;:0;NOPL	(%RAX);
0x19d0;:0;VMOVSS	(%RDI,%RAX,4),%XMM8;  (2) 
0x19d5;:0;VSUBSS	%XMM3,%XMM8,%XMM8;  (2) 
0x19d9;:0;VMOVSS	(%RSI,%RAX,4),%XMM7;  (2) 
0x19de;:0;VSUBSS	%XMM4,%XMM7,%XMM7;  (2) 
0x19e2;:0;VMOVSS	(%RCX,%RAX,4),%XMM18;  (2) 
0x19e9;:0;VSUBSS	%XMM2,%XMM18,%XMM18;  (2) 
0x19ef;:0;LEA	0x1(%RAX),%RAX;  (2) 
0x19f3;:0;VMULSS	%XMM8,%XMM8,%XMM0;  (2) 
0x19f8;:0;CMP	%RAX,%RBX;  (2) 
0x19fb;:0;VMOVSS	%XMM7,%XMM7,%XMM1;  (2) 
0x19ff;:0;VFMADD132SS	%XMM7,%XMM10,%XMM1;  (2) 
0x1a04;:0;VFMADD231SS	%XMM18,%XMM18,%XMM0;  (2) 
0x1a0a;:0;VADDSS	%XMM1,%XMM0,%XMM1;  (2) 
0x1a0e;:0;VCVTSS2SD	%XMM1,%XMM1,%XMM1;  (2) 
0x1a12;:0;VSQRTSD	%XMM1,%XMM1,%XMM0;  (2) 
0x1a16;:0;VMULSD	%XMM1,%XMM0,%XMM0;  (2) 
0x1a1a;:0;VCVTSD2SS	%XMM0,%XMM0,%XMM0;  (2) 
0x1a1e;:0;VDIVSS	%XMM0,%XMM9,%XMM0;  (2) 
0x1a22;:0;VFMADD231SS	%XMM18,%XMM0,%XMM17;  (2) 
0x1a28;:0;VFMADD231SS	%XMM8,%XMM0,%XMM16;  (2) 
0x1a2e;:0;VFMADD231SS	%XMM7,%XMM0,%XMM5;  (2) 
0x1a33;:0;JA	19d0 <move_particles._omp_fn.0+0x380>;  (2) 
0x1a35;:0;MOV	0x70(%RSP),%RAX;
0x1a3a;:0;VFMADD213SS	(%R15,%R8,4),%XMM13,%XMM17;
0x1a41;:0;VMOVSS	%XMM17,(%R15,%R8,4);
0x1a48;:0;VFMADD213SS	(%R14,%R8,4),%XMM13,%XMM16;
0x1a4f;:0;VMOVSS	%XMM16,(%R14,%R8,4);
0x1a56;:0;VFMADD213SS	(%RAX,%R8,4),%XMM13,%XMM5;
0x1a5c;:0;VMOVSS	%XMM5,(%RAX,%R8,4);
0x1a62;:0;LEA	0x1(%R8),%R8;
0x1a66;:0;CMP	0x78(%RSP),%R8;
0x1a6b;:0;JB	17c0 <move_particles._omp_fn.0+0x170>;

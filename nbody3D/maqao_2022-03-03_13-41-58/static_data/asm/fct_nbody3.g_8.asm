address;source_location;insn;indent
0x1650;:0;ENDBR64;
0x1654;:0;PUSH	%RBP;
0x1655;:0;MOV	%RSP,%RBP;
0x1658;:0;PUSH	%R15;
0x165a;:0;PUSH	%R14;
0x165c;:0;PUSH	%R13;
0x165e;:0;PUSH	%R12;
0x1660;:0;PUSH	%RBX;
0x1661;:0;AND	$-0x40,%RSP;
0x1665;:0;LEA	-0x80(%RSP),%RSP;
0x166a;:0;MOV	0x8(%RDI),%RBX;
0x166e;:0;MOV	(%RDI),%RAX;
0x1671;:0;VMOVSS	0x10(%RDI),%XMM13;
0x1676;:0;TEST	%RBX,%RBX;
0x1679;:0;MOV	%RAX,0x30(%RSP);
0x167e;:0;JE	16d4 <move_particles._omp_fn.0+0x84>;
0x1680;:0;VMOVSS	%XMM13,0x78(%RSP);
0x1686;:0;CALL	1170 <.plt.sec@start+0x60>;
0x168b;:0;LEA	(%RAX),%R12D;
0x168e;:0;CALL	1150 <.plt.sec@start+0x40>;
0x1693;:0;MOVSXD	%EAX,%RSI;
0x1696;:0;XOR	%EDX,%EDX;
0x1698;:0;MOVSXD	%R12D,%RCX;
0x169b;:0;LEA	(%RBX),%RAX;
0x169e;:0;DIV	%RCX;
0x16a1;:0;MOV	%RSI,0x48(%RSP);
0x16a6;:0;VMOVSS	0x78(%RSP),%XMM13;
0x16ac;:0;MOV	%RDX,0x40(%RSP);
0x16b1;:0;CMP	%RDX,%RSI;
0x16b4;:0;MOV	%RAX,0x38(%RSP);
0x16b9;:0;JB	16e7 <move_particles._omp_fn.0+0x97>;
0x16bb;:0;LEA	(%RSI),%R8;
0x16be;:0;IMUL	%RAX,%R8;
0x16c2;:0;ADD	0x40(%RSP),%R8;
0x16c7;:0;ADD	%R8,%RAX;
0x16ca;:0;MOV	%RAX,0x78(%RSP);
0x16cf;:0;CMP	%R8,%RAX;
0x16d2;:0;JA	1707 <move_particles._omp_fn.0+0xb7>;
0x16d4;:0;LEA	-0x28(%RBP),%RSP;
0x16d8;:0;POP	%RBX;
0x16d9;:0;POP	%R12;
0x16db;:0;POP	%R13;
0x16dd;:0;POP	%R14;
0x16df;:0;POP	%R15;
0x16e1;:0;POP	%RBP;
0x16e2;:0;JMP	1130 <.plt.sec@start+0x20>;
0x16e7;:0;LEA	0x1(%RAX),%R12;
0x16eb;:0;LEA	(%RSI),%R8;
0x16ee;:0;IMUL	%R12,%R8;
0x16f2;:0;LEA	(%R12),%RAX;
0x16f6;:0;ADD	%R8,%RAX;
0x16f9;:0;MOV	%RAX,0x78(%RSP);
0x16fe;:0;CMP	%RAX,%R8;
0x1701;:0;JAE	1b1b <move_particles._omp_fn.0+0x4cb>;
0x1707;:0;MOV	0x30(%RSP),%RAX;
0x170c;:0;VMOVSS	0xa04(%RIP),%XMM10;
0x1714;:0;VMOVSS	0xa00(%RIP),%XMM9;
0x171c;:0;VMOVSS	%XMM10,%XMM10,%XMM12;
0x1721;:0;MOV	(%RAX),%RCX;
0x1724;:0;VMOVSS	%XMM9,%XMM9,%XMM11;
0x1729;:0;MOV	0x8(%RAX),%RDI;
0x172d;:0;MOV	0x10(%RAX),%RSI;
0x1731;:0;MOV	0x18(%RAX),%R15;
0x1735;:0;LEA	(%RCX),%R9;
0x1738;:0;SHR	$0x2,%R9;
0x173c;:0;MOV	0x20(%RAX),%R14;
0x1740;:0;NEG	%R9;
0x1743;:0;MOV	0x28(%RAX),%RAX;
0x1747;:0;AND	$0xf,%R9D;
0x174b;:0;MOV	%R9,%RDX;
0x174e;:0;LEA	(,%R9,4),%R10;
0x1756;:0;ADD	$0xf,%RDX;
0x175a;:0;LEA	(%RCX,%R10,1),%R13;
0x175e;:0;CMP	$0x17,%RDX;
0x1762;:0;LEA	(%RDI,%R10,1),%R12;
0x1766;:0;MOV	%RAX,0x70(%RSP);
0x176b;:0;LEA	-0x1(%RBX),%RAX;
0x176f;:0;MOV	%RAX,0x60(%RSP);
0x1774;:0;MOV	$0x17,%EAX;
0x1779;:0;CMOVAE	%RDX,%RAX;
0x177d;:0;LEA	(%R10,%RSI,1),%R10;
0x1781;:0;VXORPS	%XMM15,%XMM15,%XMM15;
0x1786;:0;MOV	%RAX,0x68(%RSP);
0x178b;:0;LEA	(%RBX),%RAX;
0x178e;:0;VMOVAPS	0x9a8(%RIP),%ZMM14;
0x1798;:0;SUB	%R9,%RAX;
0x179b;:0;MOV	%RAX,0x50(%RSP);
0x17a0;:0;MOV	%RAX,%R11;
0x17a3;:0;SHR	$0x4,%R11;
0x17a7;:0;AND	$-0x10,%RAX;
0x17ab;:0;SAL	$0x6,%R11;
0x17af;:0;MOV	%RAX,0x58(%RSP);
0x17b4;:0;NOPW	%CS:(%RAX,%RAX,1);
0x17bf;:0;NOP;
0x17c0;:0;MOV	0x60(%RSP),%RDX;(3) 
0x17c5;:0;XOR	%EAX,%EAX;(3) 
0x17c7;:0;VMOVSS	(%RCX,%R8,4),%XMM2;(3) 
0x17cd;:0;VMOVSS	%XMM15,%XMM15,%XMM5;(3) 
0x17d1;:0;VMOVSS	(%RDI,%R8,4),%XMM3;(3) 
0x17d7;:0;VMOVAPS	%ZMM15,%ZMM16;(3) 
0x17dd;:0;CMP	%RDX,0x68(%RSP);(3) 
0x17e2;:0;VMOVAPS	%ZMM15,%ZMM17;(3) 
0x17e8;:0;VMOVSS	(%RSI,%R8,4),%XMM4;(3) 
0x17ee;:0;JA	19d0 <move_particles._omp_fn.0+0x380>;(3) 
0x17f4;:0;TEST	%R9,%R9;(3) 
0x17f7;:0;JE	1862 <move_particles._omp_fn.0+0x212>;(3) 
0x17f9;:0;NOPL	(%RAX);(3) 
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
0x185f;:0;LEA	(%R9),%RAX;(3) 
0x1862;:0;VXORPS	%XMM6,%XMM6,%XMM6;(3) 
0x1866;:0;VBROADCASTSS	%XMM2,%ZMM23;(3) 
0x186c;:0;VBROADCASTSS	%XMM3,%ZMM22;(3) 
0x1872;:0;VBROADCASTSS	%XMM4,%ZMM21;(3) 
0x1878;:0;XOR	%EDX,%EDX;(3) 
0x187a;:0;VMOVAPS	%ZMM6,%ZMM7;(3) 
0x1880;:0;VMOVAPS	%ZMM6,%ZMM8;(3) 
0x1886;:0;NOPW	%CS:(%RAX,%RAX,1);(3) 
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
0x1933;:0;VEXTRACTI64X4	$0x1,%ZMM6,%YMM0;(3) 
0x193a;:0;VADDPS	%YMM6,%YMM0,%YMM6;(3) 
0x193e;:0;MOV	0x58(%RSP),%RDX;(3) 
0x1943;:0;VEXTRACTF128	$0x1,%YMM6,%XMM0;(3) 
0x1949;:0;ADD	%RDX,%RAX;(3) 
0x194c;:0;VADDPS	%XMM6,%XMM0,%XMM6;(3) 
0x1950;:0;CMP	0x50(%RSP),%RDX;(3) 
0x1955;:0;VMOVHLPS	%XMM6,%XMM6,%XMM0;(3) 
0x1959;:0;VADDPS	%XMM6,%XMM0,%XMM6;(3) 
0x195d;:0;VSHUFPS	$0x55,%XMM6,%XMM6,%XMM0;(3) 
0x1962;:0;VADDPS	%XMM6,%XMM0,%XMM0;(3) 
0x1966;:0;VADDSS	%XMM5,%XMM0,%XMM5;(3) 
0x196a;:0;VEXTRACTI64X4	$0x1,%ZMM7,%YMM0;(3) 
0x1971;:0;VADDPS	%YMM7,%YMM0,%YMM0;(3) 
0x1975;:0;VEXTRACTF128	$0x1,%YMM0,%XMM7;(3) 
0x197b;:0;VADDPS	%XMM0,%XMM7,%XMM7;(3) 
0x197f;:0;VMOVHLPS	%XMM7,%XMM7,%XMM0;(3) 
0x1983;:0;VADDPS	%XMM7,%XMM0,%XMM7;(3) 
0x1987;:0;VSHUFPS	$0x55,%XMM7,%XMM7,%XMM0;(3) 
0x198c;:0;VADDPS	%XMM7,%XMM0,%XMM0;(3) 
0x1990;:0;VADDSS	%XMM16,%XMM0,%XMM16;(3) 
0x1996;:0;VEXTRACTI64X4	$0x1,%ZMM8,%YMM0;(3) 
0x199d;:0;VADDPS	%YMM8,%YMM0,%YMM0;(3) 
0x19a2;:0;VEXTRACTF128	$0x1,%YMM0,%XMM8;(3) 
0x19a8;:0;VADDPS	%XMM0,%XMM8,%XMM8;(3) 
0x19ac;:0;VMOVHLPS	%XMM8,%XMM8,%XMM0;(3) 
0x19b1;:0;VADDPS	%XMM8,%XMM0,%XMM8;(3) 
0x19b6;:0;VSHUFPS	$0x55,%XMM8,%XMM8,%XMM0;(3) 
0x19bc;:0;VADDPS	%XMM8,%XMM0,%XMM0;(3) 
0x19c1;:0;VADDSS	%XMM17,%XMM0,%XMM17;(3) 
0x19c7;:0;JE	1a35 <move_particles._omp_fn.0+0x3e5>;(3) 
0x19c9;:0;NOPL	(%RAX);(3) 
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
0x1a35;:0;MOV	0x70(%RSP),%RAX;(3) 
0x1a3a;:0;VFMADD213SS	(%R15,%R8,4),%XMM13,%XMM17;(3) 
0x1a41;:0;VMOVSS	%XMM17,(%R15,%R8,4);(3) 
0x1a48;:0;VFMADD213SS	(%R14,%R8,4),%XMM13,%XMM16;(3) 
0x1a4f;:0;VMOVSS	%XMM16,(%R14,%R8,4);(3) 
0x1a56;:0;VFMADD213SS	(%RAX,%R8,4),%XMM13,%XMM5;(3) 
0x1a5c;:0;VMOVSS	%XMM5,(%RAX,%R8,4);(3) 
0x1a62;:0;LEA	0x1(%R8),%R8;(3) 
0x1a66;:0;CMP	0x78(%RSP),%R8;(3) 
0x1a6b;:0;JB	17c0 <move_particles._omp_fn.0+0x170>;(3) 
0x1a71;:0;VMOVSS	%XMM13,0x78(%RSP);
0x1a77;:0;CALL	1130 <.plt.sec@start+0x20>;
0x1a7c;:0;MOV	0x40(%RSP),%RBX;
0x1a81;:0;VMOVSS	0x78(%RSP),%XMM13;
0x1a87;:0;CMP	%RBX,0x48(%RSP);
0x1a8c;:0;JB	1b40 <move_particles._omp_fn.0+0x4f0>;
0x1a92;:0;MOV	0x38(%RSP),%RBX;
0x1a97;:0;MOV	0x48(%RSP),%RAX;
0x1a9c;:0;MOV	%RBX,%RDI;
0x1a9f;:0;IMUL	%RBX,%RAX;
0x1aa3;:0;ADD	0x40(%RSP),%RAX;
0x1aa8;:0;ADD	%RAX,%RDI;
0x1aab;:0;CMP	%RDI,%RAX;
0x1aae;:0;JAE	1b0c <move_particles._omp_fn.0+0x4bc>;
0x1ab0;:0;MOV	0x30(%RSP),%RBX;
0x1ab5;:0;MOV	(%RBX),%RSI;
0x1ab8;:0;MOV	0x18(%RBX),%R10;
0x1abc;:0;MOV	0x8(%RBX),%RCX;
0x1ac0;:0;MOV	0x20(%RBX),%R9;
0x1ac4;:0;MOV	0x10(%RBX),%RDX;
0x1ac8;:0;MOV	0x28(%RBX),%R8;
0x1acc;:0;NOPL	(%RAX);
0x1ad0;:0;VMOVSS	(%R10,%RAX,4),%XMM0;(1) 
0x1ad6;:0;VFMADD213SS	(%RSI,%RAX,4),%XMM13,%XMM0;(1) 
0x1adc;:0;VMOVSS	%XMM0,(%RSI,%RAX,4);(1) 
0x1ae1;:0;VMOVSS	(%R9,%RAX,4),%XMM0;(1) 
0x1ae7;:0;VFMADD213SS	(%RCX,%RAX,4),%XMM13,%XMM0;(1) 
0x1aed;:0;VMOVSS	%XMM0,(%RCX,%RAX,4);(1) 
0x1af2;:0;VMOVSS	(%R8,%RAX,4),%XMM0;(1) 
0x1af8;:0;VFMADD213SS	(%RDX,%RAX,4),%XMM13,%XMM0;(1) 
0x1afe;:0;VMOVSS	%XMM0,(%RDX,%RAX,4);(1) 
0x1b03;:0;LEA	0x1(%RAX),%RAX;(1) 
0x1b07;:0;CMP	%RDI,%RAX;(1) 
0x1b0a;:0;JNE	1ad0 <move_particles._omp_fn.0+0x480>;(1) 
0x1b0c;:0;LEA	-0x28(%RBP),%RSP;
0x1b10;:0;POP	%RBX;
0x1b11;:0;POP	%R12;
0x1b13;:0;POP	%R13;
0x1b15;:0;POP	%R14;
0x1b17;:0;POP	%R15;
0x1b19;:0;POP	%RBP;
0x1b1a;:0;RET;
0x1b1b;:0;VMOVSS	%XMM13,0x78(%RSP);
0x1b21;:0;CALL	1130 <.plt.sec@start+0x20>;
0x1b26;:0;VMOVSS	0x78(%RSP),%XMM13;
0x1b2c;:0;MOV	0x48(%RSP),%RAX;
0x1b31;:0;MOV	%R12,%RDI;
0x1b34;:0;IMUL	%R12,%RAX;
0x1b38;:0;ADD	%RAX,%RDI;
0x1b3b;:0;JMP	1aab <move_particles._omp_fn.0+0x45b>;
0x1b40;:0;MOV	0x38(%RSP),%RAX;
0x1b45;:0;MOV	%RAX,%R12;
0x1b48;:0;ADD	$0x1,%R12;
0x1b4c;:0;JMP	1b2c <move_particles._omp_fn.0+0x4dc>;
0x1b4e;:0;XCHG	%AX,%AX;
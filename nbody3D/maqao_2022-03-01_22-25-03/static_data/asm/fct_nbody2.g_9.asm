address;source_location;insn;indent
0x16b0;:0;ENDBR64;
0x16b4;:0;TEST	%RSI,%RSI;
0x16b7;:0;JE	1a8f <move_particles+0x3df>;
0x16bd;:0;PUSH	%RBP;
0x16be;:0;VXORPS	%XMM15,%XMM15,%XMM15;
0x16c3;:0;MOV	%RSP,%RBP;
0x16c6;:0;PUSH	%R15;
0x16c8;:0;PUSH	%R14;
0x16ca;:0;PUSH	%R13;
0x16cc;:0;PUSH	%R12;
0x16ce;:0;PUSH	%RBX;
0x16cf;:0;MOV	(%RDI),%RCX;
0x16d2;:0;AND	$-0x40,%RSP;
0x16d6;:0;MOV	0x18(%RDI),%RAX;
0x16da;:0;MOV	0x8(%RDI),%R8;
0x16de;:0;MOV	0x10(%RDI),%R9;
0x16e2;:0;LEA	(%RCX),%R10;
0x16e5;:0;SHR	$0x2,%R10;
0x16e9;:0;MOV	%RAX,-0x8(%RSP);
0x16ee;:0;NEG	%R10;
0x16f1;:0;AND	$0xf,%R10D;
0x16f5;:0;LEA	-0x1(%RSI),%RAX;
0x16f9;:0;MOV	%R10,%RBX;
0x16fc;:0;LEA	(,%R10,4),%R11;
0x1704;:0;ADD	$0xf,%RBX;
0x1708;:0;LEA	(%RCX,%R11,1),%R13;
0x170c;:0;CMP	$0x17,%RBX;
0x1710;:0;LEA	(%R8,%R11,1),%R12;
0x1714;:0;MOV	%RAX,-0x18(%RSP);
0x1719;:0;MOV	$0x17,%EAX;
0x171e;:0;CMOVAE	%RBX,%RAX;
0x1722;:0;LEA	(%R11,%R9,1),%R11;
0x1726;:0;VMOVSS	0x9f2(%RIP),%XMM13;
0x172e;:0;MOV	%RAX,-0x10(%RSP);
0x1733;:0;LEA	(%RSI),%RAX;
0x1736;:0;SUB	%R10,%RAX;
0x1739;:0;VMOVSS	%XMM13,%XMM13,%XMM11;
0x173e;:0;MOV	%RAX,-0x28(%RSP);
0x1743;:0;MOV	%RAX,%RBX;
0x1746;:0;SHR	$0x4,%RBX;
0x174a;:0;AND	$-0x10,%RAX;
0x174e;:0;VMOVSS	0x9ce(%RIP),%XMM12;
0x1756;:0;MOV	0x20(%RDI),%R14;
0x175a;:0;VMOVSS	%XMM12,%XMM12,%XMM10;
0x175f;:0;MOV	0x28(%RDI),%R15;
0x1763;:0;XOR	%EDI,%EDI;
0x1765;:0;SAL	$0x6,%RBX;
0x1769;:0;MOV	%RAX,-0x20(%RSP);
0x176e;:0;VMOVAPS	0x9c8(%RIP),%ZMM14;
0x1778;:0;NOPL	(%RAX,%RAX,1);
0x1780;:0;MOV	-0x18(%RSP),%RDX;(4) 
0x1785;:0;XOR	%EAX,%EAX;(4) 
0x1787;:0;VMOVSS	(%RCX,%RDI,4),%XMM5;(4) 
0x178c;:0;VMOVSS	%XMM15,%XMM15,%XMM6;(4) 
0x1790;:0;VMOVSS	(%R8,%RDI,4),%XMM4;(4) 
0x1796;:0;VMOVAPS	%ZMM15,%ZMM16;(4) 
0x179c;:0;CMP	%RDX,-0x10(%RSP);(4) 
0x17a1;:0;VMOVAPS	%ZMM15,%ZMM17;(4) 
0x17a7;:0;VMOVSS	(%R9,%RDI,4),%XMM3;(4) 
0x17ad;:0;JA	1990 <move_particles+0x2e0>;(4) 
0x17b3;:0;TEST	%R10,%R10;(4) 
0x17b6;:0;JE	1825 <move_particles+0x175>;(4) 
0x17b8;:0;NOPL	(%RAX,%RAX,1);(4) 
0x17c0;:0;VMOVSS	(%R8,%RAX,4),%XMM8;  (6) 
0x17c6;:0;VSUBSS	%XMM4,%XMM8,%XMM8;  (6) 
0x17ca;:0;VMOVSS	(%R9,%RAX,4),%XMM7;  (6) 
0x17d0;:0;VSUBSS	%XMM3,%XMM7,%XMM7;  (6) 
0x17d4;:0;VMOVSS	(%RCX,%RAX,4),%XMM9;  (6) 
0x17d9;:0;VSUBSS	%XMM5,%XMM9,%XMM9;  (6) 
0x17dd;:0;LEA	0x1(%RAX),%RAX;  (6) 
0x17e1;:0;VMULSS	%XMM8,%XMM8,%XMM2;  (6) 
0x17e6;:0;CMP	%R10,%RAX;  (6) 
0x17e9;:0;VMOVSS	%XMM7,%XMM7,%XMM1;  (6) 
0x17ed;:0;VFMADD132SS	%XMM7,%XMM13,%XMM1;  (6) 
0x17f2;:0;VFMADD231SS	%XMM9,%XMM9,%XMM2;  (6) 
0x17f7;:0;VADDSS	%XMM2,%XMM1,%XMM2;  (6) 
0x17fb;:0;VCVTSS2SD	%XMM2,%XMM2,%XMM2;  (6) 
0x17ff;:0;VSQRTSD	%XMM2,%XMM2,%XMM1;  (6) 
0x1803;:0;VMULSD	%XMM2,%XMM1,%XMM1;  (6) 
0x1807;:0;VCVTSD2SS	%XMM1,%XMM1,%XMM1;  (6) 
0x180b;:0;VDIVSS	%XMM1,%XMM12,%XMM1;  (6) 
0x180f;:0;VFMADD231SS	%XMM9,%XMM1,%XMM17;  (6) 
0x1815;:0;VFMADD231SS	%XMM8,%XMM1,%XMM16;  (6) 
0x181b;:0;VFMADD231SS	%XMM7,%XMM1,%XMM6;  (6) 
0x1820;:0;JNE	17c0 <move_particles+0x110>;  (6) 
0x1822;:0;LEA	(%R10),%RAX;(4) 
0x1825;:0;VXORPS	%XMM9,%XMM9,%XMM9;(4) 
0x182a;:0;VBROADCASTSS	%XMM5,%ZMM23;(4) 
0x1830;:0;VBROADCASTSS	%XMM4,%ZMM22;(4) 
0x1836;:0;VBROADCASTSS	%XMM3,%ZMM21;(4) 
0x183c;:0;XOR	%EDX,%EDX;(4) 
0x183e;:0;VMOVAPS	%ZMM9,%ZMM8;(4) 
0x1844;:0;VMOVAPS	%ZMM9,%ZMM7;(4) 
0x184a;:0;NOPW	(%RAX,%RAX,1);(4) 
0x1850;:0;VMOVAPS	(%R13,%RDX,1),%ZMM2;  (5) 
0x1858;:0;VSUBPS	%ZMM23,%ZMM2,%ZMM20;  (5) 
0x185e;:0;VMOVUPS	(%R12,%RDX,1),%ZMM2;  (5) 
0x1865;:0;VSUBPS	%ZMM22,%ZMM2,%ZMM19;  (5) 
0x186b;:0;VMOVUPS	(%R11,%RDX,1),%ZMM2;  (5) 
0x1872;:0;VSUBPS	%ZMM21,%ZMM2,%ZMM18;  (5) 
0x1878;:0;LEA	0x40(%RDX),%RDX;  (5) 
0x187c;:0;CMP	%RBX,%RDX;  (5) 
0x187f;:0;VMULPS	%ZMM19,%ZMM19,%ZMM1;  (5) 
0x1885;:0;VFMADD231PS	%ZMM20,%ZMM20,%ZMM1;  (5) 
0x188b;:0;VADDPS	%ZMM14,%ZMM1,%ZMM1;  (5) 
0x1891;:0;VFMADD231PS	%ZMM18,%ZMM18,%ZMM1;  (5) 
0x1897;:0;VCVTPS2PD	%YMM1,%ZMM25;  (5) 
0x189d;:0;VEXTRACTI64X4	$0x1,%ZMM1,%YMM1;  (5) 
0x18a4;:0;VCVTPS2PD	%YMM1,%ZMM1;  (5) 
0x18aa;:0;VSQRTPD	%ZMM25,%ZMM2;  (5) 
0x18b0;:0;VSQRTPD	%ZMM1,%ZMM24;  (5) 
0x18b6;:0;VMULPD	%ZMM25,%ZMM2,%ZMM2;  (5) 
0x18bc;:0;VMULPD	%ZMM1,%ZMM24,%ZMM1;  (5) 
0x18c2;:0;VCVTPD2PS	%ZMM2,%YMM2;  (5) 
0x18c8;:0;VCVTPD2PS	%ZMM1,%YMM1;  (5) 
0x18ce;:0;VINSERTF64X4	$0x1,%YMM1,%ZMM2,%ZMM2;  (5) 
0x18d5;:0;VRCP28PS	%ZMM2,%ZMM2;  (5) 
0x18db;:0;VFMADD231PS	%ZMM2,%ZMM20,%ZMM7;  (5) 
0x18e1;:0;VFMADD231PS	%ZMM19,%ZMM2,%ZMM8;  (5) 
0x18e7;:0;VFMADD231PS	%ZMM18,%ZMM2,%ZMM9;  (5) 
0x18ed;:0;JNE	1850 <move_particles+0x1a0>;  (5) 
0x18f3;:0;VEXTRACTI64X4	$0x1,%ZMM9,%YMM1;(4) 
0x18fa;:0;VADDPS	%YMM9,%YMM1,%YMM9;(4) 
0x18ff;:0;MOV	-0x20(%RSP),%RDX;(4) 
0x1904;:0;VEXTRACTF128	$0x1,%YMM9,%XMM1;(4) 
0x190a;:0;ADD	%RDX,%RAX;(4) 
0x190d;:0;VADDPS	%XMM9,%XMM1,%XMM9;(4) 
0x1912;:0;CMP	-0x28(%RSP),%RDX;(4) 
0x1917;:0;VMOVHLPS	%XMM9,%XMM9,%XMM1;(4) 
0x191c;:0;VADDPS	%XMM9,%XMM1,%XMM9;(4) 
0x1921;:0;VSHUFPS	$0x55,%XMM9,%XMM9,%XMM1;(4) 
0x1927;:0;VADDPS	%XMM9,%XMM1,%XMM1;(4) 
0x192c;:0;VADDSS	%XMM1,%XMM6,%XMM6;(4) 
0x1930;:0;VEXTRACTI64X4	$0x1,%ZMM8,%YMM1;(4) 
0x1937;:0;VADDPS	%YMM8,%YMM1,%YMM1;(4) 
0x193c;:0;VEXTRACTF128	$0x1,%YMM1,%XMM8;(4) 
0x1942;:0;VADDPS	%XMM1,%XMM8,%XMM8;(4) 
0x1946;:0;VMOVHLPS	%XMM8,%XMM8,%XMM1;(4) 
0x194b;:0;VADDPS	%XMM8,%XMM1,%XMM8;(4) 
0x1950;:0;VSHUFPS	$0x55,%XMM8,%XMM8,%XMM1;(4) 
0x1956;:0;VADDPS	%XMM8,%XMM1,%XMM1;(4) 
0x195b;:0;VADDSS	%XMM16,%XMM1,%XMM16;(4) 
0x1961;:0;VEXTRACTI64X4	$0x1,%ZMM7,%YMM1;(4) 
0x1968;:0;VADDPS	%YMM7,%YMM1,%YMM1;(4) 
0x196c;:0;VEXTRACTF128	$0x1,%YMM1,%XMM7;(4) 
0x1972;:0;VADDPS	%XMM1,%XMM7,%XMM7;(4) 
0x1976;:0;VMOVHLPS	%XMM7,%XMM7,%XMM1;(4) 
0x197a;:0;VADDPS	%XMM7,%XMM1,%XMM7;(4) 
0x197e;:0;VSHUFPS	$0x55,%XMM7,%XMM7,%XMM1;(4) 
0x1983;:0;VADDPS	%XMM7,%XMM1,%XMM1;(4) 
0x1987;:0;VADDSS	%XMM17,%XMM1,%XMM17;(4) 
0x198d;:0;JE	19f7 <move_particles+0x347>;(4) 
0x198f;:0;NOP;(4) 
0x1990;:0;VMOVSS	(%R8,%RAX,4),%XMM8;  (2) 
0x1996;:0;VSUBSS	%XMM4,%XMM8,%XMM8;  (2) 
0x199a;:0;VMOVSS	(%R9,%RAX,4),%XMM7;  (2) 
0x19a0;:0;VSUBSS	%XMM3,%XMM7,%XMM7;  (2) 
0x19a4;:0;VMOVSS	(%RCX,%RAX,4),%XMM18;  (2) 
0x19ab;:0;VSUBSS	%XMM5,%XMM18,%XMM18;  (2) 
0x19b1;:0;LEA	0x1(%RAX),%RAX;  (2) 
0x19b5;:0;VMULSS	%XMM8,%XMM8,%XMM1;  (2) 
0x19ba;:0;CMP	%RAX,%RSI;  (2) 
0x19bd;:0;VMOVSS	%XMM7,%XMM7,%XMM2;  (2) 
0x19c1;:0;VFMADD132SS	%XMM7,%XMM11,%XMM2;  (2) 
0x19c6;:0;VFMADD231SS	%XMM18,%XMM18,%XMM1;  (2) 
0x19cc;:0;VADDSS	%XMM2,%XMM1,%XMM2;  (2) 
0x19d0;:0;VCVTSS2SD	%XMM2,%XMM2,%XMM2;  (2) 
0x19d4;:0;VSQRTSD	%XMM2,%XMM2,%XMM1;  (2) 
0x19d8;:0;VMULSD	%XMM2,%XMM1,%XMM1;  (2) 
0x19dc;:0;VCVTSD2SS	%XMM1,%XMM1,%XMM1;  (2) 
0x19e0;:0;VDIVSS	%XMM1,%XMM10,%XMM1;  (2) 
0x19e4;:0;VFMADD231SS	%XMM1,%XMM18,%XMM17;  (2) 
0x19ea;:0;VFMADD231SS	%XMM1,%XMM8,%XMM16;  (2) 
0x19f0;:0;VFMADD231SS	%XMM1,%XMM7,%XMM6;  (2) 
0x19f5;:0;JA	1990 <move_particles+0x2e0>;  (2) 
0x19f7;:0;MOV	-0x8(%RSP),%RAX;(4) 
0x19fc;:0;VFMADD213SS	(%RAX,%RDI,4),%XMM0,%XMM17;(4) 
0x1a03;:0;VMOVSS	%XMM17,(%RAX,%RDI,4);(4) 
0x1a0a;:0;LEA	0x1(%RDI),%RAX;(4) 
0x1a0e;:0;VFMADD213SS	(%R14,%RDI,4),%XMM0,%XMM16;(4) 
0x1a15;:0;VMOVSS	%XMM16,(%R14,%RDI,4);(4) 
0x1a1c;:0;CMP	%RAX,%RSI;(4) 
0x1a1f;:0;VFMADD213SS	(%R15,%RDI,4),%XMM0,%XMM6;(4) 
0x1a25;:0;VMOVSS	%XMM6,(%R15,%RDI,4);(4) 
0x1a2b;:0;JE	1a38 <move_particles+0x388>;(4) 
0x1a2d;:0;LEA	(%RAX),%RDI;(4) 
0x1a30;:0;JMP	1780 <move_particles+0xd0>;(4) 
0x1a35;:0;NOPL	(%RAX);
0x1a38;:0;MOV	-0x8(%RSP),%RSI;
0x1a3d;:0;XOR	%EAX,%EAX;
0x1a3f;:0;NOP;
0x1a40;:0;VMOVSS	(%RSI,%RAX,4),%XMM1;(3) 
0x1a45;:0;LEA	(%RAX),%RDX;(3) 
0x1a48;:0;VFMADD213SS	(%RCX,%RAX,4),%XMM0,%XMM1;(3) 
0x1a4e;:0;VMOVSS	%XMM1,(%RCX,%RAX,4);(3) 
0x1a53;:0;VMOVSS	(%R14,%RAX,4),%XMM1;(3) 
0x1a59;:0;CMP	%RDI,%RDX;(3) 
0x1a5c;:0;VFMADD213SS	(%R8,%RAX,4),%XMM0,%XMM1;(3) 
0x1a62;:0;VMOVSS	%XMM1,(%R8,%RAX,4);(3) 
0x1a68;:0;VMOVSS	(%R15,%RAX,4),%XMM1;(3) 
0x1a6e;:0;VFMADD213SS	(%R9,%RAX,4),%XMM0,%XMM1;(3) 
0x1a74;:0;VMOVSS	%XMM1,(%R9,%RAX,4);(3) 
0x1a7a;:0;LEA	0x1(%RAX),%RAX;(3) 
0x1a7e;:0;JNE	1a40 <move_particles+0x390>;(3) 
0x1a80;:0;LEA	-0x28(%RBP),%RSP;
0x1a84;:0;POP	%RBX;
0x1a85;:0;POP	%R12;
0x1a87;:0;POP	%R13;
0x1a89;:0;POP	%R14;
0x1a8b;:0;POP	%R15;
0x1a8d;:0;POP	%RBP;
0x1a8e;:0;RET;
0x1a8f;:0;RET;

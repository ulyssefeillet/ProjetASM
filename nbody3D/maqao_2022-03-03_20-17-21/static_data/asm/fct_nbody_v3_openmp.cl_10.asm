address;source_location;insn;indent
0x4013c0;:0;PUSH	%RBP;
0x4013c1;:0;PUSH	%R15;
0x4013c3;:0;PUSH	%R14;
0x4013c5;:0;PUSH	%R13;
0x4013c7;:0;PUSH	%R12;
0x4013c9;:0;PUSH	%RBX;
0x4013ca;:0;SUB	$0x28,%RSP;
0x4013ce;:0;MOV	%R9,%R13;
0x4013d1;:0;MOV	%RCX,%R14;
0x4013d4;:0;MOV	%RDX,%R15;
0x4013d7;:0;MOV	(%RDX),%RBX;
0x4013da;:0;SUB	$0x1,%RBX;
0x4013de;:0;JAE	4013e8 <.omp_outlined.+0x28>;
0x4013e0;:0;MOV	(%RDI),%R12D;
0x4013e3;:0;JMP	401802 <.omp_outlined.+0x442>;
0x4013e8;:0;MOVQ	$0,0x18(%RSP);
0x4013f1;:0;MOV	%RBX,0x8(%RSP);
0x4013f6;:0;MOVQ	$0x1,0x20(%RSP);
0x4013ff;:0;MOVL	$0,0x14(%RSP);
0x401407;:0;MOV	(%RDI),%R12D;
0x40140a;:0;SUB	$0x8,%RSP;
0x40140e;:0;LEA	0x28(%RSP),%RAX;
0x401413;:0;LEA	0x1c(%RSP),%RCX;
0x401418;:0;LEA	0x20(%RSP),%R8;
0x40141d;:0;LEA	0x10(%RSP),%R9;
0x401422;:0;MOV	$0x404098,%EDI;
0x401427;:0;MOV	%R12D,%ESI;
0x40142a;:0;MOV	$0x22,%EDX;
0x40142f;:0;PUSH	$0x1;
0x401431;:0;PUSH	$0x1;
0x401433;:0;PUSH	%RAX;
0x401434;:0;CALL	4010f0 <__kmpc_for_static_init_8u@plt>;
0x401439;:0;ADD	$0x20,%RSP;
0x40143d;:0;MOV	0x8(%RSP),%R8;
0x401442;:0;CMP	%RBX,%R8;
0x401445;:0;CMOVA	%RBX,%R8;
0x401449;:0;MOV	%R8,0x8(%RSP);
0x40144e;:0;MOV	0x18(%RSP),%RCX;
0x401453;:0;ADD	$0x1,%R8;
0x401457;:0;CMP	%R8,%RCX;
0x40145a;:0;JAE	4017f5 <.omp_outlined.+0x435>;
0x401460;:0;MOV	(%R15),%RDX;
0x401463;:0;TEST	%RDX,%RDX;
0x401466;:0;JE	4017f5 <.omp_outlined.+0x435>;
0x40146c;:0;MOV	(%R14),%RDI;
0x40146f;:0;MOV	0x18(%RDI),%R9;
0x401473;:0;MOV	0x20(%RDI),%R10;
0x401477;:0;MOV	0x28(%RDI),%R11;
0x40147b;:0;MOV	(%RDI),%RAX;
0x40147e;:0;MOV	0x8(%RDI),%RSI;
0x401482;:0;MOV	0x10(%RDI),%RDI;
0x401486;:0;MOV	%RDX,%RBP;
0x401489;:0;AND	$-0x20,%RBP;
0x40148d;:0;VMOVSS	0xb73(%RIP),%XMM8;
0x401495;:0;VMOVSS	0xb6f(%RIP),%XMM9;
0x40149d;:0;VBROADCASTSS	0xb61(%RIP),%ZMM24;
0x4014a7;:0;VBROADCASTSS	0xb5b(%RIP),%ZMM16;
0x4014b1;:0;JMP	401503 <.omp_outlined.+0x143>;
0x4014b3;:0;NOPW	%CS:(%RAX,%RAX,1);
0x4014bd;:0;NOPL	(%RAX);
0x4014c0;:0;VMOVSS	(%R13),%XMM2;(3) 
0x4014c6;:0;VFMADD213SS	(%R9,%RCX,4),%XMM7,%XMM2;(3) 
0x4014cc;:0;VMOVSS	%XMM2,(%R9,%RCX,4);(3) 
0x4014d2;:0;VMOVSS	(%R13),%XMM2;(3) 
0x4014d8;:0;VFMADD213SS	(%R10,%RCX,4),%XMM1,%XMM2;(3) 
0x4014de;:0;VMOVSS	%XMM2,(%R10,%RCX,4);(3) 
0x4014e4;:0;VMOVSS	(%R13),%XMM1;(3) 
0x4014ea;:0;VFMADD213SS	(%R11,%RCX,4),%XMM0,%XMM1;(3) 
0x4014f0;:0;VMOVSS	%XMM1,(%R11,%RCX,4);(3) 
0x4014f6;:0;ADD	$0x1,%RCX;(3) 
0x4014fa;:0;CMP	%R8,%RCX;(3) 
0x4014fd;:0;JAE	4017f5 <.omp_outlined.+0x435>;(3) 
0x401503;:0;CMP	$0x20,%RDX;(3) 
0x401507;:0;VMOVSS	(%RAX,%RCX,4),%XMM26;(3) 
0x40150e;:0;VMOVSS	(%RSI,%RCX,4),%XMM30;(3) 
0x401515;:0;VMOVSS	(%RDI,%RCX,4),%XMM31;(3) 
0x40151c;:0;JAE	401540 <.omp_outlined.+0x180>;(3) 
0x40151e;:0;VXORPS	%XMM7,%XMM7,%XMM7;(3) 
0x401522;:0;VXORPS	%XMM1,%XMM1,%XMM1;(3) 
0x401526;:0;VXORPS	%XMM0,%XMM0,%XMM0;(3) 
0x40152a;:0;XOR	%EBX,%EBX;(3) 
0x40152c;:0;JMP	401790 <.omp_outlined.+0x3d0>;(3) 
0x401531;:0;NOPW	%CS:(%RAX,%RAX,1);
0x40153b;:0;NOPL	(%RAX,%RAX,1);
0x401540;:0;VMOVAPS	%XMM9,%XMM3;(3) 
0x401544;:0;VMOVAPS	%XMM8,%XMM2;(3) 
0x401548;:0;VBROADCASTSS	%XMM26,%ZMM9;(3) 
0x40154e;:0;VBROADCASTSS	%XMM30,%ZMM10;(3) 
0x401554;:0;VBROADCASTSS	%XMM31,%ZMM11;(3) 
0x40155a;:0;VPXORD	%ZMM22,%ZMM22,%ZMM22;(3) 
0x401560;:0;MOV	$0,%EBX;(3) 
0x401565;:0;VPXORD	%ZMM23,%ZMM23,%ZMM23;(3) 
0x40156b;:0;VXORPS	%XMM13,%XMM13,%XMM13;(3) 
0x401570;:0;VXORPS	%XMM14,%XMM14,%XMM14;(3) 
0x401575;:0;VXORPS	%XMM0,%XMM0,%XMM0;(3) 
0x401579;:0;VXORPS	%XMM15,%XMM15,%XMM15;(3) 
0x40157e;:0;XCHG	%AX,%AX;(3) 
0x401580;:0;VMOVAPS	%ZMM14,%ZMM1;  (2) 
0x401586;:0;VMOVAPS	%ZMM13,%ZMM17;  (2) 
0x40158c;:0;VMOVDQA64	%ZMM23,%ZMM18;  (2) 
0x401592;:0;VMOVDQA64	%ZMM22,%ZMM19;  (2) 
0x401598;:0;VMOVUPS	(%RAX,%RBX,4),%ZMM7;  (2) 
0x40159f;:0;VMOVUPS	0x40(%RAX,%RBX,4),%ZMM8;  (2) 
0x4015a7;:0;VSUBPS	%ZMM9,%ZMM7,%ZMM22;  (2) 
0x4015ad;:0;VSUBPS	%ZMM9,%ZMM8,%ZMM23;  (2) 
0x4015b3;:0;VMOVUPS	(%RSI,%RBX,4),%ZMM13;  (2) 
0x4015ba;:0;VMOVUPS	0x40(%RSI,%RBX,4),%ZMM14;  (2) 
0x4015c2;:0;VSUBPS	%ZMM10,%ZMM13,%ZMM13;  (2) 
0x4015c8;:0;VSUBPS	%ZMM10,%ZMM14,%ZMM14;  (2) 
0x4015ce;:0;VMOVUPS	(%RDI,%RBX,4),%ZMM20;  (2) 
0x4015d5;:0;VMOVUPS	0x40(%RDI,%RBX,4),%ZMM21;  (2) 
0x4015dd;:0;VSUBPS	%ZMM11,%ZMM20,%ZMM20;  (2) 
0x4015e3;:0;VSUBPS	%ZMM11,%ZMM21,%ZMM21;  (2) 
0x4015e9;:0;VMOVAPS	%ZMM22,%ZMM7;  (2) 
0x4015ef;:0;VFMADD213PS	%ZMM24,%ZMM22,%ZMM7;  (2) 
0x4015f5;:0;VMOVAPS	%ZMM23,%ZMM8;  (2) 
0x4015fb;:0;VFMADD213PS	%ZMM24,%ZMM23,%ZMM8;  (2) 
0x401601;:0;VFMADD231PS	%ZMM13,%ZMM13,%ZMM7;  (2) 
0x401607;:0;VFMADD231PS	%ZMM14,%ZMM14,%ZMM8;  (2) 
0x40160d;:0;VFMADD231PS	%ZMM20,%ZMM20,%ZMM7;  (2) 
0x401613;:0;VFMADD231PS	%ZMM21,%ZMM21,%ZMM8;  (2) 
0x401619;:0;VEXTRACTF64X4	$0x1,%ZMM7,%YMM12;  (2) 
0x401620;:0;VCVTPS2PD	%YMM12,%ZMM12;  (2) 
0x401626;:0;VCVTPS2PD	%YMM7,%ZMM7;  (2) 
0x40162c;:0;VSQRTPD	%ZMM7,%ZMM25;  (2) 
0x401632;:0;VEXTRACTF64X4	$0x1,%ZMM8,%YMM4;  (2) 
0x401639;:0;VSQRTPD	%ZMM12,%ZMM27;  (2) 
0x40163f;:0;VCVTPS2PD	%YMM8,%ZMM8;  (2) 
0x401645;:0;VSQRTPD	%ZMM8,%ZMM28;  (2) 
0x40164b;:0;VCVTPS2PD	%YMM4,%ZMM4;  (2) 
0x401651;:0;VSQRTPD	%ZMM4,%ZMM29;  (2) 
0x401657;:0;VMULPD	%ZMM12,%ZMM27,%ZMM12;  (2) 
0x40165d;:0;VMULPD	%ZMM7,%ZMM25,%ZMM7;  (2) 
0x401663;:0;VCVTPD2PS	%ZMM7,%YMM7;  (2) 
0x401669;:0;VCVTPD2PS	%ZMM12,%YMM12;  (2) 
0x40166f;:0;VINSERTF64X4	$0x1,%YMM12,%ZMM7,%ZMM7;  (2) 
0x401676;:0;VRCP14PS	%ZMM7,%ZMM12;  (2) 
0x40167c;:0;VMULPD	%ZMM4,%ZMM29,%ZMM4;  (2) 
0x401682;:0;VMULPD	%ZMM8,%ZMM28,%ZMM8;  (2) 
0x401688;:0;VCVTPD2PS	%ZMM8,%YMM8;  (2) 
0x40168e;:0;VCVTPD2PS	%ZMM4,%YMM4;  (2) 
0x401694;:0;VINSERTF64X4	$0x1,%YMM4,%ZMM8,%ZMM4;  (2) 
0x40169b;:0;VRCP14PS	%ZMM4,%ZMM8;  (2) 
0x4016a1;:0;VFNMADD213PS	%ZMM16,%ZMM12,%ZMM7;  (2) 
0x4016a7;:0;VFMADD132PS	%ZMM12,%ZMM12,%ZMM7;  (2) 
0x4016ad;:0;VFNMADD213PS	%ZMM16,%ZMM8,%ZMM4;  (2) 
0x4016b3;:0;VFMADD132PS	%ZMM8,%ZMM8,%ZMM4;  (2) 
0x4016b9;:0;VFMADD213PS	%ZMM19,%ZMM7,%ZMM22;  (2) 
0x4016bf;:0;VFMADD213PS	%ZMM18,%ZMM4,%ZMM23;  (2) 
0x4016c5;:0;VFMADD213PS	%ZMM17,%ZMM7,%ZMM13;  (2) 
0x4016cb;:0;VFMADD213PS	%ZMM1,%ZMM4,%ZMM14;  (2) 
0x4016d1;:0;VFMADD231PS	%ZMM7,%ZMM20,%ZMM0;  (2) 
0x4016d7;:0;VFMADD231PS	%ZMM4,%ZMM21,%ZMM15;  (2) 
0x4016dd;:0;ADD	$0x20,%RBX;  (2) 
0x4016e1;:0;CMP	%RBX,%RBP;  (2) 
0x4016e4;:0;JNE	401580 <.omp_outlined.+0x1c0>;  (2) 
0x4016ea;:0;CMP	%RBP,%RDX;(3) 
0x4016ed;:0;VADDPS	%ZMM0,%ZMM15,%ZMM0;(3) 
0x4016f3;:0;VEXTRACTF64X4	$0x1,%ZMM0,%YMM1;(3) 
0x4016fa;:0;VADDPS	%ZMM1,%ZMM0,%ZMM0;(3) 
0x401700;:0;VEXTRACTF128	$0x1,%YMM0,%XMM1;(3) 
0x401706;:0;VADDPS	%XMM1,%XMM0,%XMM0;(3) 
0x40170a;:0;VPERMILPD	$0x1,%XMM0,%XMM1;(3) 
0x401710;:0;VADDPS	%XMM1,%XMM0,%XMM0;(3) 
0x401714;:0;VMOVSHDUP	%XMM0,%XMM1;(3) 
0x401718;:0;VADDSS	%XMM1,%XMM0,%XMM0;(3) 
0x40171c;:0;VADDPS	%ZMM13,%ZMM14,%ZMM1;(3) 
0x401722;:0;VEXTRACTF64X4	$0x1,%ZMM1,%YMM4;(3) 
0x401729;:0;VADDPS	%ZMM4,%ZMM1,%ZMM1;(3) 
0x40172f;:0;VEXTRACTF128	$0x1,%YMM1,%XMM4;(3) 
0x401735;:0;VADDPS	%XMM4,%XMM1,%XMM1;(3) 
0x401739;:0;VPERMILPD	$0x1,%XMM1,%XMM4;(3) 
0x40173f;:0;VADDPS	%XMM4,%XMM1,%XMM1;(3) 
0x401743;:0;VMOVSHDUP	%XMM1,%XMM4;(3) 
0x401747;:0;VADDSS	%XMM4,%XMM1,%XMM1;(3) 
0x40174b;:0;VADDPS	%ZMM22,%ZMM23,%ZMM4;(3) 
0x401751;:0;VEXTRACTF64X4	$0x1,%ZMM4,%YMM7;(3) 
0x401758;:0;VADDPS	%ZMM7,%ZMM4,%ZMM4;(3) 
0x40175e;:0;VEXTRACTF128	$0x1,%YMM4,%XMM7;(3) 
0x401764;:0;VADDPS	%XMM7,%XMM4,%XMM4;(3) 
0x401768;:0;VPERMILPD	$0x1,%XMM4,%XMM7;(3) 
0x40176e;:0;VADDPS	%XMM7,%XMM4,%XMM4;(3) 
0x401772;:0;VMOVSHDUP	%XMM4,%XMM7;(3) 
0x401776;:0;VADDSS	%XMM7,%XMM4,%XMM7;(3) 
0x40177a;:0;MOV	%RBP,%RBX;(3) 
0x40177d;:0;VMOVAPS	%XMM2,%XMM8;(3) 
0x401781;:0;VMOVAPS	%XMM3,%XMM9;(3) 
0x401785;:0;JE	4014c0 <.omp_outlined.+0x100>;(3) 
0x40178b;:0;NOPL	(%RAX,%RAX,1);(3) 
0x401790;:0;VMOVSS	(%RAX,%RBX,4),%XMM4;  (4) 
0x401795;:0;VMOVSS	(%RSI,%RBX,4),%XMM5;  (4) 
0x40179a;:0;VSUBSS	%XMM26,%XMM4,%XMM2;  (4) 
0x4017a0;:0;VMOVSS	(%RDI,%RBX,4),%XMM6;  (4) 
0x4017a5;:0;VSUBSS	%XMM31,%XMM6,%XMM6;  (4) 
0x4017ab;:0;VMOVAPS	%XMM2,%XMM4;  (4) 
0x4017af;:0;VFMADD213SS	%XMM8,%XMM2,%XMM4;  (4) 
0x4017b4;:0;VSUBSS	%XMM30,%XMM5,%XMM5;  (4) 
0x4017ba;:0;VFMADD231SS	%XMM5,%XMM5,%XMM4;  (4) 
0x4017bf;:0;VFMADD231SS	%XMM6,%XMM6,%XMM4;  (4) 
0x4017c4;:0;VCVTSS2SD	%XMM4,%XMM4,%XMM4;  (4) 
0x4017c8;:0;VSQRTSD	%XMM4,%XMM4,%XMM3;  (4) 
0x4017cc;:0;VMULSD	%XMM4,%XMM3,%XMM3;  (4) 
0x4017d0;:0;VCVTSD2SS	%XMM3,%XMM3,%XMM3;  (4) 
0x4017d4;:0;VDIVSS	%XMM3,%XMM9,%XMM3;  (4) 
0x4017d8;:0;VFMADD231SS	%XMM2,%XMM3,%XMM7;  (4) 
0x4017dd;:0;VFMADD231SS	%XMM5,%XMM3,%XMM1;  (4) 
0x4017e2;:0;VFMADD231SS	%XMM3,%XMM6,%XMM0;  (4) 
0x4017e7;:0;ADD	$0x1,%RBX;  (4) 
0x4017eb;:0;CMP	%RBX,%RDX;  (4) 
0x4017ee;:0;JNE	401790 <.omp_outlined.+0x3d0>;  (4) 
0x4017f0;:0;JMP	4014c0 <.omp_outlined.+0x100>;(3) 
0x4017f5;:0;MOV	$0x404098,%EDI;
0x4017fa;:0;MOV	%R12D,%ESI;
0x4017fd;:0;CALL	4010e0 <__kmpc_for_static_fini@plt>;
0x401802;:0;MOV	$0x4040b0,%EDI;
0x401807;:0;MOV	%R12D,%ESI;
0x40180a;:0;CALL	401070 <__kmpc_barrier@plt>;
0x40180f;:0;MOV	(%R15),%RBX;
0x401812;:0;SUB	$0x1,%RBX;
0x401816;:0;JB	4019c8 <.omp_outlined.+0x608>;
0x40181c;:0;MOVQ	$0,0x18(%RSP);
0x401825;:0;MOV	%RBX,0x8(%RSP);
0x40182a;:0;MOVQ	$0x1,0x20(%RSP);
0x401833;:0;MOVL	$0,0x14(%RSP);
0x40183b;:0;SUB	$0x8,%RSP;
0x40183f;:0;LEA	0x28(%RSP),%RAX;
0x401844;:0;LEA	0x1c(%RSP),%RCX;
0x401849;:0;LEA	0x20(%RSP),%R8;
0x40184e;:0;LEA	0x10(%RSP),%R9;
0x401853;:0;MOV	$0x404098,%EDI;
0x401858;:0;MOV	%R12D,%ESI;
0x40185b;:0;MOV	$0x22,%EDX;
0x401860;:0;PUSH	$0x1;
0x401862;:0;PUSH	$0x1;
0x401864;:0;PUSH	%RAX;
0x401865;:0;CALL	4010f0 <__kmpc_for_static_init_8u@plt>;
0x40186a;:0;ADD	$0x20,%RSP;
0x40186e;:0;MOV	0x8(%RSP),%R9;
0x401873;:0;CMP	%RBX,%R9;
0x401876;:0;CMOVA	%RBX,%R9;
0x40187a;:0;MOV	%R9,0x8(%RSP);
0x40187f;:0;MOV	0x18(%RSP),%R10;
0x401884;:0;LEA	0x1(%R9),%R8;
0x401888;:0;CMP	%R8,%R10;
0x40188b;:0;JAE	4019bb <.omp_outlined.+0x5fb>;
0x401891;:0;MOV	(%R14),%RAX;
0x401894;:0;MOV	0x18(%RAX),%RCX;
0x401898;:0;MOV	(%RAX),%RDX;
0x40189b;:0;MOV	0x8(%RAX),%RSI;
0x40189f;:0;MOV	0x20(%RAX),%RDI;
0x4018a3;:0;MOV	0x28(%RAX),%RBP;
0x4018a7;:0;MOV	0x10(%RAX),%RBX;
0x4018ab;:0;MOV	%R9D,%EAX;
0x4018ae;:0;SUB	%R10D,%EAX;
0x4018b1;:0;ADD	$0x1,%EAX;
0x4018b4;:0;TEST	$0x1,%AL;
0x4018b6;:0;MOV	%R10,%RAX;
0x4018b9;:0;JE	401908 <.omp_outlined.+0x548>;
0x4018bb;:0;VMOVSS	(%R13),%XMM0;
0x4018c1;:0;VMOVSS	(%RCX,%R10,4),%XMM1;
0x4018c7;:0;VFMADD213SS	(%RDX,%R10,4),%XMM0,%XMM1;
0x4018cd;:0;VMOVSS	%XMM1,(%RDX,%R10,4);
0x4018d3;:0;VMOVSS	(%R13),%XMM0;
0x4018d9;:0;VMOVSS	(%RDI,%R10,4),%XMM1;
0x4018df;:0;VFMADD213SS	(%RSI,%R10,4),%XMM0,%XMM1;
0x4018e5;:0;VMOVSS	%XMM1,(%RSI,%R10,4);
0x4018eb;:0;VMOVSS	(%R13),%XMM0;
0x4018f1;:0;VMOVSS	(%RBP,%R10,4),%XMM1;
0x4018f8;:0;VFMADD213SS	(%RBX,%R10,4),%XMM0,%XMM1;
0x4018fe;:0;VMOVSS	%XMM1,(%RBX,%R10,4);
0x401904;:0;LEA	0x1(%R10),%RAX;
0x401908;:0;CMP	%R10,%R9;
0x40190b;:0;JE	4019bb <.omp_outlined.+0x5fb>;
0x401911;:0;NOPW	%CS:(%RAX,%RAX,1);
0x40191b;:0;NOPL	(%RAX,%RAX,1);
0x401920;:0;VMOVSS	(%R13),%XMM0;(1) 
0x401926;:0;VMOVSS	(%RCX,%RAX,4),%XMM1;(1) 
0x40192b;:0;VFMADD213SS	(%RDX,%RAX,4),%XMM0,%XMM1;(1) 
0x401931;:0;VMOVSS	%XMM1,(%RDX,%RAX,4);(1) 
0x401936;:0;VMOVSS	(%R13),%XMM0;(1) 
0x40193c;:0;VMOVSS	(%RDI,%RAX,4),%XMM1;(1) 
0x401941;:0;VFMADD213SS	(%RSI,%RAX,4),%XMM0,%XMM1;(1) 
0x401947;:0;VMOVSS	%XMM1,(%RSI,%RAX,4);(1) 
0x40194c;:0;VMOVSS	(%R13),%XMM0;(1) 
0x401952;:0;VMOVSS	(%RBP,%RAX,4),%XMM1;(1) 
0x401958;:0;VFMADD213SS	(%RBX,%RAX,4),%XMM0,%XMM1;(1) 
0x40195e;:0;VMOVSS	%XMM1,(%RBX,%RAX,4);(1) 
0x401963;:0;VMOVSS	(%R13),%XMM0;(1) 
0x401969;:0;VMOVSS	0x4(%RCX,%RAX,4),%XMM1;(1) 
0x40196f;:0;VFMADD213SS	0x4(%RDX,%RAX,4),%XMM0,%XMM1;(1) 
0x401976;:0;VMOVSS	%XMM1,0x4(%RDX,%RAX,4);(1) 
0x40197c;:0;VMOVSS	(%R13),%XMM0;(1) 
0x401982;:0;VMOVSS	0x4(%RDI,%RAX,4),%XMM1;(1) 
0x401988;:0;VFMADD213SS	0x4(%RSI,%RAX,4),%XMM0,%XMM1;(1) 
0x40198f;:0;VMOVSS	%XMM1,0x4(%RSI,%RAX,4);(1) 
0x401995;:0;VMOVSS	(%R13),%XMM0;(1) 
0x40199b;:0;VMOVSS	0x4(%RBP,%RAX,4),%XMM1;(1) 
0x4019a1;:0;VFMADD213SS	0x4(%RBX,%RAX,4),%XMM0,%XMM1;(1) 
0x4019a8;:0;VMOVSS	%XMM1,0x4(%RBX,%RAX,4);(1) 
0x4019ae;:0;ADD	$0x2,%RAX;(1) 
0x4019b2;:0;CMP	%R8,%RAX;(1) 
0x4019b5;:0;JB	401920 <.omp_outlined.+0x560>;(1) 
0x4019bb;:0;MOV	$0x404098,%EDI;
0x4019c0;:0;MOV	%R12D,%ESI;
0x4019c3;:0;CALL	4010e0 <__kmpc_for_static_fini@plt>;
0x4019c8;:0;MOV	$0x4040b0,%EDI;
0x4019cd;:0;MOV	%R12D,%ESI;
0x4019d0;:0;CALL	401070 <__kmpc_barrier@plt>;
0x4019d5;:0;ADD	$0x28,%RSP;
0x4019d9;:0;POP	%RBX;
0x4019da;:0;POP	%R12;
0x4019dc;:0;POP	%R13;
0x4019de;:0;POP	%R14;
0x4019e0;:0;POP	%R15;
0x4019e2;:0;POP	%RBP;
0x4019e3;:0;RET;
0x4019e4;:0;NOPW	%CS:(%RAX,%RAX,1);
0x4019ee;:0;XCHG	%AX,%AX;

address;source_location;insn;indent
0x402820;:0;PUSH	%RBP;
0x402821;:0;MOV	%RSP,%RBP;
0x402824;:0;AND	$-0x40,%RSP;
0x402828;:0;SUB	$0x80,%RSP;
0x40282f;:0;MOV	%R12,0x18(%RSP);
0x402834;:0;MOV	%RSI,%R12;
0x402837;:0;MOV	%RBX,0x38(%RSP);
0x40283c;:0;VMOVAPS	%XMM0,%XMM3;
0x402840;:0;MOV	%R15,0x30(%RSP);
0x402845;:0;MOV	%DL,%R11B;
0x402848;:0;MOV	%R14,0x28(%RSP);
0x40284d;:0;MOV	%RDI,%RBX;
0x402850;:0;MOV	%R13,0x20(%RSP);
0x402855;:0;XOR	%EAX,%EAX;
0x402857;:0;VMOVSS	%XMM3,0x40(%RSP);
0x40285d;:0;TEST	%R12,%R12;
0x402860;:0;JBE	402ef4 <move_particles+0x6d4>;
0x402866;:0;MOV	0x10(%RBX),%RDX;
0x40286a;:0;MOV	%RBX,0x8(%RSP);
0x40286f;:0;MOV	%R12,%R13;
0x402872;:0;MOV	%R11B,0x10(%RSP);
0x402877;:0;AND	$0xf,%R13;
0x40287b;:0;MOV	%R12,%R15;
0x40287e;:0;VPXORD	%ZMM16,%ZMM16,%ZMM16;
0x402884;:0;MOV	%RDX,%R14;
0x402887;:0;NEG	%R13;
0x40288a;:0;MOV	0x18(%RBX),%RDI;
0x40288e;:0;MOV	0x20(%RBX),%R8;
0x402892;:0;AND	$0x3f,%R14;
0x402896;:0;MOV	%R14,0x50(%RSP);
0x40289b;:0;MOV	%R14,%RSI;
0x40289e;:0;ADD	%R12,%R13;
0x4028a1;:0;MOV	%R13,0x48(%RSP);
0x4028a6;:0;AND	$0x3,%RSI;
0x4028aa;:0;MOV	%RSI,0x58(%RSP);
0x4028af;:0;MOV	%R14,%RSI;
0x4028b2;:0;AND	$-0x10,%R15;
0x4028b6;:0;MOV	%R15,(%RSP);
0x4028ba;:0;NEG	%RSI;
0x4028bd;:0;MOV	0x28(%RBX),%R10;
0x4028c1;:0;ADD	$0x40,%RSI;
0x4028c5;:0;MOV	(%RBX),%R9;
0x4028c8;:0;MOV	0x8(%RBX),%RCX;
0x4028cc;:0;SHR	$0x2,%RSI;
0x4028d0;:0;VMOVUPS	0xe866(%RIP),%ZMM20;
0x4028da;:0;VMOVDQU32	0xe91c(%RIP),%ZMM19;
0x4028e4;:0;VMOVDQU32	0xe952(%RIP),%ZMM18;
0x4028ee;:0;VMOVUPS	0xe888(%RIP),%ZMM17;
0x4028f8;:0;VMOVAPS	%ZMM16,%ZMM2;(3) 
0x4028fe;:0;VMOVAPS	%ZMM2,%ZMM1;(3) 
0x402904;:0;VMOVAPS	%ZMM1,%ZMM0;(3) 
0x40290a;:0;CMP	$0x960,%R12;(3) 
0x402911;:0;JB	402ee8 <move_particles+0x6c8>;(3) 
0x402917;:0;MOV	0x50(%RSP),%R11;(3) 
0x40291c;:0;TEST	%R11,%R11;(3) 
0x40291f;:0;JE	402aa3 <move_particles+0x283>;(3) 
0x402925;:0;CMPQ	$0,0x58(%RSP);(3) 
0x40292b;:0;JNE	402ee0 <move_particles+0x6c0>;(3) 
0x402931;:0;CMP	%RSI,%R12;(3) 
0x402934;:0;MOV	%RSI,%R11;(3) 
0x402937;:0;CMOVB	%R12,%R11;(3) 
0x40293b;:0;MOV	%R12,%R15;(3) 
0x40293e;:0;SUB	%R11,%R15;(3) 
0x402941;:0;AND	$0xf,%R15;(3) 
0x402945;:0;NEG	%R15;(3) 
0x402948;:0;ADD	%R12,%R15;(3) 
0x40294b;:0;CMP	$0x1,%R11;(3) 
0x40294f;:0;JB	402aa8 <move_particles+0x288>;(3) 
0x402955;:0;VMOVAPS	%ZMM19,%ZMM28;
0x40295b;:0;VMOVAPS	%ZMM18,%ZMM26;
0x402961;:0;VPBROADCASTQ	%R11,%ZMM25;
0x402967;:0;VBROADCASTSS	(%R9,%RAX,4),%ZMM24;
0x40296e;:0;XOR	%EBX,%EBX;
0x402970;:0;VBROADCASTSS	(%RCX,%RAX,4),%ZMM27;
0x402977;:0;VBROADCASTSS	(%RDX,%RAX,4),%ZMM29;
0x40297e;:0;VPCMPNLEUQ	%ZMM28,%ZMM25,%K1;
0x402985;:0;VPCMPNLEUQ	%ZMM26,%ZMM25,%K0;
0x40298c;:0;KUNPCKBW	%K1,%K0,%K2;
0x402990;:0;VPADDQ	%ZMM20,%ZMM28,%ZMM28;
0x402996;:0;VPADDQ	%ZMM20,%ZMM26,%ZMM26;
0x40299c;:0;VMOVUPS	(%R9,%RBX,4),%ZMM30{%K2}{z};
0x4029a3;:0;VMOVUPS	(%RCX,%RBX,4),%ZMM31{%K2}{z};
0x4029aa;:0;VSUBPS	%ZMM24,%ZMM30,%ZMM23;
0x4029b0;:0;VMOVAPS	%ZMM17,%ZMM30;
0x4029b6;:0;VMOVUPS	(%RDX,%RBX,4),%ZMM21{%K2}{z};
0x4029bd;:0;ADD	$0x10,%RBX;
0x4029c1;:0;VSUBPS	%ZMM27,%ZMM31,%ZMM22;
0x4029c7;:0;VFMADD231PS	%ZMM23,%ZMM23,%ZMM30;
0x4029cd;:0;VSUBPS	%ZMM29,%ZMM21,%ZMM21;
0x4029d3;:0;VFMADD231PS	%ZMM22,%ZMM22,%ZMM30;
0x4029d9;:0;VFMADD231PS	%ZMM21,%ZMM21,%ZMM30;
0x4029df;:0;VCVTPS2PD	%YMM30,%ZMM5;
0x4029e5;:0;VEXTRACTF64X4	$0x1,%ZMM30,%YMM30;
0x4029ec;:0;VMOVAPS	%ZMM5,%ZMM4;
0x4029f2;:0;VCVTPS2PD	%YMM30,%ZMM7;
0x4029f8;:0;(bad);
0x4029f9;:0;(bad);
0x4029fa;:0;STD;
0x4029fb;:0;POP	%RAX;
0x4029fc;:0;INT	$0x3;
0x4029fd;:0;CMC;
0x4029fe;:0;VMOVAPS	%ZMM7,%ZMM6;
0x402a04;:0;VMULPD	{rn-sae},%ZMM5,%ZMM30,%ZMM31;
0x402a0a;:0;VSCALEFPD	0xe89c(%RIP){1to8},%ZMM30,%ZMM30;
0x402a14;:0;VFNMADD231PD	{rn-sae},%ZMM31,%ZMM31,%ZMM4;
0x402a1a;:0;VFMADD213PD	%ZMM31,%ZMM30,%ZMM4;
0x402a20;:0;(bad);
0x402a21;:0;(bad);
0x402a22;:0;STD;
0x402a23;:0;POP	%RAX;
0x402a24;:0;INT	$0x3;
0x402a25;:0;MULL	-0xd(%RDX);
0x402a28;:0;(bad);
0x402a29;:0;POP	%RAX;
0x402a2a;:0;PUSH	%RSP;
0x402a2b;:0;AND	$0xe887,%EAX;
0x402a30;:0;JO	402a94 <move_particles+0x274>;
0x402a32;:0;(bad);
0x402a33;:0;LEA	(%RAX),%EDX;
0x402a35;:0;POP	%RCX;
0x402a36;:0;JMP	0x62(%RDX);
0x402a39;:0;LEA	0x2c(%RAX),%EDX;
0x402a3c;:0;XOR	$0xe86f,%EAX;
0x402a41;:0;VFNMADD231PD	{rn-sae},%ZMM31,%ZMM31,%ZMM6;
0x402a47;:0;VFMADD213PD	%ZMM31,%ZMM30,%ZMM6;
0x402a4d;:0;VMULPD	%ZMM5,%ZMM4,%ZMM30;
0x402a53;:0;VFIXUPIMMPD	$0x70,0xe85a(%RIP){1to8},%ZMM7,%ZMM6;
0x402a5e;:0;VCVTPD2PS	%ZMM30,%YMM30;
0x402a64;:0;VMULPD	%ZMM7,%ZMM6,%ZMM31;
0x402a6a;:0;VCVTPD2PS	%ZMM31,%YMM8;
0x402a70;:0;VINSERTF64X4	$0x1,%YMM8,%ZMM30,%ZMM30;
0x402a77;:0;VRCP28PS	%ZMM30,%ZMM30;
0x402a7d;:0;VFMADD231PS	%ZMM23,%ZMM30,%ZMM2{%K2};
0x402a83;:0;VFMADD231PS	%ZMM22,%ZMM30,%ZMM1{%K2};
0x402a89;:0;VFMADD231PS	%ZMM21,%ZMM30,%ZMM0{%K2};
0x402a8f;:0;CMP	%R11,%RBX;
0x402a92;:0;JB	40297e <move_particles+0x15e>;
0x402a98;:0;CMP	%R11,%R12;
0x402a9b;:0;JE	402d29 <move_particles+0x509>;
0x402aa1;:0;JMP	402aa8 <move_particles+0x288>;
0x402aa3;:0;MOV	0x48(%RSP),%R15;(3) 
0x402aa8;:0;LEA	0x10(%R11),%RBX;(3) 
0x402aac;:0;CMP	%RBX,%R15;(3) 
0x402aaf;:0;JB	402bc6 <move_particles+0x3a6>;(3) 
0x402ab5;:0;VBROADCASTSS	(%R9,%RAX,4),%ZMM24;(3) 
0x402abc;:0;VBROADCASTSS	(%RCX,%RAX,4),%ZMM25;(3) 
0x402ac3;:0;VBROADCASTSS	(%RDX,%RAX,4),%ZMM26;(3) 
0x402aca;:0;VMOVUPS	(%R9,%R11,4),%ZMM27;  (4) 
0x402ad1;:0;VMOVUPS	(%RCX,%R11,4),%ZMM28;  (4) 
0x402ad8;:0;VMOVAPS	%ZMM17,%ZMM30;  (4) 
0x402ade;:0;VSUBPS	%ZMM24,%ZMM27,%ZMM23;  (4) 
0x402ae4;:0;VSUBPS	%ZMM25,%ZMM28,%ZMM22;  (4) 
0x402aea;:0;VMOVUPS	(%RDX,%R11,4),%ZMM29;  (4) 
0x402af1;:0;ADD	$0x10,%R11;  (4) 
0x402af5;:0;VFMADD231PS	%ZMM23,%ZMM23,%ZMM30;  (4) 
0x402afb;:0;VSUBPS	%ZMM26,%ZMM29,%ZMM21;  (4) 
0x402b01;:0;VFMADD231PS	%ZMM22,%ZMM22,%ZMM30;  (4) 
0x402b07;:0;VFMADD231PS	%ZMM21,%ZMM21,%ZMM30;  (4) 
0x402b0d;:0;VCVTPS2PD	%YMM30,%ZMM28;  (4) 
0x402b13;:0;VEXTRACTF64X4	$0x1,%ZMM30,%YMM31;  (4) 
0x402b1a;:0;(bad);  (4) 
0x402b1b;:0;ADD	%CH,%BH;  (4) 
0x402b1d;:0;POP	%RAX;  (4) 
0x402b1e;:0;INT	$0x3;  (4) 
0x402b1f;:0;HLT;  (4) 
0x402b20;:0;VCVTPS2PD	%YMM31,%ZMM4;  (4) 
0x402b26;:0;VMOVAPS	%ZMM28,%ZMM27;  (4) 
0x402b2c;:0;VMOVAPS	%ZMM4,%ZMM29;  (4) 
0x402b32;:0;VMULPD	{rn-sae},%ZMM28,%ZMM30,%ZMM31;  (4) 
0x402b38;:0;VSCALEFPD	0xe76e(%RIP){1to8},%ZMM30,%ZMM30;  (4) 
0x402b42;:0;VFNMADD231PD	{rn-sae},%ZMM31,%ZMM31,%ZMM27;  (4) 
0x402b48;:0;VFMADD213PD	%ZMM31,%ZMM30,%ZMM27;  (4) 
0x402b4e;:0;(bad);  (4) 
0x402b4f;:0;(bad);  (4) 
0x402b50;:0;STD;  (4) 
0x402b51;:0;POP	%RAX;  (4) 
0x402b52;:0;INT	$0x3;  (4) 
0x402b53;:0;HLT;  (4) 
0x402b54;:0;VFIXUPIMMPD	$0x70,0xe759(%RIP){1to8},%ZMM28,%ZMM27;  (4) 
0x402b5f;:0;VMULPD	{rn-sae},%ZMM4,%ZMM30,%ZMM31;  (4) 
0x402b65;:0;VSCALEFPD	0xe741(%RIP){1to8},%ZMM30,%ZMM30;  (4) 
0x402b6f;:0;VMULPD	%ZMM28,%ZMM27,%ZMM27;  (4) 
0x402b75;:0;VFNMADD231PD	{rn-sae},%ZMM31,%ZMM31,%ZMM29;  (4) 
0x402b7b;:0;VCVTPD2PS	%ZMM27,%YMM27;  (4) 
0x402b81;:0;VFMADD213PD	%ZMM31,%ZMM30,%ZMM29;  (4) 
0x402b87;:0;VFIXUPIMMPD	$0x70,0xe726(%RIP){1to8},%ZMM4,%ZMM29;  (4) 
0x402b92;:0;VMULPD	%ZMM4,%ZMM29,%ZMM28;  (4) 
0x402b98;:0;VCVTPD2PS	%ZMM28,%YMM5;  (4) 
0x402b9e;:0;VINSERTF64X4	$0x1,%YMM5,%ZMM27,%ZMM27;  (4) 
0x402ba5;:0;VRCP28PS	%ZMM27,%ZMM27;  (4) 
0x402bab;:0;VFMADD231PS	%ZMM23,%ZMM27,%ZMM2;  (4) 
0x402bb1;:0;VFMADD231PS	%ZMM22,%ZMM27,%ZMM1;  (4) 
0x402bb7;:0;VFMADD231PS	%ZMM21,%ZMM27,%ZMM0;  (4) 
0x402bbd;:0;CMP	%R15,%R11;  (4) 
0x402bc0;:0;JB	402aca <move_particles+0x2aa>;  (4) 
0x402bc6;:0;LEA	0x1(%R15),%RBX;(3) 
0x402bca;:0;CMP	%R12,%RBX;(3) 
0x402bcd;:0;JA	402d29 <move_particles+0x509>;(3) 
0x402bd3;:0;MOV	%R12,%R11;
0x402bd6;:0;VMOVAPS	%ZMM19,%ZMM28;
0x402bdc;:0;VMOVAPS	%ZMM18,%ZMM26;
0x402be2;:0;VBROADCASTSS	(%R9,%RAX,4),%ZMM25;
0x402be9;:0;VBROADCASTSS	(%RCX,%RAX,4),%ZMM24;
0x402bf0;:0;XOR	%EBX,%EBX;
0x402bf2;:0;SUB	%R15,%R11;
0x402bf5;:0;VBROADCASTSS	(%RDX,%RAX,4),%ZMM27;
0x402bfc;:0;VPBROADCASTQ	%R11,%ZMM29;
0x402c02;:0;LEA	(%R9,%R15,4),%R13;
0x402c06;:0;LEA	(%RCX,%R15,4),%R14;
0x402c0a;:0;LEA	(%RDX,%R15,4),%R15;
0x402c0e;:0;VPCMPNLEUQ	%ZMM28,%ZMM29,%K1;
0x402c15;:0;VPCMPNLEUQ	%ZMM26,%ZMM29,%K0;
0x402c1c;:0;KUNPCKBW	%K1,%K0,%K2;
0x402c20;:0;VPADDQ	%ZMM20,%ZMM28,%ZMM28;
0x402c26;:0;VPADDQ	%ZMM20,%ZMM26,%ZMM26;
0x402c2c;:0;VMOVUPS	(%R13,%RBX,4),%ZMM30{%K2}{z};
0x402c34;:0;VMOVUPS	(%R14,%RBX,4),%ZMM31{%K2}{z};
0x402c3b;:0;VSUBPS	%ZMM25,%ZMM30,%ZMM23;
0x402c41;:0;VMOVAPS	%ZMM17,%ZMM30;
0x402c47;:0;VMOVUPS	(%R15,%RBX,4),%ZMM21{%K2}{z};
0x402c4e;:0;ADD	$0x10,%RBX;
0x402c52;:0;VSUBPS	%ZMM24,%ZMM31,%ZMM22;
0x402c58;:0;VFMADD231PS	%ZMM23,%ZMM23,%ZMM30;
0x402c5e;:0;VSUBPS	%ZMM27,%ZMM21,%ZMM21;
0x402c64;:0;VFMADD231PS	%ZMM22,%ZMM22,%ZMM30;
0x402c6a;:0;VFMADD231PS	%ZMM21,%ZMM21,%ZMM30;
0x402c70;:0;VCVTPS2PD	%YMM30,%ZMM5;
0x402c76;:0;VEXTRACTF64X4	$0x1,%ZMM30,%YMM30;
0x402c7d;:0;VMOVAPS	%ZMM5,%ZMM4;
0x402c83;:0;VCVTPS2PD	%YMM30,%ZMM7;
0x402c89;:0;(bad);
0x402c8a;:0;(bad);
0x402c8b;:0;STD;
0x402c8c;:0;POP	%RAX;
0x402c8d;:0;INT	$0x3;
0x402c8e;:0;CMC;
0x402c8f;:0;VMOVAPS	%ZMM7,%ZMM6;
0x402c95;:0;VMULPD	{rn-sae},%ZMM5,%ZMM30,%ZMM31;
0x402c9b;:0;VSCALEFPD	0xe60b(%RIP){1to8},%ZMM30,%ZMM30;
0x402ca5;:0;VFNMADD231PD	{rn-sae},%ZMM31,%ZMM31,%ZMM4;
0x402cab;:0;VFMADD213PD	%ZMM31,%ZMM30,%ZMM4;
0x402cb1;:0;(bad);
0x402cb2;:0;(bad);
0x402cb3;:0;STD;
0x402cb4;:0;POP	%RAX;
0x402cb5;:0;INT	$0x3;
0x402cb6;:0;MULL	-0xd(%RDX);
0x402cb9;:0;(bad);
0x402cba;:0;POP	%RAX;
0x402cbb;:0;PUSH	%RSP;
0x402cbc;:0;AND	$0xe5f6,%EAX;
0x402cc1;:0;JO	402d25 <move_particles+0x505>;
0x402cc3;:0;(bad);
0x402cc4;:0;LEA	(%RAX),%EDX;
0x402cc6;:0;POP	%RCX;
0x402cc7;:0;JMP	0x62(%RDX);
0x402cca;:0;LEA	0x2c(%RAX),%EDX;
0x402ccd;:0;XOR	$0xe5de,%EAX;
0x402cd2;:0;VFNMADD231PD	{rn-sae},%ZMM31,%ZMM31,%ZMM6;
0x402cd8;:0;VFMADD213PD	%ZMM31,%ZMM30,%ZMM6;
0x402cde;:0;VMULPD	%ZMM5,%ZMM4,%ZMM30;
0x402ce4;:0;VFIXUPIMMPD	$0x70,0xe5c9(%RIP){1to8},%ZMM7,%ZMM6;
0x402cef;:0;VCVTPD2PS	%ZMM30,%YMM30;
0x402cf5;:0;VMULPD	%ZMM7,%ZMM6,%ZMM31;
0x402cfb;:0;VCVTPD2PS	%ZMM31,%YMM8;
0x402d01;:0;VINSERTF64X4	$0x1,%YMM8,%ZMM30,%ZMM30;
0x402d08;:0;VRCP28PS	%ZMM30,%ZMM30;
0x402d0e;:0;VFMADD231PS	%ZMM23,%ZMM30,%ZMM2{%K2};
0x402d14;:0;VFMADD231PS	%ZMM22,%ZMM30,%ZMM1{%K2};
0x402d1a;:0;VFMADD231PS	%ZMM21,%ZMM30,%ZMM0{%K2};
0x402d20;:0;CMP	%R11,%RBX;
0x402d23;:0;JB	402c0e <move_particles+0x3ee>;
0x402d29;:0;VEXTRACTF64X4	$0x1,%ZMM1,%YMM13;(3) 
0x402d30;:0;VEXTRACTF64X4	$0x1,%ZMM0,%YMM4;(3) 
0x402d37;:0;VADDPS	%YMM0,%YMM4,%YMM6;(3) 
0x402d3b;:0;VADDPS	%YMM1,%YMM13,%YMM15;(3) 
0x402d3f;:0;VPERMPD	$-0x56,%YMM6,%YMM7;(3) 
0x402d45;:0;VPERMPD	$0x55,%YMM6,%YMM8;(3) 
0x402d4b;:0;VPERMPD	$-0x1,%YMM6,%YMM5;(3) 
0x402d51;:0;VPERMPD	$-0x1,%YMM15,%YMM14;(3) 
0x402d57;:0;VPERMPD	$-0x56,%YMM15,%YMM0;(3) 
0x402d5d;:0;VPERMPD	$0x55,%YMM15,%YMM1;(3) 
0x402d63;:0;VADDPS	%YMM8,%YMM7,%YMM10;(3) 
0x402d68;:0;VEXTRACTF64X4	$0x1,%ZMM2,%YMM8;(3) 
0x402d6f;:0;VADDPS	%YMM6,%YMM5,%YMM9;(3) 
0x402d73;:0;VADDPS	%YMM15,%YMM14,%YMM4;(3) 
0x402d78;:0;VADDPS	%YMM1,%YMM0,%YMM5;(3) 
0x402d7c;:0;VADDPS	%YMM2,%YMM8,%YMM8;(3) 
0x402d80;:0;VADDPS	%YMM5,%YMM4,%YMM6;(3) 
0x402d84;:0;VPERMPD	$-0x1,%YMM8,%YMM2;(3) 
0x402d8a;:0;VPERMPD	$-0x56,%YMM8,%YMM0;(3) 
0x402d90;:0;VPERMPD	$0x55,%YMM8,%YMM1;(3) 
0x402d96;:0;VADDPS	%YMM8,%YMM2,%YMM4;(3) 
0x402d9b;:0;VADDPS	%YMM1,%YMM0,%YMM5;(3) 
0x402d9f;:0;VPSRLQ	$0x20,%XMM6,%XMM7;(3) 
0x402da4;:0;VADDSS	%XMM6,%XMM7,%XMM23;(3) 
0x402daa;:0;VADDPS	%YMM5,%YMM4,%YMM6;(3) 
0x402dae;:0;VADDPS	%YMM10,%YMM9,%YMM11;(3) 
0x402db3;:0;VPSRLQ	$0x20,%XMM6,%XMM7;(3) 
0x402db8;:0;VADDSS	%XMM6,%XMM7,%XMM22;(3) 
0x402dbe;:0;VPSRLQ	$0x20,%XMM11,%XMM12;(3) 
0x402dc4;:0;VADDSS	%XMM11,%XMM12,%XMM21;(3) 
0x402dca;:0;VFMADD213SS	(%RDI,%RAX,4),%XMM3,%XMM22;(3) 
0x402dd1;:0;VMOVSS	%XMM22,(%RDI,%RAX,4);(3) 
0x402dd8;:0;VFMADD213SS	(%R8,%RAX,4),%XMM3,%XMM23;(3) 
0x402ddf;:0;VMOVSS	%XMM23,(%R8,%RAX,4);(3) 
0x402de6;:0;VFMADD213SS	(%R10,%RAX,4),%XMM3,%XMM21;(3) 
0x402ded;:0;VMOVSS	%XMM21,(%R10,%RAX,4);(3) 
0x402df4;:0;ADD	$0x1,%RAX;(3) 
0x402df8;:0;CMP	%R12,%RAX;(3) 
0x402dfb;:0;JB	4028f8 <move_particles+0xd8>;(3) 
0x402e01;:0;MOV	0x10(%RSP),%R11B;
0x402e06;:0;MOV	0x8(%RSP),%RBX;
0x402e0b;:0;TEST	%R11B,%R11B;
0x402e0e;:0;JE	402e84 <move_particles+0x664>;
0x402e10;:0;MOV	$0x411044,%EDI;
0x402e15;:0;CALL	402160 <puts@plt>;
0x402e1a;:0;VXORPS	%YMM3,%YMM3,%YMM3;
0x402e1e;:0;VMOVUPS	0x40(%RSP),%YMM0;
0x402e24;:0;XOR	%EAX,%EAX;
0x402e26;:0;VMOVAPS	%YMM3,%YMM2;
0x402e2a;:0;VMOVAPS	%YMM2,%YMM1;
0x402e2e;:0;TEST	%R12,%R12;
0x402e31;:0;JBE	402ec2 <move_particles+0x6a2>;
0x402e37;:0;NOPW	(%RAX,%RAX,1);
0x402e40;:0;MOV	0x18(%RBX),%RDX;(6) 
0x402e44;:0;MOV	(%RBX),%RCX;(6) 
0x402e47;:0;VFMADD231PS	(%RDX,%RAX,4),%YMM0,%YMM3;(6) 
0x402e4d;:0;VMOVUPS	%YMM3,(%RCX,%RAX,4);(6) 
0x402e52;:0;MOV	0x20(%RBX),%RSI;(6) 
0x402e56;:0;MOV	0x8(%RBX),%RDI;(6) 
0x402e5a;:0;VFMADD231PS	(%RSI,%RAX,4),%YMM0,%YMM2;(6) 
0x402e60;:0;VMOVUPS	%YMM2,(%RDI,%RAX,4);(6) 
0x402e65;:0;MOV	0x28(%RBX),%R8;(6) 
0x402e69;:0;MOV	0x10(%RBX),%R9;(6) 
0x402e6d;:0;VFMADD231PS	(%R8,%RAX,4),%YMM0,%YMM1;(6) 
0x402e73;:0;VMOVUPS	%YMM1,(%R9,%RAX,4);(6) 
0x402e79;:0;ADD	$0x8,%RAX;(6) 
0x402e7d;:0;CMP	%R12,%RAX;(6) 
0x402e80;:0;JB	402e40 <move_particles+0x620>;(6) 
0x402e82;:0;JMP	402ec2 <move_particles+0x6a2>;
0x402e84;:0;XOR	%EAX,%EAX;
0x402e86;:0;VMOVSS	(%RDI,%RAX,4),%XMM0;(5) 
0x402e8b;:0;VFMADD213SS	(%R9,%RAX,4),%XMM3,%XMM0;(5) 
0x402e91;:0;VMOVSS	%XMM0,(%R9,%RAX,4);(5) 
0x402e97;:0;VMOVSS	(%R8,%RAX,4),%XMM1;(5) 
0x402e9d;:0;VFMADD213SS	(%RCX,%RAX,4),%XMM3,%XMM1;(5) 
0x402ea3;:0;VMOVSS	%XMM1,(%RCX,%RAX,4);(5) 
0x402ea8;:0;VMOVSS	(%R10,%RAX,4),%XMM2;(5) 
0x402eae;:0;VFMADD213SS	(%RDX,%RAX,4),%XMM3,%XMM2;(5) 
0x402eb4;:0;VMOVSS	%XMM2,(%RDX,%RAX,4);(5) 
0x402eb9;:0;ADD	$0x1,%RAX;(5) 
0x402ebd;:0;CMP	%R12,%RAX;(5) 
0x402ec0;:0;JB	402e86 <move_particles+0x666>;(5) 
0x402ec2;:0;MOV	0x38(%RSP),%RBX;
0x402ec7;:0;MOV	0x18(%RSP),%R12;
0x402ecc;:0;MOV	0x20(%RSP),%R13;
0x402ed1;:0;MOV	0x28(%RSP),%R14;
0x402ed6;:0;MOV	0x30(%RSP),%R15;
0x402edb;:0;MOV	%RBP,%RSP;
0x402ede;:0;POP	%RBP;
0x402edf;:0;RET;
0x402ee0;:0;XOR	%R15D,%R15D;(3) 
0x402ee3;:0;JMP	402bc6 <move_particles+0x3a6>;(3) 
0x402ee8;:0;MOV	(%RSP),%R15;(3) 
0x402eec;:0;XOR	%R11D,%R11D;(3) 
0x402eef;:0;JMP	402aa8 <move_particles+0x288>;(3) 
0x402ef4;:0;TEST	%R11B,%R11B;
0x402ef7;:0;JNE	402e10 <move_particles+0x5f0>;
0x402efd;:0;JMP	402ec2 <move_particles+0x6a2>;
0x402eff;:0;NOP;

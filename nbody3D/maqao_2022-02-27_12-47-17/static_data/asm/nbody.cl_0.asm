address;source_location;insn;indent
0x4011e0;:0;CALL	4010a0 <rand@plt>;
0x4011e5;:0;MOV	%EAX,%EBP;
0x4011e7;:0;CALL	4010a0 <rand@plt>;
0x4011ec;:0;XOR	%ECX,%ECX;
0x4011ee;:0;CMP	%EAX,%EBP;
0x4011f0;:0;SETA	%CL;
0x4011f3;:0;LEA	(%RCX,%RCX,1),%EAX;
0x4011f6;:0;ADD	$-0x1,%EAX;
0x4011f9;:0;XORPS	%XMM0,%XMM0;
0x4011fc;:0;CVTSI2SS	%EAX,%XMM0;
0x401200;:0;MOVSS	%XMM0,0xc(%RSP);
0x401206;:0;CALL	4010a0 <rand@plt>;
0x40120b;:0;XORPS	%XMM0,%XMM0;
0x40120e;:0;CVTSI2SS	%EAX,%XMM0;
0x401212;:0;MOVSS	0xdea(%RIP),%XMM1;
0x40121a;:0;MOVSS	0xc(%RSP),%XMM2;
0x401220;:0;MULSS	%XMM1,%XMM2;
0x401224;:0;MOVSS	%XMM2,0xc(%RSP);
0x40122a;:0;MULSS	%XMM2,%XMM0;
0x40122e;:0;MOVSS	%XMM0,-0x14(%RBX);
0x401233;:0;CALL	4010a0 <rand@plt>;
0x401238;:0;XORPS	%XMM0,%XMM0;
0x40123b;:0;CVTSI2SS	%EAX,%XMM0;
0x40123f;:0;MULSS	0xdbd(%RIP),%XMM0;
0x401247;:0;MOVSS	%XMM0,-0x10(%RBX);
0x40124c;:0;CALL	4010a0 <rand@plt>;
0x401251;:0;XORPS	%XMM0,%XMM0;
0x401254;:0;CVTSI2SS	%EAX,%XMM0;
0x401258;:0;MULSS	0xc(%RSP),%XMM0;
0x40125e;:0;MOVSS	%XMM0,-0xc(%RBX);
0x401263;:0;CALL	4010a0 <rand@plt>;
0x401268;:0;XORPS	%XMM0,%XMM0;
0x40126b;:0;CVTSI2SS	%EAX,%XMM0;
0x40126f;:0;MULSS	0xd8d(%RIP),%XMM0;
0x401277;:0;MOVSS	%XMM0,-0x8(%RBX);
0x40127c;:0;CALL	4010a0 <rand@plt>;
0x401281;:0;XORPS	%XMM0,%XMM0;
0x401284;:0;CVTSI2SS	%EAX,%XMM0;
0x401288;:0;MULSS	0xc(%RSP),%XMM0;
0x40128e;:0;MOVSS	%XMM0,-0x4(%RBX);
0x401293;:0;CALL	4010a0 <rand@plt>;
0x401298;:0;XORPS	%XMM0,%XMM0;
0x40129b;:0;CVTSI2SS	%EAX,%XMM0;
0x40129f;:0;MULSS	0xd5d(%RIP),%XMM0;
0x4012a7;:0;MOVSS	%XMM0,(%RBX);
0x4012ab;:0;ADD	$0x18,%RBX;
0x4012af;:0;ADD	$-0x1,%R14;
0x4012b3;:0;JNE	4011e0 <init+0x20>;

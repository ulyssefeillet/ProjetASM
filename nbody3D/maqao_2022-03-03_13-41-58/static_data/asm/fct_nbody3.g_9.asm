address;source_location;insn;indent
0x1b50;:0;ENDBR64;
0x1b54;:0;TEST	%RSI,%RSI;
0x1b57;:0;JE	1c50 <init+0x100>;
0x1b5d;:0;PUSH	%R13;
0x1b5f;:0;PUSH	%R12;
0x1b61;:0;LEA	(%RSI),%R12;
0x1b64;:0;PUSH	%RBP;
0x1b65;:0;LEA	(%RDI),%RBP;
0x1b68;:0;PUSH	%RBX;
0x1b69;:0;XOR	%EBX,%EBX;
0x1b6b;:0;LEA	-0x18(%RSP),%RSP;
0x1b70;:0;CALL	11d0 <.plt.sec@start+0xc0>;(6) 
0x1b75;:0;MOVSXD	%EAX,%R13;(6) 
0x1b78;:0;CALL	11d0 <.plt.sec@start+0xc0>;(6) 
0x1b7d;:0;MOVL	$0x30000000,0xc(%RSP);(6) 
0x1b85;:0;CLTQ;(6) 
0x1b87;:0;CMP	%RAX,%R13;(6) 
0x1b8a;:0;JA	1b9a <init+0x4a>;(6) 
0x1b8c;:0;VMOVSS	0x590(%RIP),%XMM2;(6) 
0x1b94;:0;VMOVSS	%XMM2,0xc(%RSP);(6) 
0x1b9a;:0;CALL	11d0 <.plt.sec@start+0xc0>;(6) 
0x1b9f;:0;VCVTSI2SS	%EAX,%XMM0,%XMM0;(6) 
0x1ba3;:0;MOV	(%RBP),%RDX;(6) 
0x1ba7;:0;VMULSS	0xc(%RSP),%XMM0,%XMM0;(6) 
0x1bad;:0;VMOVSS	%XMM0,(%RDX,%RBX,4);(6) 
0x1bb2;:0;CALL	11d0 <.plt.sec@start+0xc0>;(6) 
0x1bb7;:0;VCVTSI2SS	%EAX,%XMM0,%XMM0;(6) 
0x1bbb;:0;MOV	0x8(%RBP),%RDX;(6) 
0x1bbf;:0;VMULSS	0x559(%RIP),%XMM0,%XMM0;(6) 
0x1bc7;:0;VMOVSS	%XMM0,(%RDX,%RBX,4);(6) 
0x1bcc;:0;CALL	11d0 <.plt.sec@start+0xc0>;(6) 
0x1bd1;:0;VCVTSI2SS	%EAX,%XMM0,%XMM0;(6) 
0x1bd5;:0;MOV	0x10(%RBP),%RDX;(6) 
0x1bd9;:0;VMULSS	0xc(%RSP),%XMM0,%XMM0;(6) 
0x1bdf;:0;VMOVSS	%XMM0,(%RDX,%RBX,4);(6) 
0x1be4;:0;CALL	11d0 <.plt.sec@start+0xc0>;(6) 
0x1be9;:0;VCVTSI2SS	%EAX,%XMM0,%XMM0;(6) 
0x1bed;:0;MOV	0x18(%RBP),%RDX;(6) 
0x1bf1;:0;VMULSS	0x527(%RIP),%XMM0,%XMM0;(6) 
0x1bf9;:0;VMOVSS	%XMM0,(%RDX,%RBX,4);(6) 
0x1bfe;:0;CALL	11d0 <.plt.sec@start+0xc0>;(6) 
0x1c03;:0;VCVTSI2SS	%EAX,%XMM0,%XMM0;(6) 
0x1c07;:0;MOV	0x20(%RBP),%RDX;(6) 
0x1c0b;:0;VMULSS	0xc(%RSP),%XMM0,%XMM0;(6) 
0x1c11;:0;VMOVSS	%XMM0,(%RDX,%RBX,4);(6) 
0x1c16;:0;CALL	11d0 <.plt.sec@start+0xc0>;(6) 
0x1c1b;:0;VCVTSI2SS	%EAX,%XMM0,%XMM0;(6) 
0x1c1f;:0;MOV	0x28(%RBP),%RDX;(6) 
0x1c23;:0;VMULSS	0x4f5(%RIP),%XMM0,%XMM0;(6) 
0x1c2b;:0;VMOVSS	%XMM0,(%RDX,%RBX,4);(6) 
0x1c30;:0;LEA	0x1(%RBX),%RBX;(6) 
0x1c34;:0;CMP	%RBX,%R12;(6) 
0x1c37;:0;JNE	1b70 <init+0x20>;(6) 
0x1c3d;:0;LEA	0x18(%RSP),%RSP;
0x1c42;:0;POP	%RBX;
0x1c43;:0;POP	%RBP;
0x1c44;:0;POP	%R12;
0x1c46;:0;POP	%R13;
0x1c48;:0;RET;
0x1c49;:0;NOPL	(%RAX);
0x1c50;:0;RET;
0x1c51;:0;NOPW	%CS:(%RAX,%RAX,1);
0x1c5c;:0;NOPL	(%RAX);

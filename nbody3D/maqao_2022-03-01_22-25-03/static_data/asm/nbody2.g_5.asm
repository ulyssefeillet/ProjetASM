address;source_location;insn;indent
0x1850;:0;VMOVAPS	(%R13,%RDX,1),%ZMM2;
0x1858;:0;VSUBPS	%ZMM23,%ZMM2,%ZMM20;
0x185e;:0;VMOVUPS	(%R12,%RDX,1),%ZMM2;
0x1865;:0;VSUBPS	%ZMM22,%ZMM2,%ZMM19;
0x186b;:0;VMOVUPS	(%R11,%RDX,1),%ZMM2;
0x1872;:0;VSUBPS	%ZMM21,%ZMM2,%ZMM18;
0x1878;:0;LEA	0x40(%RDX),%RDX;
0x187c;:0;CMP	%RBX,%RDX;
0x187f;:0;VMULPS	%ZMM19,%ZMM19,%ZMM1;
0x1885;:0;VFMADD231PS	%ZMM20,%ZMM20,%ZMM1;
0x188b;:0;VADDPS	%ZMM14,%ZMM1,%ZMM1;
0x1891;:0;VFMADD231PS	%ZMM18,%ZMM18,%ZMM1;
0x1897;:0;VCVTPS2PD	%YMM1,%ZMM25;
0x189d;:0;VEXTRACTI64X4	$0x1,%ZMM1,%YMM1;
0x18a4;:0;VCVTPS2PD	%YMM1,%ZMM1;
0x18aa;:0;VSQRTPD	%ZMM25,%ZMM2;
0x18b0;:0;VSQRTPD	%ZMM1,%ZMM24;
0x18b6;:0;VMULPD	%ZMM25,%ZMM2,%ZMM2;
0x18bc;:0;VMULPD	%ZMM1,%ZMM24,%ZMM1;
0x18c2;:0;VCVTPD2PS	%ZMM2,%YMM2;
0x18c8;:0;VCVTPD2PS	%ZMM1,%YMM1;
0x18ce;:0;VINSERTF64X4	$0x1,%YMM1,%ZMM2,%ZMM2;
0x18d5;:0;VRCP28PS	%ZMM2,%ZMM2;
0x18db;:0;VFMADD231PS	%ZMM2,%ZMM20,%ZMM7;
0x18e1;:0;VFMADD231PS	%ZMM19,%ZMM2,%ZMM8;
0x18e7;:0;VFMADD231PS	%ZMM18,%ZMM2,%ZMM9;
0x18ed;:0;JNE	1850 <move_particles+0x1a0>;
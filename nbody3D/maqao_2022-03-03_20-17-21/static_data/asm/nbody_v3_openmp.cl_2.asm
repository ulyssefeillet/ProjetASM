address;source_location;insn;indent
0x401580;:0;VMOVAPS	%ZMM14,%ZMM1;
0x401586;:0;VMOVAPS	%ZMM13,%ZMM17;
0x40158c;:0;VMOVDQA64	%ZMM23,%ZMM18;
0x401592;:0;VMOVDQA64	%ZMM22,%ZMM19;
0x401598;:0;VMOVUPS	(%RAX,%RBX,4),%ZMM7;
0x40159f;:0;VMOVUPS	0x40(%RAX,%RBX,4),%ZMM8;
0x4015a7;:0;VSUBPS	%ZMM9,%ZMM7,%ZMM22;
0x4015ad;:0;VSUBPS	%ZMM9,%ZMM8,%ZMM23;
0x4015b3;:0;VMOVUPS	(%RSI,%RBX,4),%ZMM13;
0x4015ba;:0;VMOVUPS	0x40(%RSI,%RBX,4),%ZMM14;
0x4015c2;:0;VSUBPS	%ZMM10,%ZMM13,%ZMM13;
0x4015c8;:0;VSUBPS	%ZMM10,%ZMM14,%ZMM14;
0x4015ce;:0;VMOVUPS	(%RDI,%RBX,4),%ZMM20;
0x4015d5;:0;VMOVUPS	0x40(%RDI,%RBX,4),%ZMM21;
0x4015dd;:0;VSUBPS	%ZMM11,%ZMM20,%ZMM20;
0x4015e3;:0;VSUBPS	%ZMM11,%ZMM21,%ZMM21;
0x4015e9;:0;VMOVAPS	%ZMM22,%ZMM7;
0x4015ef;:0;VFMADD213PS	%ZMM24,%ZMM22,%ZMM7;
0x4015f5;:0;VMOVAPS	%ZMM23,%ZMM8;
0x4015fb;:0;VFMADD213PS	%ZMM24,%ZMM23,%ZMM8;
0x401601;:0;VFMADD231PS	%ZMM13,%ZMM13,%ZMM7;
0x401607;:0;VFMADD231PS	%ZMM14,%ZMM14,%ZMM8;
0x40160d;:0;VFMADD231PS	%ZMM20,%ZMM20,%ZMM7;
0x401613;:0;VFMADD231PS	%ZMM21,%ZMM21,%ZMM8;
0x401619;:0;VEXTRACTF64X4	$0x1,%ZMM7,%YMM12;
0x401620;:0;VCVTPS2PD	%YMM12,%ZMM12;
0x401626;:0;VCVTPS2PD	%YMM7,%ZMM7;
0x40162c;:0;VSQRTPD	%ZMM7,%ZMM25;
0x401632;:0;VEXTRACTF64X4	$0x1,%ZMM8,%YMM4;
0x401639;:0;VSQRTPD	%ZMM12,%ZMM27;
0x40163f;:0;VCVTPS2PD	%YMM8,%ZMM8;
0x401645;:0;VSQRTPD	%ZMM8,%ZMM28;
0x40164b;:0;VCVTPS2PD	%YMM4,%ZMM4;
0x401651;:0;VSQRTPD	%ZMM4,%ZMM29;
0x401657;:0;VMULPD	%ZMM12,%ZMM27,%ZMM12;
0x40165d;:0;VMULPD	%ZMM7,%ZMM25,%ZMM7;
0x401663;:0;VCVTPD2PS	%ZMM7,%YMM7;
0x401669;:0;VCVTPD2PS	%ZMM12,%YMM12;
0x40166f;:0;VINSERTF64X4	$0x1,%YMM12,%ZMM7,%ZMM7;
0x401676;:0;VRCP14PS	%ZMM7,%ZMM12;
0x40167c;:0;VMULPD	%ZMM4,%ZMM29,%ZMM4;
0x401682;:0;VMULPD	%ZMM8,%ZMM28,%ZMM8;
0x401688;:0;VCVTPD2PS	%ZMM8,%YMM8;
0x40168e;:0;VCVTPD2PS	%ZMM4,%YMM4;
0x401694;:0;VINSERTF64X4	$0x1,%YMM4,%ZMM8,%ZMM4;
0x40169b;:0;VRCP14PS	%ZMM4,%ZMM8;
0x4016a1;:0;VFNMADD213PS	%ZMM16,%ZMM12,%ZMM7;
0x4016a7;:0;VFMADD132PS	%ZMM12,%ZMM12,%ZMM7;
0x4016ad;:0;VFNMADD213PS	%ZMM16,%ZMM8,%ZMM4;
0x4016b3;:0;VFMADD132PS	%ZMM8,%ZMM8,%ZMM4;
0x4016b9;:0;VFMADD213PS	%ZMM19,%ZMM7,%ZMM22;
0x4016bf;:0;VFMADD213PS	%ZMM18,%ZMM4,%ZMM23;
0x4016c5;:0;VFMADD213PS	%ZMM17,%ZMM7,%ZMM13;
0x4016cb;:0;VFMADD213PS	%ZMM1,%ZMM4,%ZMM14;
0x4016d1;:0;VFMADD231PS	%ZMM7,%ZMM20,%ZMM0;
0x4016d7;:0;VFMADD231PS	%ZMM4,%ZMM21,%ZMM15;
0x4016dd;:0;ADD	$0x20,%RBX;
0x4016e1;:0;CMP	%RBX,%RBP;
0x4016e4;:0;JNE	401580 <.omp_outlined.+0x1c0>;

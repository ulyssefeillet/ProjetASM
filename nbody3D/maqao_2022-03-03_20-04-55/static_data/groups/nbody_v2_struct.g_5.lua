_group = {
  {
    group_size = 1,
    pattern = "L",
    opcodes = "VMOVUPS,",
    offsets = "0,",
    addresses = "0x1517,",
    stride_status = "Success",
    stride = 64,
    memory_status = "Success",
    accessed_memory = 64,
    accessed_memory_nooverlap = 64,
    accessed_memory_overlap = 0,
    span = 64,
    head = 64,
    unroll_factor = 1,
  },
  {
    group_size = 5,
    pattern = "LLLSL",
    opcodes = "MOV,MOV,MOV,VMOVAPS,CMP,",
    offsets = "112,120,192,128,200,",
    addresses = "0x1500,0x150c,0x1524,0x1543,0x154b,",
    stride_status = "Not Analyzed",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 96,
    accessed_memory_nooverlap = 96,
    accessed_memory_overlap = 0,
    span = 96,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "VADDPS,",
    offsets = "7197,",
    addresses = "0x1559,",
    stride_status = "RIP based value",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 64,
    accessed_memory_nooverlap = 64,
    accessed_memory_overlap = 0,
    span = 64,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "VMOVAPS,",
    offsets = "0,",
    addresses = "0x1505,",
    stride_status = "Success",
    stride = 64,
    memory_status = "Success",
    accessed_memory = 64,
    accessed_memory_nooverlap = 64,
    accessed_memory_overlap = 0,
    span = 64,
    head = 64,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "L",
    opcodes = "VMOVUPS,",
    offsets = "0,",
    addresses = "0x1532,",
    stride_status = "Success",
    stride = 64,
    memory_status = "Success",
    accessed_memory = 64,
    accessed_memory_nooverlap = 64,
    accessed_memory_overlap = 0,
    span = 64,
    head = 64,
    unroll_factor = 1,
  },
}

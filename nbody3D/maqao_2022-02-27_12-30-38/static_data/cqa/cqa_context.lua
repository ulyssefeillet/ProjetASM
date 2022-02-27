_cqa_uarch_const = {
  ["ports"] = {
    ["FP ADD"] = {
      [1] = 0,
      [2] = 1,
    },
    ["store address"] = {
      [1] = 2,
      [2] = 3,
    },
    ["DIV/SQRT"] = {
      [1] = 0,
    },
    ["store data"] = {
      [1] = 6,
    },
    ["misc"] = {
      [1] = 4,
      [2] = 5,
    },
    ["VPU"] = {
      [1] = 0,
      [2] = 1,
    },
    ["FP FMA"] = {
      [1] = 0,
      [2] = 1,
    },
    ["load"] = {
      [1] = 2,
      [2] = 3,
    },
    ["FP MUL"] = {
      [1] = 0,
      [2] = 1,
    },
  },
  ["vector-unaligned optimal pattern"] = "1x512",
  ["vector size in bytes"] = 64,
  ["FP DIV/SQRT unit native width"] = 64,
  ["UQ throughput"] = 2,
  ["nb FP MUL units"] = 2,
  ["store unit native width"] = 64,
  ["load unit native width"] = 64,
  ["INT vector size in bytes"] = 64,
  ["bytes fetched per cycle"] = 16,
  ["retire throughput"] = 2,
  ["nb execution ports"] = 7,
  ["IQ throughput"] = 2,
}

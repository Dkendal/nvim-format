local Mod = {}

function Mod.inspect(...)
  print(unpack(vim.tbl_map(vim.inspect, { ... })))
end

return Mod

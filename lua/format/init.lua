local util = require 'format.util'
local api = vim.api
local f = string.format

local Mod = {}

local config = { lua = { 'lua-format' }, typescript = { 'prettier' } }

-- @param filetype string
local function msg_no_config(filetype)
  -- TODO How to make warning message?
  return f([[No configured formatters for %s]], filetype)
end

-- @param cmd string
-- @param buf number
local function formatter_simple(cmd, buf)
  -- case: temp file
  -- case: stdin
  -- case: this file
end

function Mod.format()
  local filetype = vim.bo.filetype

  local ftconfig = config[filetype]

  if not ftconfig then
    print(msg_no_config(filetype))
    return
  end

  local buf = api.nvim_get_current_buf()

  for index, value in ipairs(ftconfig) do
    if type(value) == 'string' then
      formatter_simple(value, buf)
    end
  end

  util.inspect()
end

function Mod.setup()
  api.nvim_exec([[
    command! Format :lua require("format").format()<cr>
  ]], false)
end

Mod.setup()

return Mod

---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<A-k>"] = { ":m .-2<CR>==" },
    ["<A-j>"] = { ":m .+1<CR>==" }
  },
  v = {
    ["<A-k>"] = { ":m '<-2<CR>gv=gv" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv" }
  },
}

-- more keybinds!

return M

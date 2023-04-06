vim.opt.colorcolumn = "80"
vim.wo.relativenumber = true
vim.opt.shell = "/bin/fish"

local autocmd = vim.api.nvim_create_autocmd

-- autoformat on save
autocmd("BufWritePre", {
  pattern = "*",
  command = "lua vim.lsp.buf.format()",
})

-- Highlight on Yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

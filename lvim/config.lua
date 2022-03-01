-- ===========================================================================================
--                                    GENERAL SETTINGS
-- ===========================================================================================


-- theme and interface
-- vim.cmd('packadd! dracula_pro')
-- vim.g.lightline = { colorscheme = "dracula" }
lvim.colorscheme = "catppuccin"
-- vim.cmd[[colorscheme dracula]]
vim.wo.relativenumber = true
vim.o.cmdheight = 1
lvim.transparent_window = false

-- formatting and lintering
lvim.format_on_save = false
lvim.lint_on_save = false

-- go to last location when opening a buffer
vim.cmd [[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif ]]

-- ===========================================================================================
--                KEYMAPPINGS [view all the defaults by pressing <leader>Lk]
-- ===========================================================================================

-- global keys
lvim.leader = "space"                                         -- leader key
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"                     -- easy save (ctrl + s)
lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"   -- search highlights off
lvim.keys.normal_mode["Y"] = "y$"                             -- yank to end of line
lvim.keys.normal_mode["U"] = "<C-r>"                          -- U to Redo
-- lvim.keys.visual_mode["p"] = [["_dP]]


-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}


-- add Projects to which-key
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- add Trouble to which-key
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnosticss" },
}

-- add MarkDown Preview to which-key
lvim.builtin.which_key.mappings["m"] = {
  name = "+Markdown Preview",
  m = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle" },
  s = { "<cmd>MarkdownPreview<cr>", "Markdown Preview Start" },
  t = { "<cmd>MarkdownPreviewStop<cr>", "Markdown Preview Stop" },
}
-- ===========================================================================================
--                                BUILTIN PLUGINS CONFIG
-- ===========================================================================================

-- User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.dashboard.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.bufferline.active = false
lvim.builtin.lualine.active = true
lvim.builtin.autopairs.active = true
-- lvim.builtin.fancy_statusline = { active = true } -- enable/disable fancy statusline

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell", "ocamllex" }
lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.treesitter.autotag.enable = true
-- lvim.builtin.treesitter.playground.enable = true

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- ===========================================================================================
--                                  ADDITIONAL PLUGINS
-- ===========================================================================================

if lvim.builtin.lualine.active then
  require("user.lualine").config()
end

lvim.plugins = {

  -- Status line and bufferline
  -- {
  --   "famiu/feline.nvim",
  --     config = function ()
  --       require "user.feline"
  --     end
  -- },

  -- {
  --   "itchyny/lightline.vim"
  -- },

  -- {
  --    'nvim-lualine/lualine.nvim',
  --    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  -- },

  {
    "akinsho/bufferline.nvim",
      config = function()
        require("user.bufferline").config()
      end,
      requires = "nvim-web-devicons",
  },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   config = function()
  --     require "user.lualine"
  --   end,
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  -- },

  -- Colors hex numbers
  {
    "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
  },

  {
    "catppuccin/nvim",
	  as = "catppuccin"
  },

  -- Indentlines
  {
    "lukas-reineke/indent-blankline.nvim",
      setup = function()
        require("user.blankline").setup()
      end,
      event = "BufRead"
  },

  -- Nice dashboard
  {
    "goolord/alpha-nvim",
      config = function()
        require "user.alpha"
      end,
  },

  -- Color schemes
  -- {
  --   "folke/tokyonight.nvim",
  --     config = function()
  --       require("user.theme").setup()
  --       vim.cmd [[ colorscheme tokyonight ]]
  --     end,
  -- },
  -- {
  --   "Mofiqul/dracula.nvim"
  -- },

  {
      "iamcco/markdown-preview.nvim",
      -- run = "cd app && npm install",
      ft = "markdown",
  },

  -- Troubletoggle
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}

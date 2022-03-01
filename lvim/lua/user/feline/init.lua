
local colors = require 'user/feline/colors'

local vi_mode_colors = {
    NORMAL = colors.darkblue,
    INSERT = colors.green,
    VISUAL = colors.yellow,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.red,
    ['V-REPLACE'] = colors.red,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.magenta,
    SHELL = colors.green,
    TERM = colors.blue,
    NONE = colors.yellow
}

local vi_mode_text = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    [''] = "V-BLOCK",
    V = "V-LINE",
    c = "COMMAND",
    no = "UNKNOWN",
    s = "UNKNOWN",
    S = "UNKNOWN",
    ic = "UNKNOWN",
    R = "REPLACE",
    Rv = "UNKNOWN",
    cv = "UNKWON",
    ce = "UNKNOWN",
    r = "REPLACE",
    rm = "UNKNOWN",
    t = "INSERT"
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = ' '
    elseif os == 'MAC' then
        icon = ' '
    else
        icon = ' '
    end
    return icon .. os
end

local function get_filename(component, modifiers)
    -- local filename = vim.fn.expand('%:t')
    local modifiers_str = table.concat(modifiers, ":")
    local filename = vim.fn.expand("%" .. modifiers_str)
    local extension = vim.fn.expand('%:e')
    local modified_str

    local icon = component.icon or
        require'nvim-web-devicons'.get_icon(filename, extension, { default = true })

    if filename == '' then filename = 'unnamed' end

    if vim.bo.modified then
        local modified_icon = component.file_modified_icon or '●'
        modified_str = modified_icon .. ' '
    else
        modified_str = ''
    end

    return icon .. ' ' .. filename .. ' ' .. modified_str
end

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'
local cursor = require 'feline.providers.cursor'

-- LuaFormatter off


local force_inactive = {
  filetypes = {
    'NvimTree',
    'dbui',
    'packer',
    'startify',
    'fugitive',
    'fugitiveblame'
  },
  buftypes = {'terminal'},
  bufnames = {}
}

local disable = {
  filetypes = {
    'alpha'
  }
}

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}},
}

-- LEFT

components.active[1][1] = {
  provider = function()
    local current_text = ' '..vi_mode_text[vim.fn.mode()]..' '
    return current_text
  end,
  hl = function()
    local val = {
      name = vi_mode_utils.get_mode_highlight_name(),
      fg = colors.black,
      bg = vi_mode_utils.get_mode_color(),
      style = 'bold'
    }
    return val
  end
}

components.active[1][2] = {
  provider = require("user/feline/file_name").get_current_ufn,
  hl = {
    fg = colors.blue,
    style = 'bold'
  },
  left_sep = '  '
}

components.active[1][3] = {
  provider = 'lsp_client_names',
  left_sep = '  ',
  icon = ' ',
  hl = {
    fg = colors.orange
  }
}

components.active[1][4] = {
  provider = 'diagnostic_errors',
  enabled = function()
    return lsp.diagnostics_exist('Error')
  end,
  hl = {
    fg = colors.red
  }
}

components.active[1][5] = {
  provider = 'diagnostic_warnings',
  enabled = function()
    return lsp.diagnostics_exist('Warning')
  end,
  hl = {
    fg = colors.yellow
  }
}

components.active[1][6] = {
  provider = 'diagnostic_hints',
  enabled = function()
    return lsp.diagnostics_exist('Hint')
  end,
  hl = {
   fg = colors.cyan
  }
}

components.active[1][7] = {
  provider = 'diagnostic_info',
  enabled = function()
    return lsp.diagnostics_exist('Information')
  end,
  hl = {
    fg = colors.magenta
  }
}

components.inactive[1][1] = {
  provider = require("user/feline/file_name").get_current_ufn,
  hl = {
    fg = colors.blue,
    style = 'bold'
  },
  left_sep = ' '
}

-- MID
-- components.active[2][1] = {}
-- components.inactive[2][1] = {}

-- RIGHT

components.active[3][1] = {
  provider = 'git_diff_added',
  hl = {
    fg = colors.green
  }
}

components.active[3][2] = {
  provider = 'git_diff_changed',
  hl = {
    fg = colors.orange
  }
}

components.active[3][3] = {
  provider = 'git_diff_removed',
  hl = {
    fg = colors.red
  }
}

-- components.active[3][4] = {
--   provider = file_osinfo,
--   left_sep = ' ',
--   hl = {
--     fg = colors.blue,
--     style = 'bold'
--   }
-- }

components.active[3][4] = {
  provider = 'git_branch',
  icon = ' ',
  left_sep = ' ',
  hl = {
    fg = colors.blue,
    style = 'bold'
  }
}

components.active[3][5] = {
  provider = 'scroll_bar',
  left_sep = ' ',
  hl = {
    fg = colors.yellow,
    style = 'bold'
  }
}

components.active[3][6] = {
  provider = 'line_percentage',
  left_sep = ' ',
  hl = {
    style = 'bold'
  }
}

components.active[3][7] = {
  provider = function()
    pos = cursor.position()
    return ' '..pos..' '
  end,
  left_sep = ' ',
  hl = function()
    local val = {
      name = vi_mode_utils.get_mode_highlight_name(),
      fg = colors.black,
      bg = vi_mode_utils.get_mode_color(),
      styl = 'bold'
    }
    return val
  end
}

components.inactive[3][1] = {
  provider = file_osinfo,
  left_sep = ' ',
  hl = {
    fg = colors.blue,
    style = 'bold'
  }
}

-- LuaFormatter on

require'feline'.setup {
  colors = colors,
  bg = colors.bg,
  fg = colors.fg,
  components = components,
  force_inactive = force_inactive,
  disable = disable,
  vi_mode_colors = vi_mode_colors
}

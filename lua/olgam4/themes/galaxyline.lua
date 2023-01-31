-- galaxyline
local vim = vim
local gl = require('galaxyline')

local gls = gl.section
gl.short_line_list = { 'defx', 'packager', 'vista' }

-- Colors
local colors = {
  bg = '#53536C',
  compl_bg = '#b32e08',
  fg = '#1A0F1F',
  section_bg = '#4E344B',
  yellow = '#fff717',
  light_pink = '#ffe0ee',
  green = '#50fa7b',
  orange = '#ffb86c',
  magenta = '#690055',
  blue = '#8be9fd',
  red = '#eb2121',
  black = '#0e0e0e',
  pink = '#ff69dc'
}

-- Local helper functions
local is_buffer_empty = function()
  return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

local buffer_not_empty = function()
  return not is_buffer_empty()
end

local has_width_gt = function(cols)
  return vim.fn.winwidth(0) / 2 > cols
end

local in_git_repo = function()
  local vcs = require('galaxyline.providers.vcs')
  local branch_name = vcs.get_git_branch()

  return branch_name ~= nil
end

local checkwidth = function()
  return has_width_gt(40) and in_git_repo()
end

local mode_color = function()
  local mode_colors = {
    n = colors.light_pink,
    i = colors.pink,
    c = colors.green,
    V = colors.yellow,
    [''] = colors.red,
    v = colors.yellow,
    R = colors.red
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then color = colors.red end

  return color
end

-- Left side

gls.left[0] = {
  ZerothElement = {
    provider = function()
      return '  '
    end,
    highlight = { colors.black, colors.compl_bg }
  }
}

gls.left[1] = {
  FirstElement = {
    provider = function()
      return ' φ '
    end,
    highlight = { colors.black, colors.compl_bg }
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = { n = 'NORMAL', i = 'INSERT', c = 'COMMAND', V = 'VISUAL', [''] = 'VISUAL', v = 'VISUAL',
        R = 'REPLACE' }
      vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then alias_mode = vim.fn.mode() end
      return '  ' .. alias_mode .. ' '
    end,
    highlight = { colors.bg }
  }
}

gls.left[3] = {
  ThirdElement = {
    provider = function()
      vim.api.nvim_command('hi GalaxyThirdElement guifg=' .. mode_color())
      vim.api.nvim_command('hi GalaxyThirdElement guibg=' .. colors.section_bg)
      return '  '
    end
  }
}

gls.left[4] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.providers.fileinfo').get_file_icon_color, colors.section_bg }
  }
}
gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
    separator = "",
    separator_highlight = { colors.section_bg, colors.bg }
  }
}
gls.left[6] = {
  GitIcon = {
    provider = function()
      return '  '
    end,
    condition = in_git_repo,
    highlight = { colors.red, colors.bg }
  }
}
gls.left[7] = {
  GitBranch = {
    provider = function()
      local vcs = require('galaxyline.providers.vcs')
      local branch_name = vcs.get_git_branch()
      if (string.len(branch_name) > 28) then return string.sub(branch_name, 1, 25) .. "..." end
      return branch_name .. " "
    end,
    condition = in_git_repo,
    highlight = { colors.fg, colors.bg }
  }
}
gls.left[8] = { DiffAdd = { provider = 'DiffAdd', condition = checkwidth, icon = ' ',
  highlight = { colors.green, colors.bg } } }
gls.left[9] = { DiffModified = { provider = 'DiffModified', condition = checkwidth, icon = ' ',
  highlight = { colors.orange, colors.bg } } }
gls.left[10] = { DiffRemove = { provider = 'DiffRemove', condition = checkwidth, icon = ' ',
  highlight = { colors.red, colors.bg } } }
gls.left[11] = {
  LeftEnd = {
    provider = function()
      return ''
    end,
    condition = buffer_not_empty,
    highlight = { colors.section_bg, colors.bg }
  }
}
gls.left[12] = { DiagnosticError = { provider = 'DiagnosticError', icon = '  ',
  highlight = { colors.red, colors.section_bg } } }
gls.left[13] = {
  Space = {
    provider = function()
      return ' '
    end,
    highlight = { colors.section_bg, colors.section_bg }
  }
}
gls.left[14] = { DiagnosticWarn = { provider = 'DiagnosticWarn', icon = '  ',
  highlight = { colors.orange, colors.section_bg } } }
gls.left[15] = {
  Space = {
    provider = function()
      return ' '
    end,
    highlight = { colors.section_bg, colors.section_bg }
  }
}
gls.left[16] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = { colors.blue, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg }
  }
}

-- Right side
gls.right[0] = {
  FileFormat = {
    provider = function()
      return vim.bo.filetype
    end,
    highlight = { colors.fg, colors.section_bg },
    separator = '██',
    separator_highlight = { colors.section_bg, colors.bg }
  }
}
gls.right[1] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = { colors.fg, colors.section_bg },
    separator = ' | ',
    separator_highlight = { colors.bg, colors.section_bg }
  }
}

gls.right[2] = {
  Scroll = {
    provider = 'LinePercent',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ██ ',
    separator_highlight = { colors.bg, colors.section_bg }
  }
}

gls.right[3] = {
  Communism = {
    provider = function()
      return ' ☭ '
    end,
    highlight = { colors.red, colors.section_bg },
  }
}

-- Short status line
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg }
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = { colors.yellow, colors.section_bg },
    separator = '█',
    separator_highlight = { colors.section_bg, colors.bg }
  }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()

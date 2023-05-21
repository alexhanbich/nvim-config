local catppuccino = require("catppuccin.palettes").get_palette()

local get_hex = require('cokeline/utils').get_hex

local str_rep = string.rep

local bar_bg = catppuccino.base
local bar_bg2 = catppuccino.indicator

local green = catppuccino.green

local min_buffer_width = 24

local components = {
  separator = {
    text = function(buffer)
      return buffer.index ~= 1 and '▏' or ' '
    end,
    truncation = { priority = 1 }
  },
  space = {
    text = ' ',
    truncation = { priority = 1 },
  },
  devicon = {
    text = function(buffer)
      return buffer.devicon.icon
    end,
    fg = function(buffer)
      return buffer.devicon.color
    end,
    truncation = { priority = 1 },
  },
  index = {
    text = function(buffer)
      return buffer.index .. ' '
    end,
    fg = function(buffer)
      return
          (buffer.diagnostics.errors ~= 0 and catppuccino.red)
          or (buffer.diagnostics.warnings ~= 0 and catppuccino.yellow)
          or nil
    end,
    truncation = { priority = 1 },
  },

  unique_prefix = {
    text = function(buffer)
      return buffer.unique_prefix
    end,
    fg = catppuccino.surface2,
    style = 'italic',
    truncation = {
      priority = 3,
      direction = 'left',
    },
  },

  filename = {
    text = function(buffer)
      return buffer.filename
    end,
    fg = function(buffer)
      return
          (buffer.diagnostics.errors ~= 0 and catppuccino.red)
          or (buffer.diagnostics.warnings ~= 0 and catppuccino.yellow)
          or nil
    end,
    style = function(buffer)
      return
          ((buffer.is_focused and buffer.diagnostics.errors ~= 0)
            and 'bold,underline')
          or (buffer.is_focused and 'bold')
          or (buffer.diagnostics.errors ~= 0 and 'underline')
          or nil
    end,
    truncation = {
      priority = 2,
      direction = 'left',
    },
  },
  diagnostics = {
    text = function(buffer)
      return
          (buffer.diagnostics.errors ~= 0 and ' ' .. buffer.diagnostics.errors)
          or (buffer.diagnostics.warnings ~= 0 and ' ' .. buffer.diagnostics.warnings)
          or ''
    end,
    fg = function(buffer)
      return
          (buffer.diagnostics.errors ~= 0 and catppuccino.red)
          or (buffer.diagnostics.warnings ~= 0 and catppuccino.yellow)
          or nil
    end,
    truncation = { priority = 1 },
  },

  close_or_unsaved = {
    text = function(buffer)
      return buffer.is_modified and '  ' or '  '
    end,
    fg = function(buffer)
      return buffer.is_modified and green or nil
    end,
    delete_buffer_on_left_click = true,
    truncation = { priority = 1 },
  },
}

local get_remaining_space = function(buffer)
  local used_space = 0
  for _, component in pairs(components) do
    used_space = used_space + vim.fn.strwidth(
      (type(component.text) == 'string' and component.text)
      or (type(component.text) == 'function' and component.text(buffer))
    )
  end
  return math.max(0, min_buffer_width - used_space)
end

local right_padding = {
  text = function(buffer)
    local remaining_space = get_remaining_space(buffer)
    return str_rep(' ', remaining_space)
  end,
}

require('cokeline').setup({
  buffers = {
    focus_on_delete = 'next',
    new_buffers_position = 'next',
  },
  rendering = {
    max_buffer_width = min_buffer_width,
  },
  default_hl = {
    fg = function(buffer)
      return
          buffer.is_focused
          and catppuccino.text
          or catppuccino.surface2
    end,
    bg = function(buffer)
      return
          buffer.is_focused
          and catppuccino.surface0
          or catppuccino.base
    end,
  },
  components = {
    components.separator,
    components.devicon,
    components.index,
    components.unique_prefix,
    components.filename,
    components.space,
    right_padding,
    components.diagnostics,
    components.close_or_unsaved,
  },
})

local map = vim.api.nvim_set_keymap

map('n', '<S-Tab>', '<Plug>(cokeline-focus-prev)', { silent = true })
map('n', '<Tab>', '<Plug>(cokeline-focus-next)', { silent = true })
vim.keymap.set('n', '<leader>q', function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.cmd('bn')
  vim.cmd('bd' .. bufnr)
end)

for i = 1, 9 do
  map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
  map('n', ('<Leader><Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
end

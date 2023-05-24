local color = require("setup.color")

local str_rep = string.rep

local min_buffer_width = 22

local components = {
  separator = {
    text = function(buffer)
      return buffer.index ~= 1 and '▏' or ' '
    end,
    truncation = { priority = 1 }
  },
  separator_end = {
    text = function(buffer)
      return buffer.is_last and '▕' or ' '
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
   truncation = { priority = 1 },
  },
  filename = {
    text = function(buffer)
      return buffer.filename
    end,
    fg = function(buffer)
      return
          buffer.is_focused and color.bg or color.fg
    end,
   truncation = {
      priority = 2,
      direction = 'right',
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
          buffer.is_focused and color.bg or color.fg
         end,
    truncation = { priority = 1 },
  },
  }

local get_remaining_space = function(buffer)
  local used_space = 0
  for _, component in pairs(components) do
    local str = ''
    if (type(component.text) == 'string') then
      str = tostring(component.text)
    elseif (type(component.text) == 'function') then
      str = component.text(buffer)
    end
    used_space = used_space + vim.fn.strwidth(str)
  end
  return math.max(0, min_buffer_width - used_space)
end

local left_padding = {
  text = function(buffer)
    local remaining_space = get_remaining_space(buffer)
    return str_rep(' ', remaining_space / 2) 
  end,
}

local right_padding = {
  text = function(buffer)
    local remaining_space = get_remaining_space(buffer)
    return str_rep(' ', remaining_space / 2 + remaining_space % 2)
  end,
}

require('cokeline').setup({
  buffers = {
    focus_on_delete = 'prev',
    new_buffers_position = 'next',
    filter_valid = function(buffer) 
      if string.find(buffer.filename, ".") then
        return true
      else
        return false
      end
    end,
  },
  rendering = {
    max_buffer_width = min_buffer_width,
  },
  default_hl = {
    fg = function(buffer)
      return
          buffer.is_focused
          and color.sfg
          or color.fg
    end,
    bg = function(buffer)
      return
          buffer.is_focused
          and color.sbg
          or color.bg
    end,
  },
  components = {
    components.separator,
    left_padding,
    components.devicon,
    components.index,
    components.filename,
    components.space,
    components.diagnostics,
    right_padding,
    components.separator_end,
  },
})

local map = vim.api.nvim_set_keymap

map('n', '<leader><S-Tab>', '<Plug>(cokeline-focus-prev)', { silent = true })
map('n', '<leader><Tab>', '<Plug>(cokeline-focus-next)', { silent = true })
vim.keymap.set('n', '<leader>q', function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.cmd('bn')
  vim.cmd('bd' .. bufnr)
end)

for i = 1, 9 do
  map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
  map('n', ('<Leader>>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
end

-- base colors
local green = "#00FF00"
local red = "#FF0000"
local yellow = "#FFFF00"
local fg = "#000000"
local bg = "#FFFFFF"
local sfg = "#FFFFFF"
local sbg = "#00000"

if vim.g.colors_name == 'kanagawa' then
  green = "#87a987"
  red = "#c4746e"
  yellow = "#c4b28a"
  fg = "#c5c9c5"
  bg = "#181616"
  sfg = "#c5c9c5"
  sbg = "#393836"
end

if vim.g.colors_name == 'everforest' then
  green = "#83c092"
  red = "#e67280"
  yellow = "#dbbc7f"
  fg = "#9da9a0"
  bg = "#414b50"
  sfg = "#9da9a0"
  sbg = "#272e33"
end

if vim.g.colors_name == 'nordic' then
  green = "#A3BE8C"
  red = "#BF616A"
  yellow = "#EBCB8B"
  fg = "#c0c8d8"
  bg = "#191c24"
  sfg = "#c0c8d8"
  sbg = "#242933"
end


print(vim.g.colors_name)


local str_rep = string.rep

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
          (buffer.diagnostics.errors ~= 0 and red)
          or (buffer.diagnostics.warnings ~= 0 and yellow)
          or nil
    end,
    truncation = { priority = 1 },
  },

  unique_prefix = {
    text = function(buffer)
      return buffer.unique_prefix
    end,
    fg = fg,
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
          (buffer.diagnostics.errors ~= 0 and red)
          or (buffer.diagnostics.warnings ~= 0 and yellow)
          or nil
    end,
    style = function(buffer)
      return
          ((buffer.is_focused and buffer.diagnostics.errors ~= 0)
            and 'underline')
          or (buffer.diagnostics.errors ~= 0 and 'underline')
          or (buffer.is_focused) and 'italic'
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
          (buffer.diagnostics.errors ~= 0 and red)
          or (buffer.diagnostics.warnings ~= 0 and yellow)
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
    return str_rep(' ', remaining_space / 2 + remaining_space % 2)
  end,
}

local right_padding = {
  text = function(buffer)
    local remaining_space = get_remaining_space(buffer)
    return str_rep(' ', remaining_space / 2)
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
          and sfg
          or fg
    end,
    bg = function(buffer)
      return
          buffer.is_focused
          and sbg
          or bg
    end,
  },
  components = {
    components.separator,
    left_padding,
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
  map('n', ('<Leader>>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
end

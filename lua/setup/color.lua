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
  sfg = "#272e33"
  sbg = "#a7c080"
end

if vim.g.colors_name == 'nordic' then
  green = "#A3BE8C"
  red = "#D57780"
  yellow = "#EBCB8B"
  fg = "#C8D0E0"
  bg = "#2e3440"
  sfg = "#c0c8d8"
  sbg = "#242933"
end

if vim.g.colors_name == 'onenord' then
  green = "#A3BE8C"
  red = "#D57780"
  yellow = "#EBCB8B"
  fg = "#c0c8d8"
  bg = "#333b4a"
  sfg = "#c0c8d8"
  sbg = "#2E3440"
end


local git_color = function(color)
    vim.cmd("highlight GitSignsAdd guifg=" .. color.green)
    vim.cmd("highlight GitSignsChange guifg=" .. color.yellow)
    vim.cmd("highlight GitSignsDelete guifg=" .. color.red)
    vim.cmd("highlight GitSignsChangedelete guifg=" .. color.yellow)
    vim.cmd("highlight GitSignsTopdelete guifg=" .. color.red)
    vim.cmd("highlight GitSignsUntracked guifg=" .. color.red)
end



return {
  green = green,
  red = red,
  yellow = yellow,
  fg = fg,
  bg = bg,
  sfg = sfg,
  sbg =sbg,
  git_color = git_color,
}

-- base colors
local green = "#00FF00"
local red = "#FF0000"
local yellow = "#FFFF00"
local fg = "#000000"
local bg = "#FFFFFF"
local sfg = "#FFFFFF"
local sbg = "#00000"
local sidebar = "#00000"

if vim.g.colors_name == 'kanagawa' then
  green = "#87a987"
  red = "#c4746e"
  yellow = "#c4b28a"
  fg = "#c5c9c5"
  bg = "#181616"
  sfg = "#c5c9c5"
  sbg = "#393836"
  sidebar = "#282727"
end

if vim.g.colors_name == 'everforest' then
  green = "#83c092"
  red = "#e67280"
  yellow = "#dbbc7f"
  fg = "#9da9a0"
  bg = "#414b50"
  sfg = "#9da9a0"
  sbg = "#272e33"
  sidebar = sbg
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
  sidebar = "#ffff00"
end


local git_color = function(color)
    vim.cmd("highlight GitSignsAdd guifg=" .. color.green)
    -- vim.cmd("highlight GitSignsAdd guibg=" .. color.sidebar)
    vim.cmd("highlight GitSignsChange guifg=" .. color.yellow)
    -- vim.cmd("highlight GitSignsChange guibg=" .. color.sidebar)
    vim.cmd("highlight GitSignsDelete guifg=" .. color.red)
    -- vim.cmd("highlight GitSignsDelete guibg=" .. color.sidebar)
end



return {
  green = green,
  red = red,
  yellow = yellow,
  fg = fg,
  bg = bg,
  sfg = sfg,
  sbg =sbg,
  sidebar = sidebar,
  git_color = git_color,
}

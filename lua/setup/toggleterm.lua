require("toggleterm").setup {
  open_mapping = [[<C-t>]],
  direction = 'float',
  diagnostics = "nvim_lsp",
}

local Terminal  = require('toggleterm.terminal').Terminal
local tmux = Terminal:new({ cmd = "tmux", hidden = false })

function _TMUX()
  tmux:toggle()
end

vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua _TMUX()<CR>", {noremap = true, silent = true})

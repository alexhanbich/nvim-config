require("oil").setup({
  keymaps = {
    ["<CR>"] = "actions.select",
    ["<leader>q"] = "actions.close",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["g."] = "actions.toggle_hidden",
  },
     use_default_keymaps = true,
  view_options = {
    show_hidden = true,
  },
win_options = {
        signcolumn = "yes"
      },


})

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

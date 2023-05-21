require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      side = "right",
    },
  })

vim.keymap.set('n', '<leader>n', ":NvimTreeToggle<cr>", {silent = true})

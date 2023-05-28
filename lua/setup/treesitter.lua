require('nvim-treesitter.configs').setup {
  ensure_installed = { },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  additional_vim_regex_highlighting = false
}


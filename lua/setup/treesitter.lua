require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'lua', 'python', 'rust', 'javascript', 'tsx', 'typescript', 'json', 'go' },
  sync_install = true,
  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  additional_vim_regex_highlighting = false
}


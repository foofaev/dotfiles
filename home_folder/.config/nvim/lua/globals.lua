local cmd = vim.cmd
local apply_globals = require "utils".apply_globals

cmd "filetype plugin indent on"
cmd "silent! colorscheme nord"

apply_globals(
  {
    python_host_prog = "/home/foofaev/.python_neovim/neovim2/bin/python",
    python3_host_prog = "/home/foofaev/.python_neovim/neovim3/bin/python",
    vsnip_filetypes = {
      javascriptreact = {'javascript'},
      typescriptreact = {'typescript'},
      ['javascript.jsx'] = {'javascript'},
      ['typescript.jsx'] = {'typescript'}
    },
  }
)

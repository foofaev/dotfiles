local fn = vim.fn
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local utils = require("utils")

-- highlight yanked text
utils.au("TextYankPost", "*", "silent! lua require'vim.highlight'.on_yank({timeout = 500})")

utils.au("BufNewFile,BufRead", ".eslintignore,.prettierignore,.aliases", "setf conf")
utils.au("BufNewFile,BufRead", ".eslintrc,.prettierrc,tsconfig.json", "setf json")
utils.au("BufRead,BufNewFile", "*.csv,*.dat",	"setfiletype csv")

utils.au("BufEnter", "*.txt", "lua require('utils').help_tab()")

-- Open image file in system preview
cmd [[au BufEnter *.png,*.jpg,*.gif,*.ico exec "silent !open ".expand("%") | :bw"]]

-- Return to last edited line
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]]

cmd "command! LspReload lua reload_lsp()"
cmd "command! LspDebug lua print(vim.inspect(vim.lsp.get_active_clients()))"
cmd "command! LspLog lua open_lsp_log()"

cmd("syntax on")

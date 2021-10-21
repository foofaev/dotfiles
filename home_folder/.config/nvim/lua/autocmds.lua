local cmd = vim.cmd
local utils = require("utils")

-- highlight yanked text
utils.au("TextYankPost", "*", "silent! lua require'vim.highlight'.on_yank({timeout = 500})")

utils.au("BufNewFile,BufRead", ".eslintignore,.prettierignore,.aliases", "setf conf")
utils.au("BufNewFile,BufRead", ".eslintrc,.prettierrc,tsconfig.json", "setf json")
utils.au("BufRead,BufNewFile", "*.csv,*.dat", "setfiletype csv")

utils.au("BufEnter", "*.txt", "lua require('utils').help_tab()")

-- Open image file in system preview
cmd([[au BufEnter *.png,*.jpg,*.gif,*.ico exec "silent !open ".expand("%") | :bw"]])

-- Return to last edited line
cmd(
	[[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]]
)

cmd("command! LspReload lua reload_lsp()")
cmd("command! LspDebug lua print(vim.inspect(vim.lsp.get_active_clients()))")
cmd("command! LspLog lua open_lsp_log()")

cmd("syntax on")

cmd([[
  highlight LspDiagnosticsLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight LspDiagnosticsLineNrWarning guibg=#51412A guifg=#FFA500 gui=bold
  highlight LspDiagnosticsLineNrInformation guibg=#1E535D guifg=#00FFFF gui=bold
  highlight LspDiagnosticsLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsLineNrError
  sign define DiagnosticSignWarn text= texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsLineNrWarning
  sign define DiagnosticSignInfo text= texthl=LspDiagnosticsSignInformation linehl= numhl=LspDiagnosticsLineNrInformation
  sign define DiagnosticSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=LspDiagnosticsLineNrHint
]])

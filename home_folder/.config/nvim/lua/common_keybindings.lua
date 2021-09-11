local utils = require "utils"
local cmd = vim.cmd
local fn = vim.fn

-- Mapleader
-- Map <leader> to space
utils.apply_globals({
  mapleader = " "
})

-- Better indenting
utils.map("v", "<", "<gv", {})
utils.map("n", "<", "<<", {})
utils.map("n", ">", ">>", {})
utils.map("v", ">", ">gv", {})

utils.map("n", "<leader>b", ":Buffers<CR>", {noremap = true})

-- Easier Moving between splits
utils.map("n", "<C-J>", "<C-W><C-J>", {})
utils.map("n", "<C-K>", "<C-W><C-K>", {})
utils.map("n", "<C-L>", "<C-W><C-L>", {})
utils.map("n", "<C-H>", "<C-W><C-H>", {})

utils.map("n", "<leader>vl", ":vsp $MYVIMRC<CR>", {})
utils.map("n", "<leader>vr", ":source $MYVIMRC<CR>", {})

utils.map("n", "<Tab><Tab>", ":buffer <C-s><S-Tab>", {})

-- Copy to system clipboard
utils.map("v", "<leader>y", '"+y')
-- Paste from system clipboard with Ctrl + v
utils.map("i", "<leader>p", '<Esc>"+p')
-- Move to the end of yanked text after yank and paste
utils.map("n", "p", "p`]")
utils.map("v", "y", "y`]")
utils.map("v", "p", "p`]")

utils.map("n", "<Leader>ap", "<Plug>(JsConsoleLog)", {noremap = false})
cmd [[nnoremap <silent><Plug>(JsConsoleLog) :lua return require'utils'.console_log()<CR>]]

-- Git
utils.map("n", "<Leader>gs", ":Gstatus<CR>", {})
utils.map("n", "<Leader>gb", ":GBranches<CR>", {})
utils.map("n", "<Leader>go", ":GBrowse<CR>", {})

--open a new file in the same directory
utils.map("n", "<Leader>nf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})
utils.map("n", "<Leader>of", ':lua require"utils".open_file_or_create_new()', {silent = false})

-- Keep undo history across sessions, by storing in file.
-- Only works all the time.
if fn.has("persistent_undo") then
    os.execute("mkdir " .. os.getenv("HOME") .. "/.vim/backups > /dev/null 2>&1")
    vim.o.undodir = os.getenv("HOME") .. "/.vim/backups"
    vim.o.undofile = true
end

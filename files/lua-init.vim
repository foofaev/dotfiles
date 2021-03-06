"  Vim plug
" https://github.com/junegunn/vim-plug
" ------------------------------------------------------------------------------

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Theme
" ------------------------------------------------------------------------------

Plug 'nanotech/jellybeans.vim'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'neovim/nvim-lsp'

" Finding and replacing
" ------------------------------------------------------------------------------
"

" Fuzzy finding anything
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
" fzf integration for Vim
Plug 'junegunn/fzf.vim'
" async search
Plug 'dyng/ctrlsf.vim'
" Viewer & Finder for LSP symbols and tags
Plug 'liuchengxu/vista.vim'

" File management
" ------------------------------------------------------------------------------

" File browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Language pack
" ------------------------------------------------------------------------------

" Syntax and highlighting for my languages
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx', { 'for': 'typescript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Editing
" ------------------------------------------------------------------------------

" Allow plugins to be repeated with dot
Plug 'tpope/vim-repeat'
" Comment out blocks of code
Plug 'tpope/vim-commentary'
" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
" Autoclose parentheses
Plug 'cohama/lexima.vim'

" Text objects
" ------------------------------------------------------------------------------

" Improve text objects for arguments, brackets etc
" Add various text objects
Plug 'wellle/targets.vim'

" General
" ------------------------------------------------------------------------------

Plug 'tpope/vim-sensible'
" Set spaces and other settings on a per project basis
Plug 'editorconfig/editorconfig-vim'
" Whitespace removal
Plug 'ntpeters/vim-better-whitespace'
" Fancy start screen
Plug 'mhinz/vim-startify'

" Refactoring
" ------------------------------------------------------------------------------

" Make it easy to add/remove/change brackets, quotes etc
Plug 'tpope/vim-surround'
" Siblime style multicursor
Plug 'terryma/vim-multiple-cursors'

" Status bar
" ------------------------------------------------------------------------------

Plug 'liuchengxu/eleline.vim'


" Git
" ------------------------------------------------------------------------------

Plug 'tpope/vim-fugitive'

" HTML/CSS
" ------------------------------------------------------------------------------

Plug 'lepture/vim-jinja', { 'for': 'jinja' }
Plug 'slim-template/vim-slim', { 'for': ['slim', 'slime'] }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }

" Test and Debug
" ------------------------------------------------------------------------------

Plug 'joonty/vdebug', { 'on': 'VdebugStart' }
Plug 'janko-m/vim-test'


" ------------------------------------------------------------------------------
"
call plug#end()

"  General config
" ------------------------------------------------------------------------------

" Theme
silent! colorscheme jellybeans
let g:jellybeans_use_term_italics = 1

"Use 24-bit (true-color) mode in Vim/Neovim;
set termguicolors

" ------------------------------------------------------------------------------

" Set <space> to leader
let mapleader = "\<Space>"

" Turn off swapfiles
set nobackup
set nowritebackup
set nowb
set noswapfile

" With :set hidden, opening a new file when the current buffer has unsaved
" changes causes files to be hidden instead of closed
set hidden

" Lazyredraw attempts to solve Vim lag by reducing the amount of
" processing required. When enabled, any action that is not typed
" will not cause the screen to redraw
set lazyredraw
set ttyfast

" Highlight current line
set cursorline

" Indent using two spaces.
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Use spaces, not tabs
set expandtab

" Always show sign column for git icons
set signcolumn=yes

" wrap lines
set wrap

" Open new split panes to bottom, which feels more natural
set splitbelow

" Ignore case of searches
set ignorecase

" If a pattern contains an uppercase letter
" it is case sensitive, otherwise, it is not
set smartcase

" Line number
set number

setglobal nocompatible
setglobal pastetoggle=<F2>

" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" set visualbell
set completeopt=noinsert,menuone,noselect
set complete+=kspell

if has('mouse')
  set mouse=a
endif

" if has("clipboard")
"   set clipboard=unnamed " copy to the system clipboard

"   if has("unnamedplus") " X11 support
"     set clipboard+=unnamedplus
"   endif
" endif

set shortmess+=c

set nofoldenable
set linebreak
set hlsearch

" display incomplete commands
set showcmd

" Automatically :write before running commands
set autowrite

set updatetime=300
set cmdheight=2

" Start scrolling before cursor gets to the edge
set scrolloff=3
set sidescrolloff=15

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir /tmp/.vim/backups > /dev/null 2>&1
  set undodir=/tmp/.vim/backups
  set undofile
endif

""" Basics Keymaps
" ------------------------------------------------------------------------------

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
nmap j gj
nmap k gk

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Edit .vimrc
map <leader>vl :vsp $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>

""" Plugins Keymaps

nmap <C-m> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

nnoremap <leader>b :Buffers<CR>

""" Plugin Settings
" ------------------------------------------------------------------------------

" Completion
" lua << EOF
"  local nvim_lsp = require'nvim_lsp'
"  nvim_lsp.tsserver.setup{}
" EOF
" lua require'nvim_lsp'.tsserver.setup{}
" let g:deoplete#enable_at_startup = 1
" let g:vista_default_executive = 'nvim-lsp'

if executable('typescript-language-server')
  lua require'nvim_lsp'.tsserver.setup{}
  au Filetype typescript setl omnifunc=v:lua.vim.lsp.omnifunc
  cal asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
        \   'name': 'omni-typescript',
        \   'whitelist': ['typescript'],
        \   'completor': function('asyncomplete#sources#omni#completor'),
        \ }))
en

let NERDTreeShowHidden=1
let NERDTreeRemoveFileCmd='gio trash '
let NERDTreeRemoveDirCmd='gio trash '

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1



if executable('typescript-language-server')
  lua require'nvim_lsp'.tsserver.setup{}
  au Filetype typescript setl omnifunc=v:lua.vim.lsp.omnifunc
  cal asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
        \   'name': 'omni-typescript',
        \   'whitelist': ['typescript'],
        \   'completor': function('asyncomplete#sources#omni#completor'),
        \ }))
en

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

let test#strategy = "neovim"

let g:vim_markdown_folding_disabled = 1

" format the entire file
nnoremap ff :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" use RG only to search in file content
command! -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
      \   1,
      \   {'options': '--delimiter : --nth 2..'})

nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :GFiles .<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fa :Rg<CR>

let NERDTreeIgnore = ['\.pyc$', '\.retry$']

nmap <silent> // :nohlsearch<CR>
noremap <leader>hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" nnoremap <silent> <bs> <C-w><Left>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" https://neovim.io/doc/user/lsp.html
" set omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype javascript setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gs        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> 1gD       <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references({ includeDeclaration = true })<CR>
nnoremap <silent>ff         <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent><leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

vmap <leader>y "+y
nmap <leader>y "+Y
nmap <leader>p "+p

augroup file-types
  autocmd!

  " Override some syntaxes so things look better
  au BufNewFile,BufRead *.ts setlocal filetype=typescript
  au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
  autocmd BufEnter *.js setlocal ts=4 sw=4 sts=4
  autocmd BufEnter *.java setlocal ts=4 sw=4 sts=4
  autocmd BufEnter Makefile setlocal ts=4 sw=4 noexpandtab
  autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
  autocmd BufNewFile,BufRead *.slime setlocal filetype=slim
  autocmd BufNewFile,BufRead *.jsh setlocal filetype=java
augroup END


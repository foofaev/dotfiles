local apply_options = require("utils").apply_options

apply_options(
  {
    -- Boolean value
    compatible = false,
    ttyfast = true,
    lazyredraw = true, -- lazyredraw to make macro faster

    showcmd = false, -- disable mode display since lightline display
    showmatch = true, -- highlight matching [{()}]
    backup = false, -- disable backup
    cursorline = true, -- enable cursorline
    expandtab = true, -- use spaces instead of tabs
    autowrite = true, -- autowrite buffer when it's not focused
    hidden = true, -- keep hidden buffers
    hlsearch = true, -- highlight matching search
    ignorecase = true, -- case insensitive on search
    list = true, -- display listchars
    number = true, -- enable number
    relativenumber = false, -- enable relativenumber
    smartcase = true, -- improve searching using '/'
    splitbelow = true, -- split below instead of above
    splitright = true, -- split right instead of left
    startofline = false, -- don't go to the start of the line when moving to another file
    swapfile = false, -- disable swapfile
    termguicolors = true, -- truecolours for better experience
    wrap = false, -- dont wrap lines
    writebackup = false, -- disable backup
    wildignorecase = true,
    -- String value
    completeopt = "menuone,noselect", -- better completion
    encoding = "UTF-8", -- set encoding
    inccommand = "split", -- incrementally show result of command
    listchars = "tab:∘\\ ,nbsp:␣,trail:~", -- set listchars
    mouse = "nv", -- enable mouse support
    shortmess = "filnxtToOFIWc", -- disable some stuff on shortmess
    signcolumn = "no", -- disable sign column all the time, 4 column
    clipboard = "unnamedplus", -- use system clipboard
    syntax = "on", -- syntax enable
    undodir = "/tmp/",
    wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
    -- wildcharm='<C-s>',

    -- Number value
    shiftwidth = 2, -- set indentation width
    scrolloff = 8, -- make scrolling better
    sidescroll = 2, -- make scrolling better
    sidescrolloff = 15, -- make scrolling better
    tabstop = 2, -- tabsize
    timeoutlen = 400, -- faster timeout wait time
    updatetime = 300, -- set faster update time
    ttimeoutlen = 0,
    softtabstop = 2,
    textwidth = 140,
    numberwidth = 1
  }
)

local execute = vim.api.nvim_command
local cmd = vim.cmd
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(vim.fn.glob(install_path)) > 0 then
        execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

-- Only required if you have packer in your `opt` pack
cmd('packadd packer.nvim')

-- Configure Neovim to automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
cmd([[ autocmd BufWritePost **/nvim/lua/plugins/*.lua lua reload() ]])
cmd([[ autocmd BufWritePost **/nvim/lua/plugins/*.lua PackerCompile ]])

require("packer").startup({
    function()
        -- Packer can manage itself as an optional plugin
        use {"wbthomason/packer.nvim", opt = true, config = require("plugins.packer-nvim")}

        -- Coc
        use {"neoclide/coc.nvim", branch = "release", config = require("coc")}
        use "antoinemadec/coc-fzf" -- coc and fzf together

        use "OmniSharp/omnisharp-vim"

        -- Lua lsp
        -- fzf commands for lsp sources
        -- use {"neovim/nvim-lspconfig", config = require("lsp")}
        use "nvim-lua/lsp-status.nvim"
        -- use {"gfanto/fzf-lsp.nvim"}
        -- use {"hrsh7th/nvim-compe"}
        -- use {"steelsojka/completion-buffers", ft = {"python"}}
        use "hrsh7th/vim-vsnip"

        -- UI
        -- start screen
        use {"mhinz/vim-startify", config = require("plugins.vim-startify")}
        -- statusline
        -- use {"glepnir/galaxyline.nvim", config = require("plugins.galaxyline-nvim")}

        use "liuchengxu/eleline.vim"
        -- color scheme
        use 'ChristianChiarulli/nvcode-color-schemes.vim'

        use 'pangloss/vim-javascript'

        -- use 'glepnir/indent-guides.nvim'

        use {'chrisbra/csv.vim', ft = {"csv"}}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = require("plugins.nvim-treesitter")}

        use 'mbbill/undotree'

        -- Git
        use {"tpope/vim-fugitive"}

        -- fzf
        use {"junegunn/fzf", run = "./install --all"}
        use {"junegunn/fzf.vim", config = require("plugins.fzf-vim")}

        use 'wfxr/minimap.vim'

        -- File browser
        -- use {"kyazdani42/nvim-tree.lua", config = require("plugins.nvim-tree")}
        use {'scrooloose/nerdtree', config = require("plugins.nerdtree")}
        use 'Xuyuanp/nerdtree-git-plugin'

        -- Improve text objects for arguments, brackets etc
        -- Add various text objects
        use "tpope/vim-sensible"
        use "wellle/targets.vim"
        -- add bunch of mappings like ]p ]e ]<space> etc.
        use "tpope/vim-unimpaired"
        -- allows repeat via dot for some plugins like surround
        use "tpope/vim-repeat"
        -- add\update\remove surround stuff like '"{}"'
        use "tpope/vim-surround"
        -- auto placing paired signs like {} [] '' "" etc
        use "cohama/lexima.vim"
        -- plugin for vim-tmux interactions
        use {"christoomey/vim-tmux-navigator"}
        -- add commenting for different langs via gcc
        use "tpope/vim-commentary"
        -- plugin which allows vim to work with common editorconfig
        use "editorconfig/editorconfig-vim"
        use "kyazdani42/nvim-web-devicons"
        -- plugin to add completeion possibility
        -- use {"aca/completion-tabnine", run = "version=3.1.9 ./install.sh"}
        -- use {"hrsh7th/vim-vsnip", requires = "hrsh7th/vim-vsnip-integ", config = require("plugins.vim-vsnip")}
        -- smooth screen scrolling
        use "psliwka/vim-smoothie"
      end,

    config = {
           display = {
               open_fn = require("packer.util").float
           }
       }
     }
)

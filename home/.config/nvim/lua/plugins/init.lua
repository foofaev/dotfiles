local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(vim.fn.glob(install_path)) > 0 then
        execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
cmd('packadd packer.nvim')

cmd [[ autocmd BufWritePost **/nvim/lua/plugins/*.lua lua reload() ]]
cmd [[ autocmd BufWritePost **/nvim/lua/plugins/*.lua PackerCompile ]]

require("packer").startup({
    function()
        -- Packer can manage itself as an optional plugin
        use {"wbthomason/packer.nvim", opt = true, config = require("plugins.packer-nvim")}

        -- Coc
        use {"neoclide/coc.nvim", branch = "release", config = require("coc"), ft = {"javascript", "typescript", "javascriptreact", "typescriptreact", "docker", "json", "yml"}}
        use {"antoinemadec/coc-fzf", ft = {"javascript", "typescript", "javascriptreact", "typescriptreact"}, requires = {"junegunn/fzf.vim", "neoclide/coc.nvim"}} -- coc and fzf together

        -- Lua lsp
        -- fzf commands for lsp sources
        use {"neovim/nvim-lspconfig", ft = {"python"}, config = require("lsp")}
        use {"gfanto/fzf-lsp.nvim", ft = {"python"}, requires = {"junegunn/fzf.vim"}}
        -- lsp configs placed here
        use {"nvim-lua/completion-nvim", config = require("plugins.completion-nvim"), ft = "python" }
        use {"steelsojka/completion-buffers", ft = {"python"}}

        -- UI
        -- start screen
        use {"mhinz/vim-startify", config = require("plugins.vim-startify")}
        -- statusline
        use {"glepnir/galaxyline.nvim", config = require("plugins.galaxyline-nvim")}
        -- color scheme
        use "christianchiarulli/nvcode-color-schemes.vim"

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", cmd = "TSUpdate all", config = require("plugins.nvim-treesitter")}

        -- Git
        use {"tpope/vim-fugitive", config = require("plugins.vim-fugitive")}

        -- fzf
        use {"junegunn/fzf", run = "./install --all"}
        use {"junegunn/fzf.vim", config = require("plugins.fzf-vim"), requires = {"junegunn/fzf"}}

        -- File browser
        use {"kyazdani42/nvim-tree.lua", config = require("plugins.nvim-tree")}

        -- Improve text objects for arguments, brackets etc
        -- Add various text objects
        use "wellle/targets.vim"
        -- add bunch of mappings like ]p ]e ]<space> etc.
        use "tpope/vim-unimpaired"
        -- allows repeat via dot for some plugins like surround
        use "tpope/vim-repeat"
        -- add\update\remove surround stuff like '"{}"'
        use "tpope/vim-surround"
        -- whitespace removal
        use 'ntpeters/vim-better-whitespace'
        -- auto placing paired signs like {} [] '' "" etc
        use {"windwp/nvim-autopairs", config = require("plugins.vim-autopairs")}
        -- when navigate to previously opened files - open in last file position
        use "farmergreg/vim-lastplace"
        -- text object camel case word
        use {"chaoren/vim-wordmotion", config = require("plugins.vim-wordmotion")}
        -- plugin for vim-tmux interactions
        use {"christoomey/vim-tmux-navigator", config = require("plugins.vim-tmux-navigator")}
        -- add commenting for different langs via gcc
        use "tpope/vim-commentary"
        -- plugin which allows vim to work with common editorconfig
        use "editorconfig/editorconfig-vim"
        -- " database viewer
        use "tpope/vim-dadbod"
        use "kristijanhusak/vim-dadbod-ui"
        -- plugin to add completeion possibility
        -- use {"aca/completion-tabnine", run = "version=3.1.9 ./install.sh"}
        use {"hrsh7th/vim-vsnip", requires = "hrsh7th/vim-vsnip-integ", config = require("plugins.vim-vsnip")}
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

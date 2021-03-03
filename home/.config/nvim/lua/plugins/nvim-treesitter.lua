return function()
    require"nvim-treesitter.configs".setup {
        ensure_installed = {"bash", "c", "c_sharp", "cpp", "css", "html", "javascript", "jsdoc", "json", "lua", "python", "typescript"},
        highlight = {
            enable = true, -- false will disable the whole extension
            indent = {
                enable = true
            },
            use_languagetree = true
        }
    }
end

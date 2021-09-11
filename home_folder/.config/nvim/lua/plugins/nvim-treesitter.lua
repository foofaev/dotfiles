return function()
    require"nvim-treesitter.configs".setup {
        ensure_installed = {"html", "javascript", "typescript", "tsx", "json", "lua", "python", "yaml", "hcl", "dockerfile", "c_sharp", "bash"},
        highlight = {
            enable = true, -- false will disable the whole extension
        },
        indent = {
            enable = true
       },
       incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
       },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        swap = {
              enable = true,
              swap_next = {
                ["<leader>sn"] = "@parameter.inner",
              },
              swap_previous = {
                ["<leader>sp"] = "@parameter.inner",
              },
       },
       lsp_interop = {
            enable = true,
            peek_definition_code = {
              ["df"] = "@function.outer",
              ["dF"] = "@class.outer",
            },
          },
      },
    }
end

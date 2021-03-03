return function(config, on_attach)
  config.efm.setup {
      init_options = {
        documentFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true
      },
      filetypes = {"python"},
      root_dir = config.util.root_pattern(".git", vim.fn.getcwd()),
      settings = {
          languages = {
              lua = {
                  {formatCommand = "lua-format -i", formatStdin = true}
              },
              python = {
                  {  -- flake8
                      lintCommand = "flake8 --stdin-display-name ${INPUT} -",
                      lintIgnoreExitCode = true,
                      lintStdin = true,
                      lintFormats = {"%f:%l:%c: %m"},

                      -- autopep8
                      formatCommand = 'autopep8 -',
                      formatStdin = true
                  },
              }
          }
      }
  }
end

return function(config, on_attach)
  config.diagnosticls.setup{
    init_options = {
      filetypes = { python = { 'flake8' } },
      linters = {
        flake8 = {
          debounce = 100,
          sourceName = "flake8",
          command = "poetry",
          args = {
            "run",
            "flake8",
            "--format",
            "%(row)d:%(col)d:%(code)s:%(code)s: %(text)s",
            "%file",
          },
          formatPattern = {
            "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
            {
              line = 1,
              column = 2,
              message = {"[", 3, "] ", 5},
              security = 4
            }
          },
          securities = {
            E = "error",
            W = "warning",
            F = "info",
            B = "hint",
          },
        },
      },
      formatters = {
        autopep8 = {
          command = 'poetry',
          args = { 'run', 'autopep8', '--aggressive', '--experimental', '--in-place', '%filename' }
        }
      },
      formatFiletypes = {
        python = 'autopep8'
      }
    }
  }
end

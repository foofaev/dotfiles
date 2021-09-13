return function()
  local utils = require("utils")
  local fn = vim.fn
  local cmd = vim.cmd
  local api = vim.api

  -- fn.setenv("FZF_DEFAULT_OPTS", "--color=dark --reverse --keep-right --marker=+ --padding=1,1")
  -- fn.setenv("FZF_DEFAULT_COMMAND", "rg --files --hidden --glob '!.git/**'")
  -- fn.setenv(
  --   "FZF_PREVIEW_COMMAND",
  --   "COLORTERM=truecolor bat --color=always --style=plain --theme=ansi-dark -n -- {} || cat {}  --style=numbers {-1}"
  -- )

  utils.apply_globals({
    fzf_branch_actions = {
      checkout = {
        execute = 'echo system("{git} checkout " . (empty("{branch}") ? "-b {input}" : "{branch}"))',
        required = {}
      }
    },
    -- Customize fzf colors to match your color scheme
    -- fzf#wrap translates this to a set of `--color` options
    -- fzf_colors = {
    --   fg = {"fg", "Normal"},
    --   bg = {"bg", "Normal"},
    --   hl = {"fg", "Red"},
    --   ["fg+"] = {"fg", "White"},
    --   ["bg+"] = {"bg", "Normal"},
    --   ["hl+"] = {"fg", "Red"},
    --   info = {"bg", "Normal"},
    --   prompt = {"fg", "White"},
    --   pointer = {"fg", "White"},
    --   marker = {"fg", "Yellow"},
    --   spinner = {"fg", "White"},
    --   header = {"bg", "Normal"}
    -- },
    -- Enable per-command history
    -- - History files will be stored in the specified directory
    -- - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
    --   'previous-history' instead of 'down' and 'up'.
    fzf_history_dir = "~/.local/share/fzf-history",
    -- fzf_layout = {
    --   window = {
    --     width = 0.7,
    --     height = 0.35,
    --     yoffset = 0.4
    --   }
    -- },
    -- fzf_preview_window='right:50%'
    -- fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"',
    -- fzf_preview_window = {"right:50%", "ctr-p"}
    -- fzf_preview_window = ""
    -- fzf_action = {
    --   ["ctrl-t"] = "tab split",
    --   ["ctrl-x"] = "split",
    --   ["ctrl-v"] = "vsplit",
    --   ["ctrl-k"] = "silent !kitty @ launch --copy-env --cwd=current nvim"
    -- },
    -- fzf_buffers_jump = 1
  })


  -- cmd [[ command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, { "options": "--prompt '❯ '"}, <bang>0) ]]

  -- function FZFOpen(cmd_str)
  --   utils.move_cursor_from_tree()
  --   cmd(cmd_str)
  -- end

  -- -- Ctrl-p = fuzzy finder
  -- utils.map("n", "<C-P>", "<CMD>lua FZFOpen(':Files')<CR>")

  -- -- . = location of current file
  -- utils.map("n", "'.", "<CMD>lua FZFOpen(':FZF " .. fn.expand("%:h") .. "')<CR>")

  -- utils.map("n", "<leader>sw", "<CMD>lua require('utils').rg_word()<CR>")

  -- -- r = RG
  -- utils.map("n", "'r", "<CMD>lua FZFOpen(':RG')<CR>")

  -- -- z = FZF
  -- utils.map("n", "'z", "<CMD>lua FZFOpen(':FZF')<CR>")

  -- -- b = buffers
  -- utils.map("n", "'b", "<CMD>lua FZFOpen(':Buffers')<CR>")

  -- -- t = tags
  -- utils.map("n", "'t", "<CMD>lua FZFOpen(':Tags')<CR>")

  -- -- i = history
  -- utils.map("n", "'i", "<CMD>lua FZFOpen(':History')<CR>")

  -- -- h = home
  -- utils.map("n", "'h", "<CMD>lua FZFOpen(':FZF ~/')<CR>")

  -- -- g = gitfiles
  -- utils.map("n", "'g", "<CMD>lua FZFOpen(':GFiles')<CR>")

  -- -- d = diagnostics
  -- utils.map("n", "<leaderr>cd", "<CMD>lua FZFOpen(':Diagnostics')<CR>")

  api.nvim_exec(
    [[
      function! RipgrepFzf(query, fullscreen)
        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
      endfunction

      command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
        ]],
    ""
  )
  utils.map("n", "<leader>fc", ":Commits<CR>", {noremap = true})
  utils.map("n", "<leader>o", ":GFiles<CR>", {noremap = true})
  utils.map("n", "<leader>ff", ":Files<CR>", {noremap = true})
  utils.map("n", "<leader>fa", ":Rg<CR>", {noremap = true})
end

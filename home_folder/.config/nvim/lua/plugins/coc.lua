return function()
  local utils = require("utils")
  local cmd = vim.cmd
  local fn = vim.fn
  local exec = vim.api.nvim_exec

  utils.apply_globals({
    coc_config_home = "$HOME/.config/nvim/coc-settings.json"
  })

  utils.apply_globals({
    coc_global_extensions = {
      "coc-tsserver",
      "coc-jedi",
      "coc-eslint",
      "coc-prettier",
      "coc-html",
      "coc-lua",
      "coc-json",
      "coc-jest",
      "coc-lists",
      "coc-docker",
      "coc-spell-checker",
      "coc-cspell-dicts",
      "coc-yaml",
      "coc-sh",
      "coc-git"
    }
  })

  function _G.check_back_space()
    local col = fn.col(".") - 1
    if col == 0 or fn.getline("."):sub(col, col):match("%s") then
      return true
    else
      return false
    end
  end

  utils.map("i", "<TAB>", 'pumvisible() ? "<C-N>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {expr = true})
  utils.map("i", "<S-TAB>", 'pumvisible() ? "<C-P>" : "<C-H>"', {expr = true})

  utils.map("i", "<CR>", 'pumvisible() ? coc#_select_confirm() : "<C-G>u<CR><C-R>=coc#on_enter()<CR>"', {expr = true})

  function show_docs()
    local cw = fn.expand("<cword>")
    if fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
      cmd("h " .. cw)
    elseif vim.api.nvim_eval("coc#rpc#ready()") then
      fn.CocActionAsync("doHover")
    else
      cmd("!" .. vim.o.keywordprg .. " " .. cw)
    end
  end

  utils.map("n", "K", "<CMD>lua show_docs()<CR>")

  utils.map("n", "<leader>cx", ":CocRestart<CR>", {silent = true})
  utils.map("n", "<Esc>", "coc#float#close_all()", {silent = true})

  -- Use `[e` and `]e` to navigate diagnostics
  -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  utils.map("n", "[e", "<Plug>(coc-diagnostic-prev)", {noremap = false})
  utils.map("n", "]e", "<Plug>(coc-diagnostic-next)", {noremap = false})

  -- Multiple Cursors support
  utils.map("n", "gw", "<Plug>(coc-cursors-word)", {noremap = false})

  -- GoTo code navigation.
  utils.map("n", "gd", "<Plug>(coc-definition)", {noremap = false})
  utils.map("n", "gy", "<Plug>(coc-type-definition)", {noremap = false})
  utils.map("n", "gi", "<Plug>(coc-implementation)", {noremap = false})
  utils.map("n", "gr", "<Plug>(coc-references)", {noremap = false})

  -- Symbol renaming.
  utils.map("n", "<leader>rn", "<Plug>(coc-rename)", {noremap = false})

  -- Formatting selected code.
  utils.map("x", "<leader>fs", "<Plug>(coc-format-selected)", {noremap = false})
  utils.map("n", "<leader>fs", "<Plug>(coc-format-selected)", {noremap = false})
  -- map("v", "<leader>f", "<Plug>(coc-format-selected)", {noremap = false})

  -- Applying codeAction to the selected region.
  -- Example: `<leader>caap` for current paragraph
  utils.map("x", "<leader>ac", "<Plug>(coc-codeaction-selected)", {noremap = false})
  utils.map("n", "<leader>ac", "<Plug>(coc-codeaction-selected)", {noremap = false})

  -- Remap keys for applying codeAction to the current buffer.
  utils.map("n", "<leader>a", "<Plug>(coc-codeaction)", {noremap = false})

  -- Apply AutoFix to problem on the current line.
  utils.map("n", "<leader>qf", "<Plug>(coc-fix-current)", {noremap = false})

  -- Map function and class text objects
  -- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  utils.map("x", "if", "<Plug>(coc-funcobj-i)", {noremap = false})
  utils.map("o", "if", "<Plug>(coc-funcobj-i)", {noremap = false})
  utils.map("x", "af", "<Plug>(coc-funcobj-a)", {noremap = false})
  utils.map("o", "af", "<Plug>(coc-funcobj-a)", {noremap = false})

  utils.map("x", "ic", "<Plug>(coc-classobj-i)", {noremap = false})
  utils.map("o", "ic", "<Plug>(coc-classobj-i)", {noremap = false})
  utils.map("x", "ac", "<Plug>(coc-classobj-a)", {noremap = false})
  utils.map("o", "ac", "<Plug>(coc-classobj-a)", {noremap = false})

  -- Remap <C-F> and <C-B> for scroll float windows/popups.
  utils.map("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', {expr = true})
  utils.map("i", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<Right>"', {expr = true})
  utils.map("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', {expr = true})
  utils.map("i", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<Left>"', {expr = true})

  -- Use CTRL-S for selections ranges.
  -- Requires 'textDocument/selectionRange' support of language server.
  -- map("n", "<C-S>", "<Plug>(coc-range-select)", {noremap = false})
  -- map("x", "<C-S>", "<Plug>(coc-range-select)", {noremap = false})

  -- Mappings for CoCList
  -- Show all diagnostics.
  utils.map("n", "<leader>cd", ":CocFzfList diagnostics<CR>", {})
  -- Show commands.
  utils.map("n", "<leader>cc", ":CocFzfList commands<CR>", {})
  -- Show extensions.
  utils.map("n", "<leader>ce", ":CocFzfList extensions<CR>", {})
  -- Find symbol of current document.
  utils.map("n", "<leader>co", ":CocFzfList outline<CR>", {})
  -- Search workspace symbols.
  utils.map("n", "<leader>cs", ":CocFzfList -I symbols<CR>")
  -- Open settings
  utils.map("n", "<leader>c.", ":CocConfig<CR>", {})

  exec([[
      augroup mygroup
        autocmd!
        autocmd FileType javascript,javascriptreact,javascript.jsx,json setl formatexpr=CocActionAsync('formatSelected')
      augroup end

      command! -nargs=0 Prettier :CocCommand prettier.formatFile

      command! -nargs=0 CocFormat :call CocActionAsync('format')

      command! -nargs=0 Jest :call CocActionAsync('runCommand', 'jest.projectTest')

      command! -nargs=0 JestCurrent :call CocActionAsync('runCommand', 'jest.fileTest', ['%'])

      command! -nargs=0 JestNearest :call CocActionAsync('runCommand', 'jest.singleTest')<CR>

      command! JestInit :call CocActionAsync('runCommand', 'jest.init')

  ]],
    ""
  )
end
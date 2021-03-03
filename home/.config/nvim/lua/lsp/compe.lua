return function()
  local map = require "utils".map
  local protocol = require "vim.lsp.protocol"

  require "compe".setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = "always";
    source_timeout = 200;
    incomplete_delay = 400;
    allow_prefix_unmatch = false;
    documentation = true;
    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = true;
      treesitter = true;
    };
  }

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
      return true
    else
      return false
    end
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
      return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn["compe#complete"]()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
      return t "<Plug>(vsnip-jump-prev)"
    else
      return t "<S-Tab>"
    end
  end

  map("i", "<CR>", "compe#confirm('<CR>')", {expr = true})

  map("i", "<Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})
  map("s", "<Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})

  map("i", "<S-Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})
  map("s", "<S-Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})

  map("i", "C-u", "compe#scroll({ 'delta': +4 })", {noremap = false, expr = true})
  map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = false, expr = true})
end

return function()
  local utils = require("utils")
  -- cmd("imap <expr> <c-l> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<c-l>'")
  -- cmd("imap <expr> <tab> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<tab>'")
  utils.map("i", "<c-l>", "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<c-l>'", { expr = true})
  utils.map("i", "<tab>", "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<tab>'", { expr = true})
  utils.apply_globals({
      vsnip_snippet_dir = vim.fn.stdpath("config") .. "/vsnip"
  })
end

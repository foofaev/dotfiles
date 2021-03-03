return function()
  local lsp_config = require("lspconfig")
  local general_on_attach = require("lsp.on_attach")

  -- require("lsp.compe")()
  require("lsp.commands")()
  require("lsp.settings")()
  for _, server in pairs({"efm"}) do
    require("lsp.servers." .. server)(lsp_config, general_on_attach)
  end

end

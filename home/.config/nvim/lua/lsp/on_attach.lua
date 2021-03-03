local utils = require("utils")

return function(client, bufnr)
    local options = {noremap = true, silent = true}
    if client.resolved_capabilities.hover then
        utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
    end
    if client.resolved_capabilities.find_references then
        utils.map("n", "gr", "<cmd>References<CR>", options)
    end
    utils.map("n", "gi", "<cmd>Implementations<CR>", options)
    if client.resolved_capabilities.goto_definition then
        utils.map("n", "gd", "<cmd>Definitions<CR>", options)
    end
    if client.resolved_capabilities.rename then
        utils.map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
    end
    utils.map("n", "<leader>a", "<cmd>CodeActions<cr>", options)
    utils.map("n", "'D", "<cmd>Diagnostics<CR>", options)
    utils.map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { show_header = false } })<CR>", options)
    utils.map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { show_header = false } })<CR>", options)

    utils.au("CursorMovedI", "*", "lua vim.lsp.buf.signature_help()")
    utils.au("CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })")

    local function preview_location_callback(_, _, result)
      if result == nil or vim.tbl_isempty(result) then
        return nil
      end
      vim.lsp.util.preview_location(result[1])
    end

    function PeekDefinition()
      local params = vim.lsp.util.make_position_params()
      return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
    end

    print(vim.fn.getcwd())
    print("'" .. client.name .. "' server attached")
end

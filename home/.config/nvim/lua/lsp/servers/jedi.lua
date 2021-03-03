return function(config, on_attach)
    local bin_path = '/home/foofaev/.python_neovim/neovim3/bin/jedi-language-server'
    config['jedi_language_server'].setup {
        cmd = {bin_path},
        filetypes = {"python"},
        root_dir = config.util.root_pattern(".git", vim.fn.getcwd()),
        on_attach = on_attach
    }
end

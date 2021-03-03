return function()
  local apply_globals = require("utils").apply_globals

  apply_globals({
    coc_config_home = "$HOME/.config/nvim/lua/coc/"
  })

  require("coc.coc")
end

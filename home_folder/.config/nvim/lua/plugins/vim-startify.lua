return function()
  local utils = require("utils")
  utils.apply_globals({
      -- don't change cwd to file dir
      startify_change_to_dir = false
  })
end

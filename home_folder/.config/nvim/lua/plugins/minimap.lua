return function()
  local utils = require('utils');
  utils.apply_globals({
    minimap_auto_start = 1;
    minimap_auto_start_win_enter = true;
  });
end

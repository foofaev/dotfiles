return function()
  local utils = require("utils")
  utils.map("n", '<C-m>', ':NERDTreeFind<CR>', {})
  utils.map("n", '<leader><leader>', ':NERDTreeToggle<CR>', { silent = true })
  utils.apply_globals({
    NERDTreeShowHidden = 1
  })

  if vim.fn.executable('gio') == 1 then
    utils.apply_globals({
      NERDTreeRemoveFileCmd='gio trash ',
      NERDTreeRemoveDirCmd='gio trash '
    })
  end

  if vim.fn.executable('rmtrash') == 1 then
    utils.apply_globals({
      NERDTreeRemoveFileCmd='rmtrash ',
      NERDTreeRemoveDirCmd='rmtrash '
    })
  end
end


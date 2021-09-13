-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/foofaev/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/foofaev/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/foofaev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/foofaev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/foofaev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["any-jump.vim"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/any-jump.vim"
  },
  ["coc-fzf"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/coc-fzf"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\n–\1\0\0\6\1\6\2\28-\0\0\0009\0\0\0'\2\1\0B\0\2\2\23\0\0\0\b\0\1\0X\1\15€-\1\0\0009\1\2\1'\3\1\0B\1\2\2\18\3\1\0009\1\3\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\4\1'\4\5\0B\1\3\2\15\0\1\0X\2\3€+\1\2\0L\1\2\0X\1\2€+\1\1\0L\1\2\0K\0\1\0\2À\a%s\nmatch\bsub\fgetline\6.\bcol\2\0®\2\0\0\a\2\17\0*-\0\0\0009\0\0\0'\2\1\0B\0\2\2-\1\0\0009\1\2\0015\3\3\0006\4\4\0009\4\5\0049\4\6\4B\1\3\2)\2\0\0\3\2\1\0X\1\6€-\1\1\0'\3\a\0\18\4\0\0&\3\4\3B\1\2\1X\1\21€6\1\4\0009\1\b\0019\1\t\1'\3\n\0B\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\v\1'\3\f\0B\1\2\1X\1\t€-\1\1\0'\3\r\0006\4\4\0009\4\14\0049\4\15\4'\5\16\0\18\6\0\0&\3\6\3B\1\2\1K\0\1\0\2À\1À\6 \15keywordprg\6o\6!\fdoHover\19CocActionAsync\20coc#rpc#ready()\14nvim_eval\bapi\ah \rfiletype\abo\bvim\1\3\0\0\bvim\thelp\nindex\f<cword>\vexpand“\28\1\0\n\0u\0ÿ\0016\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\2\2\0009\2\4\0026\3\2\0009\3\5\0039\3\6\0039\4\a\0005\6\b\0B\4\2\0019\4\a\0005\6\n\0005\a\t\0=\a\v\6B\4\2\0016\4\f\0003\5\14\0=\5\r\0049\4\15\0'\6\16\0'\a\17\0'\b\18\0005\t\19\0B\4\5\0019\4\15\0'\6\16\0'\a\20\0'\b\21\0005\t\22\0B\4\5\0019\4\15\0'\6\16\0'\a\23\0'\b\24\0005\t\25\0B\4\5\0013\4\26\0007\4\27\0009\4\15\0'\6\28\0'\a\29\0'\b\30\0B\4\4\0019\4\15\0'\6\28\0'\a\31\0'\b \0005\t!\0B\4\5\0019\4\15\0'\6\28\0'\a\"\0'\b#\0005\t$\0B\4\5\0019\4\15\0'\6\28\0'\a%\0'\b&\0005\t'\0B\4\5\0019\4\15\0'\6\28\0'\a(\0'\b)\0005\t*\0B\4\5\0019\4\15\0'\6\28\0'\a+\0'\b,\0005\t-\0B\4\5\0019\4\15\0'\6\28\0'\a.\0'\b/\0005\t0\0B\4\5\0019\4\15\0'\6\28\0'\a1\0'\b2\0005\t3\0B\4\5\0019\4\15\0'\6\28\0'\a4\0'\b5\0005\t6\0B\4\5\0019\4\15\0'\6\28\0'\a7\0'\b8\0005\t9\0B\4\5\0019\4\15\0'\6\28\0'\a:\0'\b;\0005\t<\0B\4\5\0019\4\15\0'\6=\0'\a>\0'\b?\0005\t@\0B\4\5\0019\4\15\0'\6\28\0'\a>\0'\b?\0005\tA\0B\4\5\0019\4\15\0'\6=\0'\aB\0'\bC\0005\tD\0B\4\5\0019\4\15\0'\6\28\0'\aB\0'\bC\0005\tE\0B\4\5\0019\4\15\0'\6\28\0'\aF\0'\bG\0005\tH\0B\4\5\0019\4\15\0'\6\28\0'\aI\0'\bJ\0005\tK\0B\4\5\0019\4\15\0'\6=\0'\aL\0'\bM\0005\tN\0B\4\5\0019\4\15\0'\6O\0'\aL\0'\bM\0005\tP\0B\4\5\0019\4\15\0'\6=\0'\aQ\0'\bR\0005\tS\0B\4\5\0019\4\15\0'\6O\0'\aQ\0'\bR\0005\tT\0B\4\5\0019\4\15\0'\6=\0'\aU\0'\bV\0005\tW\0B\4\5\0019\4\15\0'\6O\0'\aU\0'\bV\0005\tX\0B\4\5\0019\4\15\0'\6=\0'\aY\0'\bZ\0005\t[\0B\4\5\0019\4\15\0'\6O\0'\aY\0'\bZ\0005\t\\\0B\4\5\0019\4\15\0'\6\28\0'\a]\0'\b^\0005\t_\0B\4\5\0019\4\15\0'\6\16\0'\a]\0'\b`\0005\ta\0B\4\5\0019\4\15\0'\6\28\0'\ab\0'\bc\0005\td\0B\4\5\0019\4\15\0'\6\16\0'\ab\0'\be\0005\tf\0B\4\5\0019\4\15\0'\6\28\0'\ag\0'\bh\0004\t\0\0B\4\5\0019\4\15\0'\6\28\0'\ai\0'\bj\0004\t\0\0B\4\5\0019\4\15\0'\6\28\0'\ak\0'\bl\0004\t\0\0B\4\5\0019\4\15\0'\6\28\0'\am\0'\bn\0004\t\0\0B\4\5\0019\4\15\0'\6\28\0'\ao\0'\bp\0B\4\4\0019\4\15\0'\6\28\0'\aq\0'\br\0004\t\0\0B\4\5\1\18\4\3\0'\6s\0'\at\0B\4\3\0012\0\0€K\0\1\0\5›\5      augroup mygroup\n        autocmd!\n        autocmd FileType javascript,javascriptreact,javascript.jsx,json setl formatexpr=CocActionAsync('formatSelected')\n      augroup end\n\n      command! -nargs=0 Prettier :CocCommand prettier.formatFile\n\n      command! -nargs=0 CocFormat :call CocActionAsync('format')\n\n      command! -nargs=0 Jest :call CocActionAsync('runCommand', 'jest.projectTest')\n\n      command! -nargs=0 JestCurrent :call CocActionAsync('runCommand', 'jest.fileTest', ['%'])\n\n      command! -nargs=0 JestNearest :call CocActionAsync('runCommand', 'jest.singleTest')<CR>\n\n      command! JestInit :call CocActionAsync('runCommand', 'jest.init')\n\n  \19:CocConfig<CR>\15<leader>c.\31:CocFzfList -I symbols<CR>\15<leader>cs\28:CocFzfList outline<CR>\15<leader>co\31:CocFzfList extensions<CR>\15<leader>ce\29:CocFzfList commands<CR>\15<leader>cc :CocFzfList diagnostics<CR>\15<leader>cd\1\0\1\texpr\2<coc#float#has_scroll() ? coc#float#scroll(0) : \"<Left>\"\1\0\1\texpr\2;coc#float#has_scroll() ? coc#float#scroll(0) : \"<C-b>\"\n<C-b>\1\0\1\texpr\2=coc#float#has_scroll() ? coc#float#scroll(1) : \"<Right>\"\1\0\1\texpr\2;coc#float#has_scroll() ? coc#float#scroll(1) : \"<C-f>\"\n<C-f>\1\0\1\fnoremap\1\1\0\1\fnoremap\1\27<Plug>(coc-classobj-a)\aac\1\0\1\fnoremap\1\1\0\1\fnoremap\1\27<Plug>(coc-classobj-i)\aic\1\0\1\fnoremap\1\1\0\1\fnoremap\1\26<Plug>(coc-funcobj-a)\aaf\1\0\1\fnoremap\1\6o\1\0\1\fnoremap\1\26<Plug>(coc-funcobj-i)\aif\1\0\1\fnoremap\1\28<Plug>(coc-fix-current)\15<leader>qf\1\0\1\fnoremap\1\27<Plug>(coc-codeaction)\14<leader>a\1\0\1\fnoremap\1\1\0\1\fnoremap\1$<Plug>(coc-codeaction-selected)\15<leader>ac\1\0\1\fnoremap\1\1\0\1\fnoremap\1 <Plug>(coc-format-selected)\15<leader>fs\6x\1\0\1\fnoremap\1\23<Plug>(coc-rename)\15<leader>rn\1\0\1\fnoremap\1\27<Plug>(coc-references)\agr\1\0\1\fnoremap\1\31<Plug>(coc-implementation)\agi\1\0\1\fnoremap\1 <Plug>(coc-type-definition)\agy\1\0\1\fnoremap\1\27<Plug>(coc-definition)\agd\1\0\1\fnoremap\1\29<Plug>(coc-cursors-word)\agw\1\0\1\fnoremap\1 <Plug>(coc-diagnostic-next)\a]e\1\0\1\fnoremap\1 <Plug>(coc-diagnostic-prev)\a[e\1\0\1\vsilent\2\26coc#float#close_all()\n<Esc>\1\0\1\vsilent\2\20:CocRestart<CR>\15<leader>cx\29<CMD>lua show_docs()<CR>\6K\6n\14show_docs\0\1\0\1\texpr\2Ppumvisible() ? coc#_select_confirm() : \"<C-G>u<CR><C-R>=coc#on_enter()<CR>\"\t<CR>\1\0\1\texpr\2%pumvisible() ? \"<C-P>\" : \"<C-H>\"\f<S-TAB>\1\0\1\texpr\2Ppumvisible() ? \"<C-N>\" : v:lua.check_back_space() ? \"<TAB>\" : coc#refresh()\n<TAB>\6i\bmap\0\21check_back_space\a_G\26coc_global_extensions\1\0\0\1\16\0\0\17coc-tsserver\rcoc-jedi\15coc-eslint\17coc-prettier\rcoc-html\fcoc-lua\rcoc-json\rcoc-jest\14coc-lists\15coc-docker\22coc-spell-checker\21coc-cspell-dicts\rcoc-yaml\vcoc-sh\fcoc-git\1\0\1\20coc_config_home)$HOME/.config/nvim/coc-settings.json\18apply_globals\14nvim_exec\bapi\afn\bcmd\bvim\nutils\frequire\0" },
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["csv.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/opt/csv.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["eleline.vim"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/eleline.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n÷\b\0\0\n\0\30\0/6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\2\2\0009\2\4\0026\3\2\0009\3\5\0039\4\6\0005\6\v\0005\a\t\0005\b\a\0004\t\0\0=\t\b\b=\b\n\a=\a\f\6B\4\2\0019\4\r\3'\6\14\0'\a\15\0B\4\3\0019\4\16\0'\6\17\0'\a\18\0'\b\19\0005\t\20\0B\4\5\0019\4\16\0'\6\17\0'\a\21\0'\b\22\0005\t\23\0B\4\5\0019\4\16\0'\6\17\0'\a\24\0'\b\25\0005\t\26\0B\4\5\0019\4\16\0'\6\17\0'\a\27\0'\b\28\0005\t\29\0B\4\5\1K\0\1\0\1\0\1\fnoremap\2\f:Rg<CR>\15<leader>fa\1\0\1\fnoremap\2\15:Files<CR>\15<leader>ff\1\0\1\fnoremap\2\16:GFiles<CR>\14<leader>o\1\0\1\fnoremap\2\17:Commits<CR>\15<leader>fc\6n\bmap\5Â\4      function! RipgrepFzf(query, fullscreen)\n        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'\n        let initial_command = printf(command_fmt, shellescape(a:query))\n        let reload_command = printf(command_fmt, '{q}')\n        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}\n        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)\n      endfunction\n\n      command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)\n        \14nvim_exec\23fzf_branch_actions\1\0\1\20fzf_history_dir\31~/.local/share/fzf-history\rcheckout\1\0\0\rrequired\1\0\1\fexecuteUecho system(\"{git} checkout \" . (empty(\"{branch}\") ? \"-b {input}\" : \"{branch}\"))\18apply_globals\bapi\bcmd\afn\bvim\nutils\frequire\0" },
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["minimap.vim"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/minimap.vim"
  },
  nerdtree = {
    config = { "\27LJ\2\nÈ\3\0\0\a\0\18\1'6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0'\5\5\0004\6\0\0B\1\5\0019\1\2\0'\3\3\0'\4\6\0'\5\a\0005\6\b\0B\1\5\0019\1\t\0005\3\n\0B\1\2\0016\1\v\0009\1\f\0019\1\r\1'\3\14\0B\1\2\2\t\1\0\0X\1\3€9\1\t\0005\3\15\0B\1\2\0016\1\v\0009\1\f\0019\1\r\1'\3\16\0B\1\2\2\t\1\0\0X\1\3€9\1\t\0005\3\17\0B\1\2\1K\0\1\0\1\0\2\25NERDTreeRemoveDirCmd\rrmtrash \26NERDTreeRemoveFileCmd\rrmtrash \frmtrash\1\0\2\25NERDTreeRemoveDirCmd\15gio trash \26NERDTreeRemoveFileCmd\15gio trash \bgio\15executable\afn\bvim\1\0\1\23NERDTreeShowHidden\3\1\18apply_globals\1\0\1\vsilent\2\24:NERDTreeToggle<CR>\21<leader><leader>\22:NERDTreeFind<CR>\n<C-m>\6n\bmap\nutils\frequire\2\0" },
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\ná\5\0\0\6\0\29\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\0025\3\16\0005\4\14\0005\5\15\0=\5\f\4=\4\17\0035\4\18\0005\5\19\0=\5\20\0045\5\21\0=\5\22\4=\4\23\0035\4\24\0005\5\25\0=\5\26\4=\4\27\3=\3\28\2B\0\2\1K\0\1\0\16textobjects\16lsp_interop\25peek_definition_code\1\0\2\adF\17@class.outer\adf\20@function.outer\1\0\1\venable\2\tswap\18swap_previous\1\0\1\15<leader>sp\21@parameter.inner\14swap_next\1\0\1\15<leader>sn\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\1\0\4\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aic\17@class.inner\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\r\0\0\thtml\15javascript\15typescript\btsx\tjson\blua\vpython\tyaml\bhcl\15dockerfile\fc_sharp\tbash\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!cnoreabbrev psync PackerSync\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  undotree = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-caddyfile"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-caddyfile"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-jsdoc"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-jsdoc"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\nZ\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\1\27startify_change_to_dir\1\18apply_globals\nutils\frequire\0" },
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vagrant"] = {
    loaded = true,
    path = "/home/foofaev/.local/share/nvim/site/pack/packer/start/vim-vagrant"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\0\6\1\6\2\28-\0\0\0009\0\0\0'\2\1\0B\0\2\2\23\0\0\0\b\0\1\0X\1\15€-\1\0\0009\1\2\1'\3\1\0B\1\2\2\18\3\1\0009\1\3\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\4\1'\4\5\0B\1\3\2\15\0\1\0X\2\3€+\1\2\0L\1\2\0X\1\2€+\1\1\0L\1\2\0K\0\1\0\2À\a%s\nmatch\bsub\fgetline\6.\bcol\2\0®\2\0\0\a\2\17\0*-\0\0\0009\0\0\0'\2\1\0B\0\2\2-\1\0\0009\1\2\0015\3\3\0006\4\4\0009\4\5\0049\4\6\4B\1\3\2)\2\0\0\3\2\1\0X\1\6€-\1\1\0'\3\a\0\18\4\0\0&\3\4\3B\1\2\1X\1\21€6\1\4\0009\1\b\0019\1\t\1'\3\n\0B\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\v\1'\3\f\0B\1\2\1X\1\t€-\1\1\0'\3\r\0006\4\4\0009\4\14\0049\4\15\4'\5\16\0\18\6\0\0&\3\6\3B\1\2\1K\0\1\0\2À\1À\6 \15keywordprg\6o\6!\fdoHover\19CocActionAsync\20coc#rpc#ready()\14nvim_eval\bapi\ah \rfiletype\abo\bvim\1\3\0\0\bvim\thelp\nindex\f<cword>\vexpand“\28\1\0\n\0u\0ÿ\0016\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\2\2\0009\2\4\0026\3\2\0009\3\5\0039\3\6\0039\4\a\0005\6\b\0B\4\2\0019\4\a\0005\6\n\0005\a\t\0=\a\v\6B\4\2\0016\4\f\0003\5\14\0=\5\r\0049\4\15\0'\6\16\0'\a\17\0'\b\18\0005\t\19\0B\4\5\0019\4\15\0'\6\16\0'\a\20\0'\b\21\0005\t\22\0B\4\5\0019\4\15\0'\6\16\0'\a\23\0'\b\24\0005\t\25\0B\4\5\0013\4\26\0007\4\27\0009\4\15\0'\6\28\0'\a\29\0'\b\30\0B\4\4\0019\4\15\0'\6\28\0'\a\31\0'\b \0005\t!\0B\4\5\0019\4\15\0'\6\28\0'\a\"\0'\b#\0005\t$\0B\4\5\0019\4\15\0'\6\28\0'\a%\0'\b&\0005\t'\0B\4\5\0019\4\15\0'\6\28\0'\a(\0'\b)\0005\t*\0B\4\5\0019\4\15\0'\6\28\0'\a+\0'\b,\0005\t-\0B\4\5\0019\4\15\0'\6\28\0'\a.\0'\b/\0005\t0\0B\4\5\0019\4\15\0'\6\28\0'\a1\0'\b2\0005\t3\0B\4\5\0019\4\15\0'\6\28\0'\a4\0'\b5\0005\t6\0B\4\5\0019\4\15\0'\6\28\0'\a7\0'\b8\0005\t9\0B\4\5\0019\4\15\0'\6\28\0'\a:\0'\b;\0005\t<\0B\4\5\0019\4\15\0'\6=\0'\a>\0'\b?\0005\t@\0B\4\5\0019\4\15\0'\6\28\0'\a>\0'\b?\0005\tA\0B\4\5\0019\4\15\0'\6=\0'\aB\0'\bC\0005\tD\0B\4\5\0019\4\15\0'\6\28\0'\aB\0'\bC\0005\tE\0B\4\5\0019\4\15\0'\6\28\0'\aF\0'\bG\0005\tH\0B\4\5\0019\4\15\0'\6\28\0'\aI\0'\bJ\0005\tK\0B\4\5\0019\4\15\0'\6=\0'\aL\0'\bM\0005\tN\0B\4\5\0019\4\15\0'\6O\0'\aL\0'\bM\0005\tP\0B\4\5\0019\4\15\0'\6=\0'\aQ\0'\bR\0005\tS\0B\4\5\0019\4\15\0'\6O\0'\aQ\0'\bR\0005\tT\0B\4\5\0019\4\15\0'\6=\0'\aU\0'\bV\0005\tW\0B\4\5\0019\4\15\0'\6O\0'\aU\0'\bV\0005\tX\0B\4\5\0019\4\15\0'\6=\0'\aY\0'\bZ\0005\t[\0B\4\5\0019\4\15\0'\6O\0'\aY\0'\bZ\0005\t\\\0B\4\5\0019\4\15\0'\6\28\0'\a]\0'\b^\0005\t_\0B\4\5\0019\4\15\0'\6\16\0'\a]\0'\b`\0005\ta\0B\4\5\0019\4\15\0'\6\28\0'\ab\0'\bc\0005\td\0B\4\5\0019\4\15\0'\6\16\0'\ab\0'\be\0005\tf\0B\4\5\0019\4\15\0'\6\28\0'\ag\0'\bh\0004\t\0\0B\4\5\0019\4\15\0'\6\28\0'\ai\0'\bj\0004\t\0\0B\4\5\0019\4\15\0'\6\28\0'\ak\0'\bl\0004\t\0\0B\4\5\0019\4\15\0'\6\28\0'\am\0'\bn\0004\t\0\0B\4\5\0019\4\15\0'\6\28\0'\ao\0'\bp\0B\4\4\0019\4\15\0'\6\28\0'\aq\0'\br\0004\t\0\0B\4\5\1\18\4\3\0'\6s\0'\at\0B\4\3\0012\0\0€K\0\1\0\5›\5      augroup mygroup\n        autocmd!\n        autocmd FileType javascript,javascriptreact,javascript.jsx,json setl formatexpr=CocActionAsync('formatSelected')\n      augroup end\n\n      command! -nargs=0 Prettier :CocCommand prettier.formatFile\n\n      command! -nargs=0 CocFormat :call CocActionAsync('format')\n\n      command! -nargs=0 Jest :call CocActionAsync('runCommand', 'jest.projectTest')\n\n      command! -nargs=0 JestCurrent :call CocActionAsync('runCommand', 'jest.fileTest', ['%'])\n\n      command! -nargs=0 JestNearest :call CocActionAsync('runCommand', 'jest.singleTest')<CR>\n\n      command! JestInit :call CocActionAsync('runCommand', 'jest.init')\n\n  \19:CocConfig<CR>\15<leader>c.\31:CocFzfList -I symbols<CR>\15<leader>cs\28:CocFzfList outline<CR>\15<leader>co\31:CocFzfList extensions<CR>\15<leader>ce\29:CocFzfList commands<CR>\15<leader>cc :CocFzfList diagnostics<CR>\15<leader>cd\1\0\1\texpr\2<coc#float#has_scroll() ? coc#float#scroll(0) : \"<Left>\"\1\0\1\texpr\2;coc#float#has_scroll() ? coc#float#scroll(0) : \"<C-b>\"\n<C-b>\1\0\1\texpr\2=coc#float#has_scroll() ? coc#float#scroll(1) : \"<Right>\"\1\0\1\texpr\2;coc#float#has_scroll() ? coc#float#scroll(1) : \"<C-f>\"\n<C-f>\1\0\1\fnoremap\1\1\0\1\fnoremap\1\27<Plug>(coc-classobj-a)\aac\1\0\1\fnoremap\1\1\0\1\fnoremap\1\27<Plug>(coc-classobj-i)\aic\1\0\1\fnoremap\1\1\0\1\fnoremap\1\26<Plug>(coc-funcobj-a)\aaf\1\0\1\fnoremap\1\6o\1\0\1\fnoremap\1\26<Plug>(coc-funcobj-i)\aif\1\0\1\fnoremap\1\28<Plug>(coc-fix-current)\15<leader>qf\1\0\1\fnoremap\1\27<Plug>(coc-codeaction)\14<leader>a\1\0\1\fnoremap\1\1\0\1\fnoremap\1$<Plug>(coc-codeaction-selected)\15<leader>ac\1\0\1\fnoremap\1\1\0\1\fnoremap\1 <Plug>(coc-format-selected)\15<leader>fs\6x\1\0\1\fnoremap\1\23<Plug>(coc-rename)\15<leader>rn\1\0\1\fnoremap\1\27<Plug>(coc-references)\agr\1\0\1\fnoremap\1\31<Plug>(coc-implementation)\agi\1\0\1\fnoremap\1 <Plug>(coc-type-definition)\agy\1\0\1\fnoremap\1\27<Plug>(coc-definition)\agd\1\0\1\fnoremap\1\29<Plug>(coc-cursors-word)\agw\1\0\1\fnoremap\1 <Plug>(coc-diagnostic-next)\a]e\1\0\1\fnoremap\1 <Plug>(coc-diagnostic-prev)\a[e\1\0\1\vsilent\2\26coc#float#close_all()\n<Esc>\1\0\1\vsilent\2\20:CocRestart<CR>\15<leader>cx\29<CMD>lua show_docs()<CR>\6K\6n\14show_docs\0\1\0\1\texpr\2Ppumvisible() ? coc#_select_confirm() : \"<C-G>u<CR><C-R>=coc#on_enter()<CR>\"\t<CR>\1\0\1\texpr\2%pumvisible() ? \"<C-P>\" : \"<C-H>\"\f<S-TAB>\1\0\1\texpr\2Ppumvisible() ? \"<C-N>\" : v:lua.check_back_space() ? \"<TAB>\" : coc#refresh()\n<TAB>\6i\bmap\0\21check_back_space\a_G\26coc_global_extensions\1\0\0\1\16\0\0\17coc-tsserver\rcoc-jedi\15coc-eslint\17coc-prettier\rcoc-html\fcoc-lua\rcoc-json\rcoc-jest\14coc-lists\15coc-docker\22coc-spell-checker\21coc-cspell-dicts\rcoc-yaml\vcoc-sh\fcoc-git\1\0\1\20coc_config_home)$HOME/.config/nvim/coc-settings.json\18apply_globals\14nvim_exec\bapi\afn\bcmd\bvim\nutils\frequire\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\n÷\b\0\0\n\0\30\0/6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\2\2\0009\2\4\0026\3\2\0009\3\5\0039\4\6\0005\6\v\0005\a\t\0005\b\a\0004\t\0\0=\t\b\b=\b\n\a=\a\f\6B\4\2\0019\4\r\3'\6\14\0'\a\15\0B\4\3\0019\4\16\0'\6\17\0'\a\18\0'\b\19\0005\t\20\0B\4\5\0019\4\16\0'\6\17\0'\a\21\0'\b\22\0005\t\23\0B\4\5\0019\4\16\0'\6\17\0'\a\24\0'\b\25\0005\t\26\0B\4\5\0019\4\16\0'\6\17\0'\a\27\0'\b\28\0005\t\29\0B\4\5\1K\0\1\0\1\0\1\fnoremap\2\f:Rg<CR>\15<leader>fa\1\0\1\fnoremap\2\15:Files<CR>\15<leader>ff\1\0\1\fnoremap\2\16:GFiles<CR>\14<leader>o\1\0\1\fnoremap\2\17:Commits<CR>\15<leader>fc\6n\bmap\5Â\4      function! RipgrepFzf(query, fullscreen)\n        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'\n        let initial_command = printf(command_fmt, shellescape(a:query))\n        let reload_command = printf(command_fmt, '{q}')\n        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}\n        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)\n      endfunction\n\n      command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)\n        \14nvim_exec\23fzf_branch_actions\1\0\1\20fzf_history_dir\31~/.local/share/fzf-history\rcheckout\1\0\0\rrequired\1\0\1\fexecuteUecho system(\"{git} checkout \" . (empty(\"{branch}\") ? \"-b {input}\" : \"{branch}\"))\18apply_globals\bapi\bcmd\afn\bvim\nutils\frequire\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: nerdtree
time([[Config for nerdtree]], true)
try_loadstring("\27LJ\2\nÈ\3\0\0\a\0\18\1'6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0'\5\5\0004\6\0\0B\1\5\0019\1\2\0'\3\3\0'\4\6\0'\5\a\0005\6\b\0B\1\5\0019\1\t\0005\3\n\0B\1\2\0016\1\v\0009\1\f\0019\1\r\1'\3\14\0B\1\2\2\t\1\0\0X\1\3€9\1\t\0005\3\15\0B\1\2\0016\1\v\0009\1\f\0019\1\r\1'\3\16\0B\1\2\2\t\1\0\0X\1\3€9\1\t\0005\3\17\0B\1\2\1K\0\1\0\1\0\2\25NERDTreeRemoveDirCmd\rrmtrash \26NERDTreeRemoveFileCmd\rrmtrash \frmtrash\1\0\2\25NERDTreeRemoveDirCmd\15gio trash \26NERDTreeRemoveFileCmd\15gio trash \bgio\15executable\afn\bvim\1\0\1\23NERDTreeShowHidden\3\1\18apply_globals\1\0\1\vsilent\2\24:NERDTreeToggle<CR>\21<leader><leader>\22:NERDTreeFind<CR>\n<C-m>\6n\bmap\nutils\frequire\2\0", "config", "nerdtree")
time([[Config for nerdtree]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\ná\5\0\0\6\0\29\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\0025\3\16\0005\4\14\0005\5\15\0=\5\f\4=\4\17\0035\4\18\0005\5\19\0=\5\20\0045\5\21\0=\5\22\4=\4\23\0035\4\24\0005\5\25\0=\5\26\4=\4\27\3=\3\28\2B\0\2\1K\0\1\0\16textobjects\16lsp_interop\25peek_definition_code\1\0\2\adF\17@class.outer\adf\20@function.outer\1\0\1\venable\2\tswap\18swap_previous\1\0\1\15<leader>sp\21@parameter.inner\14swap_next\1\0\1\15<leader>sn\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\1\0\4\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aic\17@class.inner\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\r\0\0\thtml\15javascript\15typescript\btsx\tjson\blua\vpython\tyaml\bhcl\15dockerfile\fc_sharp\tbash\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\nZ\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\1\27startify_change_to_dir\1\18apply_globals\nutils\frequire\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType csv ++once lua require("packer.load")({'csv.vim'}, { ft = "csv" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/foofaev/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], true)
vim.cmd [[source /home/foofaev/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]]
time([[Sourcing ftdetect script at: /home/foofaev/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

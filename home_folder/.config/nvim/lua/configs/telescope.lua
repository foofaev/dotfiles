return function()
	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<C-u>"] = false,
					["<C-d>"] = false,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
		pickers = {
			buffers = {
				sort_lastused = true,
			},
		},
	})
	--Add leader shortcuts
	vim.api.nvim_set_keymap(
		"n",
		"<leader>b",
		[[<cmd>lua require('telescope.builtin').buffers()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>a",
		[[<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"gr",
		[[<cmd>lua require('telescope.builtin').lsp_references()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>ff",
		[[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>fc",
		[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sh",
		[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>st",
		[[<cmd>lua require('telescope.builtin').tags()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>fg",
		[[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>fa",
		[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>so",
		[[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>?",
		[[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
		{ noremap = true, silent = true }
	)
	require("telescope").load_extension("fzf")
end

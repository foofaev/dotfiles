return function()
	vim.g.lightline = {
		colorscheme = "nord",
		active = { left = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } } },
		component_function = { gitbranch = "fugitive#head" },
	}
end

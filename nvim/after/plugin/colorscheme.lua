require("solarized-osaka").setup({
	transparent = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	dim_inactive = true,
	lualine_bold = true,
})

vim.cmd([[ colorscheme solarized-osaka ]])

require("nvim-web-devicons").setup({})

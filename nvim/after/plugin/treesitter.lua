local treesitter = require("nvim-treesitter")

-- :TSInstall all

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
})

-- require("treesitter-context").setup({
-- 	mode = "cursor",
-- 	max_lines = 5,
-- })

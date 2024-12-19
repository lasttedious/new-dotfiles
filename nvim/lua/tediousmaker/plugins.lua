local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
end

local MiniDeps = require("mini.deps")

MiniDeps.setup({ path = { package = path_package } })

local add = MiniDeps.add

-- Package manager
add("echasnovski/mini.nvim")

-- Theme
add("nvim-tree/nvim-web-devicons")
add("nvim-lua/plenary.nvim")
add("craftzdog/solarized-osaka.nvim")
add("nvim-treesitter/nvim-treesitter")

-- Language Servers
add("neovim/nvim-lspconfig")
add("williamboman/mason.nvim")
add("williamboman/mason-lspconfig.nvim")
add("nvimdev/lspsaga.nvim")

-- Formatter & Linters & DAP
add("stevearc/conform.nvim")
add("mfussenegger/nvim-lint")
add("mfussenegger/nvim-dap")
add("rcarriga/nvim-dap-ui")

-- Finder
add("nvim-telescope/telescope.nvim")
add("nvim-telescope/telescope-file-browser.nvim")

-- Completion
add("hrsh7th/nvim-cmp")
add("hrsh7th/cmp-nvim-lsp")
add("hrsh7th/cmp-path")
add("hrsh7th/cmp-buffer")
add("hrsh7th/cmp-cmdline")

-- Snippets
add("L3MON4D3/LuaSnip")
add("saadparwaiz1/cmp_luasnip")
add("petertriho/cmp-git")

-- File Type Specific
add("iamcco/markdown-preview.nvim")

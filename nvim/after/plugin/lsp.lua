local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspsaga = require("lspsaga")

local map = vim.keymap.set

local on_attach = function(_, bufnr)
	local current_opts = { noremap = true, silent = true, buffer = bufnr }

	local use_opts = function(desc)
		return vim.tbl_extend("force", current_opts, { desc = desc })
	end

	map("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", use_opts("Open the finder"))
	map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", use_opts("Edit on the floating window"))
	map("n", "<leader>lg", "<cmd>Lspsaga goto_definition<cr>", use_opts("Go to the definition"))
	map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", use_opts("See the list of outline"))
	map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", use_opts("Rename"))
	map("n", "<leader>ll", "<cmd>LspRestart<cr>", use_opts("Restart the LSP"))
	map("n", "<leader>lh", "<Cmd>Lspsaga hover_doc<CR>", use_opts("See simple documents"))
	map({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<cr>", use_opts("See code actions"))

	map("n", "<C-n>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", current_opts)
	map("n", "<C-p>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", current_opts)
end

local default_settings = {
	capabilities = capabilities,
	on_attach = on_attach,
}

lspconfig.arduino_language_server.setup(default_settings)
lspconfig.biome.setup(default_settings)
lspconfig.clangd.setup(default_settings)
lspconfig.css_variables.setup(default_settings)
lspconfig.cssls.setup(default_settings)
lspconfig.dartls.setup(default_settings)
lspconfig.fsharp_language_server.setup(default_settings)
lspconfig.gopls.setup(default_settings)
-- lspconfig.grammarly.setup(default_settings)
lspconfig.graphql.setup(default_settings)
lspconfig.html.setup(default_settings)
lspconfig.java_language_server.setup(default_settings)
lspconfig.jsonls.setup(default_settings)

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	single_file_support = true,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
			completion = {
				workspaceWord = true,
				callSnippet = "Both",
			},
			misc = {
				parameters = {
					-- "--log-level=trace",
				},
			},
			hint = {
				enable = true,
				setType = false,
				paramType = true,
				paramName = "Disable",
				semicolon = "Disable",
				arrayIndex = "Disable",
			},
			doc = {
				privateName = { "^_" },
			},
			type = {
				castNumberToInteger = true,
			},
			diagnostics = {
				disable = { "incomplete-signature-doc", "trailing-space" },
				-- enable = false,
				groupSeverity = {
					strong = "Warning",
					strict = "Warning",
				},
				groupFileStatus = {
					["ambiguity"] = "Opened",
					["await"] = "Opened",
					["codestyle"] = "None",
					["duplicate"] = "Opened",
					["global"] = "Opened",
					["luadoc"] = "Opened",
					["redefined"] = "Opened",
					["strict"] = "Opened",
					["strong"] = "Opened",
					["type-check"] = "Opened",
					["unbalanced"] = "Opened",
					["unused"] = "Opened",
				},
				unusedLocalExclude = { "_*" },
			},
			format = {
				enable = false,
				defaultConfig = {
					indent_style = "space",
					indent_size = "2",
					continuation_indent_size = "2",
				},
			},
		},
	},
})

lspconfig.yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		yaml = {
			keyOrdering = false,
		},
	},
})

lspsaga.setup({
	ui = {
		border = "rounded",
		code_action = "󰌶",
		keys = {
			scroll_up = "<C-u>",
			scroll_down = "<C-d>",
		},
	},
	symbol_in_winbar = {
		enable = true,
	},
	definition = {
		keys = {
			edit = "<CR>",
			vsplit = "<C-v>",
			split = "<C-s>",
			tabe = "<C-t>",
			quit = "q",
			close = "<C-c>",
		},
	},
	diagnostic = {
		extend_relatedInformation = true,
		keys = {
			exec_action = "<CR>",
			toggle_or_jump = "<C-t>",
			quit = "q",
			quit_in_show = "",
		},
	},
	finder = {
		max_height = 1,
		left_width = 0.2,
		right_width = 0.6,
		keys = {
			toggle_or_open = "<CR>",
			vsplit = "<C-v>",
			split = "<C-s>",
			tabe = "<C-t>",
			tabnew = "<C-t>",
			close = "<C-c>",
			quit = "q",
			shuttle = "<C-r>",
		},
	},
	hover_doc = {
		open_link = "<CR>",
		open_cmd = "!chrome",
	},
	lightbulb = {
		enable = false,
	},
	rename = {
		in_select = false,
		auto_save = true,
		keys = {
			quit = "q",
			select = "s",
		},
	},
	outline = {
		win_position = "left",
		close_after_jump = true,
		keys = {
			jump = "<CR>",
		},
	},
	implement = {
		enable = true,
	},
})

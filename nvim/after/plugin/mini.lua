local MiniDeps = require("mini.deps")
local now, later = MiniDeps.now, MiniDeps.later

now(function()
	require("mini.ai").setup({
		n_lines = 100,
		mappings = {
			around = "a",
			inside = "i",

			around_next = "al",
			inside_next = "il",
			around_last = "ah",
			inside_last = "ih",

			goto_left = "gh",
			goto_right = "gl",
		},
		custom_textobjects = {
			o = require("mini.ai").gen_spec.treesitter({
				a = { "@block.outer", "@conditional.outer", "@loop.outer" },
				i = { "@block.inner", "@conditional.inner", "@loop.inner" },
			}, {}),
			f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
			c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
			t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
		},
	})

	require("mini.bracketed").setup({})

	require("mini.clue").setup({
		clues = {},
		triggers = {
			{ mode = "n", keys = "<leader>" },
			{ mode = "n", keys = "s" },
			{ mode = "n", keys = "g" },
			{ mode = "v", keys = "g" },
		},
		window = { delay = 0 },
	})

	require("mini.colors")

	require("mini.comment").setup({})

	require("mini.cursorword").setup({
		delay = 0,
	})

	require("mini.diff").setup({
		view = {
			style = "sign",
			signs = { add = "▎", change = "▎", delete = "▎" },
			priority = 999,
		},
		delay = {
			text_change = 0,
		},
		mappings = {
			apply = "",
			reset = "",
			textobject = "",
			goto_first = "",
			goto_prev = "",
			goto_next = "",
			goto_last = "",
		},
	})

	require("mini.files").setup({
		mappings = {
			close = "q",
			go_in = "l",
			go_in_plus = "L",
			go_out = "h",
			go_out_plus = "H",
			mark_goto = "'",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},

		-- Customization of explorer windows
		windows = {
			preview = false,
			width_focus = 40,
			width_nofocus = 15,
			width_preview = 25,
		},
	})

	require("mini.fuzzy").setup({})

	require("mini.git").setup({})

	require("mini.hipatterns").setup({
		highlighters = {
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
		},
	})

	require("mini.indentscope").setup({
		symbol = "▎",
		options = {
			try_as_border = true,
		},
	})

	require("mini.jump2d").setup({
		spotter = nil,
		labels = "qwertyuiopasdfghjklcvbn",
		view = {
			dim = true,
			n_steps_ahead = 0,
		},
		mappings = {
			start_jumping = "<leader>j",
		},
	})

	require("mini.move").setup({
		mappings = {
			left = "<C-h>",
			right = "<C-l>",
			down = "<C-j>",
			up = "<C-k>",
			line_left = "<C-h>",
			line_right = "<C-l>",
			line_down = "<C-j>",
			line_up = "<C-k>",
		},
	})

	require("mini.pairs").setup({
		modes = { insert = true, command = true, terminal = true },
		mappings = {
			["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
			["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
			["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
			[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
			["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
			["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
			['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
			["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
			["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
		},
	})

	require("mini.splitjoin").setup({
		mappings = {
			toggle = "<leader>ji",
		},
	})

	require("mini.statusline").setup({})

	require("mini.surround").setup({
		highlight_duration = 0,
		mappings = {
			add = "ga",
			delete = "gd",
			find = "gf",
			find_left = "gF",
			highlight = "gh",
			replace = "gr",
			update_n_lines = "gn",

			suffix_last = "h",
			suffix_next = "l",
		},
	})
end)

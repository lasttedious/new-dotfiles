vim.cmd([[ autocmd! ]])

vim.mapleder = " "
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.mouse = ""

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.expandtab = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.wrapscan = true
vim.opt.inccommand = "split"

vim.opt.termguicolors = true
vim.opt.cursorline = false

vim.opt.showtabline = 2
vim.opt.scrolloff = 15
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.showcmd = true
vim.opt.cmdheight = 1

vim.opt.backup = false
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.shell = "zsh"

vim.opt.guicursor = "n-v-c-sm:block,ve:ver25,r-o:hor20"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"

vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.formatoptions:append({ "r" })
vim.opt.clipboard:append({ "unnamedplus" })
vim.diagnostic.config({ update_in_insert = true })

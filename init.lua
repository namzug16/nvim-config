vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.api.nvim_set_option("clipboard", "unnamed")

-- numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- windows
vim.keymap.set("n", "<leader>wsh", ":split<CR>", { silent = true })
vim.keymap.set("n", "<leader>wsv", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { silent = true })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { silent = true })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { silent = true })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { silent = true })
vim.keymap.set("n", "<leader>wc", ":q<CR>", { silent = true })

-- save all files
vim.keymap.set("n", "<leader>wa", ":wa<CR>", {})

-- colors
local color = "#00FF00"
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = color, bg = "NONE" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = color, bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = color, bg = "NONE" })

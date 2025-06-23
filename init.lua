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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
  end,
})


local tbuiltin = require('telescope.builtin')

--wrapping
vim.opt.wrap = false;

-- numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.signcolumn = "yes"

-- windows
vim.keymap.set("n", "<leader>wsh", ":split<CR>", { silent = true })
vim.keymap.set("n", "<leader>wsv", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { silent = true })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { silent = true })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { silent = true })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { silent = true })
vim.keymap.set("n", "<leader>wc", ":q<CR>", { silent = true })

-- buffers
vim.keymap.set("n", "<leader>bc", ":bp<bar>sp<bar>bn<bar>bd<CR>", { silent = true })
vim.keymap.set("n", "<leader>bl", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bh", ":bprev<CR>", { silent = true })

-- save all files
vim.keymap.set("n", "<leader>wa", ":wa<CR>", { silent = true })

-- extra
vim.keymap.set({ "n", "v" }, "<leader>cd", vim.diagnostic.open_float, { silent = true })
vim.keymap.set({ "n", "v" }, "1k", "<C-U>zz", { silent = true })
vim.keymap.set({ "n", "v" }, "1j", "<C-D>zz", { silent = true })

-- diagnostic navigation
vim.keymap.set("n", "ej", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("n", "ek", vim.diagnostic.goto_prev, { silent = true })

-- folding
vim.opt.foldmethod = "marker"

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
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = color, bold = true })

-- Replace Search Command
vim.api.nvim_create_user_command('RS', function(opts)
  local search = vim.fn.getreg('/')
  local replacement = opts.args
  vim.cmd('%s/\\V' .. search .. '/' .. replacement .. '/g')
end, { nargs = 1 })

-- LSP

vim.lsp.enable({ 'luals', 'bashls', 'ltex', 'html', 'ts_ls', 'gopls', 'dartls', 'clangd' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf)
    end
  end,
})

vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "grr", tbuiltin.lsp_references, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)

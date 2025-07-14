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

-- Basic settings
vim.opt.number = true         -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.o.signcolumn = "yes"
vim.opt.wrap = false          -- Don't wrap lines
vim.opt.scrolloff = 10        -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor

-- File handling
vim.opt.backup = false                            -- Don't create backup files
vim.opt.writebackup = false                       -- Don't create backup before writing
vim.opt.swapfile = false                          -- Don't create swap files
vim.opt.undofile = true                           -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300                          -- Faster completion
vim.opt.timeoutlen = 500                          -- Key timeout duration
vim.opt.ttimeoutlen = 0                           -- Key code timeout
vim.opt.autoread = true                           -- Auto reload files changed outside vim
vim.opt.autowrite = false                         -- Don't auto save

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

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- colors
local fg_color = "#00FF00"
local bg_color = "#000000"

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = fg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = fg_color, bold = true })
vim.api.nvim_set_hl(0, "StatusLine", { fg = bg_color, bg = fg_color})
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = fg_color, bg = bg_color})

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
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end)

-- ============================================================================
-- STATUSLINE
-- ============================================================================

-- Git branch function
local function git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if branch ~= "" then
    return "  " .. branch .. " "
  end
  return ""
end

-- LSP status
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    return clients[1].name
  end
  return "---"
end


-- File status
local function file_editing_status()
  local modified = vim.bo.modified
  local readonly = vim.bo.readonly
  local res = ""

  if modified then
    res = "*"
  elseif readonly then
    res = "-RO"
  end

  return res
end

-- Mode indicators with icons
local function mode_icon()
  local mode = vim.fn.mode()
  local modes = {
    n = "++NORMAL++",
    i = "++INSERT++",
    v = "++VISUAL++",
    V = "++V-LINE++",
    ["\22"] = "V-BLOCK", -- Ctrl-V
    c = "++COMMAND++",
    s = "SELECT",
    S = "S-LINE",
    ["\19"] = "S-BLOCK", -- Ctrl-S
    R = "REPLACE",
    r = "REPLACE",
    ["!"] = "SHELL",
    t = "++TERMINAL++"
  }
  return modes[mode] or "  " .. mode:upper()
end

local function diagnostics_summary()
  local icons = {
    [vim.diagnostic.severity.ERROR] = "✗",
    [vim.diagnostic.severity.WARN] = "⚠",
    [vim.diagnostic.severity.INFO] = "ℹ",
    [vim.diagnostic.severity.HINT] = "💡",
  }

  local bufnr = vim.api.nvim_get_current_buf()
  local result = {}
  local hasToShow = false

  for severity, icon in pairs(icons) do
    local count = #vim.diagnostic.get(bufnr, { severity = severity })
    if count > 0 then
      hasToShow = true
      table.insert(result, string.format("%s %d", icon, count))
    end
  end

  if not hasToShow then
    return ""
  end

  return "[" .. table.concat(result, " ") .. "]"
end

_G.diagnostics_summary = diagnostics_summary
_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.lsp_status = lsp_status
_G.file_editing_status = file_editing_status

vim.cmd([[
  highlight StatusLineBold gui=bold cterm=bold
]])

-- Function to change statusline based on window focus
local function setup_dynamic_statusline()
  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    callback = function()
      vim.opt_local.statusline = table.concat {
        "  ",
        "%#StatusLineBold#",
        "%{v:lua.mode_icon()}",
        "%#StatusLine#",
        " [%t]",
        "%{v:lua.file_editing_status()}",
        "%{v:lua.diagnostics_summary()}",
        "%=",
        "%{v:lua.git_branch()}",
        " - ",
        "%{v:lua.lsp_status()}",
        " - ",
        "%l:%c",
        "  ",
      }
    end
  })

  vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

  vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    callback = function()
      vim.opt_local.statusline = "  [%t]%{v:lua.file_editing_status()}%=%l:%c  "
    end
  })
end

setup_dynamic_statusline()

return {
	"nvimtools/none-ls.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"williamboman/mason.nvim",
	},
	config = function()
		local nls = require("null-ls")

		nls.setup({
			sources = {
				-- lua
				nls.builtins.formatting.stylua,
				-- sql
				nls.builtins.diagnostics.sqlfluff.with({
					extra_args = { "--dialect", "postgres" },
				}),
				nls.builtins.formatting.pg_format,
				-- golang
				nls.builtins.code_actions.gomodifytags,
				nls.builtins.code_actions.impl,
				nls.builtins.formatting.goimports,
				nls.builtins.formatting.gofumpt,
				-- swift
				nls.builtins.diagnostics.swiftlint,
				nls.builtins.formatting.swift_format,
        -- dart
				nls.builtins.formatting.dart_format.with({
          extra_args = {"-l", "300"},
        }),
        -- js
        nls.builtins.formatting.prettier,
			},
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
	end,
}

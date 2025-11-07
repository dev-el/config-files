return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "dbui",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, "n", "e", "<Plug>(DBUI_SelectLine)", { noremap = true, silent = true })
			end,
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { " sql", "mysql" },
			callback = function()
				vim.api.nvim_buf_set_keymap(
					0,
					"n",
					"<space>fn",
					"<Plug>(DBUI_ExecuteQuery)",
					{ noremap = true, silent = true }
				)
			end,
		})
	end,
}

return {
	"bassamsdata/namu.nvim",
	opts = {
		global = {},
		namu_symbols = {
			options = {},
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>ls", ":Namu symbols<cr>", {
			desc = "Jump to LSP symbol",
			silent = true,
		})
		vim.keymap.set("n", "<leader>lw", ":Namu workspace<cr>", {
			desc = "LSP Symbols - Workspace",
			silent = true,
		})
	end,
}

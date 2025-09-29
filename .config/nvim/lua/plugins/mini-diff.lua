return {
	"echasnovski/mini.diff",
	version = "*",
	init = function()
		local miniDiff = require("mini.diff")

		miniDiff.setup({
			options = {
				algorithm = "histogram",
				linematch = 480,
			},
		})

		vim.keymap.set("n", "<leader>hr", get_search_list_cmd(8), { noremap = true, silent = true })
		vim.keymap.set(
			"n",
			"<leader>hg",
			":lua vim.fn.setqflist(MiniDiff.export('qf', { scope = 'current' }))<CR>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>ht",
			":lua vim.fn.setqflist(MiniDiff.export('qf', { scope = 'all' }))<CR>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set("n", "g<spacce>r", ":lua vim.fn.setqflist({})<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>hv", ":lua MiniDiff.toggle()<CR>", { noremap = true, silent = true })
    vim.keymap.set({ "n", "x" }, "gh", "g^", { noremap = true })
    vim.keymap.set({ "n", "x" }, "g<space>h", "<home>", { noremap = true })
	end,
}

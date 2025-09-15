return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function(_, opts)
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		vim.keymap.set("n", "<leader>m", builtin.buffers, {})
		vim.keymap.set("n", "<leader>en", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>em", builtin.find_files, {})
		vim.keymap.set("n", "<leader>eK", builtin.keymaps, {})

		opts.defaults = {
			mappings = {
				n = {
					["<leader>h"] = "send_to_qflist",
					["j"] = false,
					["l"] = false,
					["i"] = "move_selection_previous",
					["k"] = "move_selection_next",
					["e"] = "select_default",
					["h"] = "close",
					["t"] = "close",
					["fh"] = "close",
					["<CR>"] = "select_default",
				},
			},
			initial_mode = "normal",
		}

		telescope.setup(opts)
	end,
}

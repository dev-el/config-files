return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local nvim_treesitter = require("nvim-treesitter")

		nvim_treesitter.setup({
			install_dir = vim.fn.stdpath('data') .. '/site'
		})

		nvim_treesitter.install(
			get_treesitter_config("parsers")
		)
	end,
}

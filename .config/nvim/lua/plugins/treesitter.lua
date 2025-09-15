return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"glsl",
				"java",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
			},
			highlight = { enable = true },
			indent = { enable = true },
			matchup = {
				enable = true, -- mandatory, false will disable the whole extension
				disable = {}, -- optional, list of language that will be disabled
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gkN",
					node_incremental = "nef",
					scope_incremental = "nej",
					node_decremental = "ndf",
				},
			},
		})
	end,
}

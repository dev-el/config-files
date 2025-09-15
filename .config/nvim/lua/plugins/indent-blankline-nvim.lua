return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
			tab_char = nil,
			highlight = "IblIndent",
			smart_indent_cap = true,
			priority = 1,
			repeat_linebreak = true,
		},
		scope = {
			enabled = false,
		},
	},
}

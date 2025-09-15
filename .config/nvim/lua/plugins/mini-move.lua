return {
	"echasnovski/mini.move",
	version = "*",
	init = function()
		local miniMove = require("mini.move")
		miniMove.setup({
			mappings = {
				left = "<M-j>",
				right = "<M-l>",
				down = "<M-k>",
				up = "<M-i>",
				line_left = "<M-j>",
				line_right = "<M-l>",
				line_down = "<M-k>",
				line_up = "<M-i>",
			},
			options = {
			},
		})
	end,
}

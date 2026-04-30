return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"pogyomo/submode.nvim",
	},
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true,
				include_surrounding_whitespace = true,
			},
			move = {
				enable = true,
				set_jumps = true,
			},
		})

		local select = require("nvim-treesitter-textobjects.select")

		vim.keymap.set({ "o", "x" }, "mf", function() select.select_textobject("@function.outer", "textobjects", "v") end)
		vim.keymap.set({ "o", "x" }, "nf", function() select.select_textobject("@function.inner", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "nc", function() select.select_textobject("@class.inner", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "mc", function() select.select_textobject("@class.outer", "textobjects", "v") end)
		vim.keymap.set({ "o", "x" }, "mb", function() select.select_textobject("@block.outer", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "nb", function() select.select_textobject("@block.inner", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "mn", function() select.select_textobject("@parameter.outer", "textobjects", "v") end)
		vim.keymap.set({ "o", "x" }, "nn", function() select.select_textobject("@parameter.inner", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "ni", function() select.select_textobject("@conditional.inner", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "mi", function() select.select_textobject("@conditional.outer", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "nr", function() select.select_textobject("@loop.inner", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "mr", function() select.select_textobject("@loop.outer", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "neh", function() select.select_textobject("@assignment.inner", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "meh", function() select.select_textobject("@assignment.outer", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "nei", function() select.select_textobject("@assignment.lhs", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "nek", function() select.select_textobject("@assignment.rhs", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "nec", function() select.select_textobject("@call.inner", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "mec", function() select.select_textobject("@call.outer", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "nen", function() select.select_textobject("@statement.outer", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "nee", function() select.select_textobject("@frame.inner", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "mee", function() select.select_textobject("@frame.outer", "textobjects") end)
		vim.keymap.set({ "o", "x" }, "nej", function() select.select_textobject("@jupyter.cell", "textobjects") end)

		local move = require("nvim-treesitter-textobjects.move")

		-- goto_next_start
		vim.keymap.set({ "n", "x", "o" }, "gkj", function()
			move.goto_next_start({ "@block.outer", "@block.inner", "@class.outer", "@class.inner" }, "textobjects")
		end)
		vim.keymap.set({ "n", "x", "o" }, "gkh", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next Function Start" })
		vim.keymap.set({ "n", "x", "o" }, "gkc", function() move.goto_next_start("@class.outer", "textobjects") end, { desc = "Next Class Start" })
		vim.keymap.set({ "n", "x", "o" }, "gkb", function() move.goto_next_start("@block.outer", "textobjects") end, { desc = "Next Block Start" })
		vim.keymap.set({ "n", "x", "o" }, "gkn", function() move.goto_next_start("@parameter.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gki", function() move.goto_next_start("@conditional.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gkr", function() move.goto_next_start("@loop.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gkeh", function() move.goto_next_start("@assignment.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gkei", function() move.goto_next_start("@assignment.lhs", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gkek", function() move.goto_next_start("@assignment.rhs", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gkec", function() move.goto_next_start("@call.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gken", function() move.goto_next_start("@statement.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gkee", function() move.goto_next_start("@frame.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gkej", function() move.goto_next_start("@jupyter.cell", "textobjects") end)

		-- goto_next_end
		vim.keymap.set({ "n", "x", "o" }, "gKj", function()
			move.goto_next_end({ "@block.outer", "@block.inner", "@class.outer", "@class.inner" }, "textobjects")
		end)
		vim.keymap.set({ "n", "x", "o" }, "gKh", function() move.goto_next_end("@function.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKc", function() move.goto_next_end("@class.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKb", function() move.goto_next_end("@block.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKn", function() move.goto_next_end("@parameter.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKi", function() move.goto_next_end("@conditional.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKr", function() move.goto_next_end("@loop.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKeh", function() move.goto_next_end("@assignment.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKei", function() move.goto_next_end("@assignment.lhs", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKek", function() move.goto_next_end("@assignment.rhs", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKec", function() move.goto_next_end("@call.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKen", function() move.goto_next_end("@statement.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKee", function() move.goto_next_end("@frame.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gKej", function() move.goto_next_end("@jupyter.cell", "textobjects") end)

		-- goto_previous_start
		vim.keymap.set({ "n", "x", "o" }, "gij", function()
			move.goto_previous_start({ "@block.outer", "@block.inner", "@class.outer", "@class.inner" }, "textobjects")
		end)
		vim.keymap.set({ "n", "x", "o" }, "gih", function() move.goto_previous_start("@function.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gic", function() move.goto_previous_start("@class.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gib", function() move.goto_previous_start("@block.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gin", function() move.goto_previous_start("@parameter.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gii", function() move.goto_previous_start("@conditional.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gir", function() move.goto_previous_start("@loop.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gieh", function() move.goto_previous_start("@assignment.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "giei", function() move.goto_previous_start("@assignment.lhs", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "giek", function() move.goto_previous_start("@assignment.rhs", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "giec", function() move.goto_previous_start("@call.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gien", function() move.goto_previous_start("@statement.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "giee", function() move.goto_previous_start("@frame.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "giej", function() move.goto_previous_start("@jupyter.cell", "textobjects") end)

		-- goto_previous_end
		vim.keymap.set({ "n", "x", "o" }, "gIj", function()
			move.goto_previous_end({ "@block.outer", "@block.inner", "@class.outer", "@class.inner" }, "textobjects")
		end)
		vim.keymap.set({ "n", "x", "o" }, "gIh", function() move.goto_previous_end("@function.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIc", function() move.goto_previous_end("@class.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIb", function() move.goto_previous_end("@block.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIn", function() move.goto_previous_end("@parameter.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIi", function() move.goto_previous_end("@conditional.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIr", function() move.goto_previous_end("@loop.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIeh", function() move.goto_previous_end("@assignment.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIei", function() move.goto_previous_end("@assignment.lhs", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIek", function() move.goto_previous_end("@assignment.rhs", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIec", function() move.goto_previous_end("@call.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIen", function() move.goto_previous_end("@statement.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIee", function() move.goto_previous_end("@frame.outer", "textobjects") end)
		vim.keymap.set({ "n", "x", "o" }, "gIej", function() move.goto_previous_end("@jupyter.cell", "textobjects") end)

		local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

		vim.keymap.set({ "n", "x", "o" }, "r", ts_repeat_move.builtin_f_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "R", ts_repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
	end,
}

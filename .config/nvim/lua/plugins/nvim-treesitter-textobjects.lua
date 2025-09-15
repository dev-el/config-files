return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"pogyomo/submode.nvim",
	},
	init = function()
		local nvim_treesitter_configs = require("nvim-treesitter.configs")
		nvim_treesitter_configs.setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["mf"] = "@function.outer",
						["nf"] = "@function.inner",
						["nc"] = "@class.inner",
						["mc"] = "@class.outer",
						["mb"] = { query = "@block.outer" },
						["nb"] = { query = "@block.inner" },
						["mn"] = "@parameter.outer",
						["nn"] = "@parameter.inner",
						["ni"] = "@conditional.inner",
						["mi"] = "@conditional.outer",
						["nr"] = "@loop.inner",
						["mr"] = "@loop.outer",
						["neh"] = "@assignment.inner",
						["meh"] = "@assignment.outer",
						["nei"] = "@assignment.lhs",
						["nek"] = "@assignment.rhs",
						["nec"] = "@call.inner",
						["mec"] = "@call.outer",
						["nen"] = "@statement.outer",
						["nee"] = "@frame.inner",
						["mee"] = "@frame.outer",
						["nej"] = "@jupyter.cell",
					},
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "v",
						["@class.outer"] = "v",
					},
					include_surrounding_whitespace = true,
				},

				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["gkj"] = {
							query = {
								"@block.outer",
								"@block.inner",
								"@class.outer",
								"@class.inner",
							},
						},
						["gkh"] = { query = { "@function.outer" }, desc = "Next Function Start" },
						["gkc"] = { query = { "@class.outer" }, desc = "Next Class Start" },
						["gkb"] = { query = { "@block.outer" }, desc = "Next Block Start" },
						["gkn"] = { query = { "@parameter.outer" } },
						["gki"] = { query = { "@conditional.outer" } },
						["gkr"] = { query = { "@loop.outer" } },
						["gkeh"] = { query = { "@assignment.outer" } },
						["gkei"] = { query = { "@assignment.lhs" } },
						["gkek"] = { query = { "@assignment.rhs" } },
						["gkec"] = { query = { "@call.outer" } },
						["gken"] = { query = { "@statement.outer" } },
						["gkee"] = { query = { "@frame.outer" } },
						["gkej"] = { query = { "@jupyter.cell" } },
					},
					goto_next_end = {
						["gKj"] = {
							query = {
								"@block.outer",
								"@block.inner",

								"@class.outer",

								"@class.inner",
							},
						},
						["gKh"] = { query = { "@function.outer" } },
						["gKc"] = { query = { "@class.outer" } },
						["gKb"] = { query = { "@block.outer" } },
						["gKn"] = { query = { "@parameter.outer" } },
						["gKi"] = { query = { "@conditional.outer" } },
						["gKr"] = { query = { "@loop.outer" } },
						["gKeh"] = { query = { "@assignment.outer" } },
						["gKei"] = { query = { "@assignment.lhs" } },
						["gKek"] = { query = { "@assignment.rhs" } },
						["gKec"] = { query = { "@call.outer" } },
						["gKen"] = { query = { "@statement.outer" } },
						["gKee"] = { query = { "@frame.outer" } },
						["gKej"] = { query = { "@jupyter.cell" } },
					},
					goto_previous_start = {
						["gij"] = {
							query = {
								"@block.outer",
								"@block.inner",
								"@class.outer",
								"@class.inner",
							},
						},
						["gih"] = { query = { "@function.outer" } },
						["gic"] = { query = { "@class.outer" } },
						["gib"] = { query = { "@block.outer" } },
						["gin"] = { query = { "@parameter.outer" } },
						["gii"] = { query = { "@conditional.outer" } },
						["gir"] = { query = { "@loop.outer" } },
						["gieh"] = { query = { "@assignment.outer" } },
						["giei"] = { query = { "@assignment.lhs" } },
						["giek"] = { query = { "@assignment.rhs" } },
						["giec"] = { query = { "@call.outer" } },
						["gien"] = { query = { "@statement.outer" } },
						["giee"] = { query = { "@frame.outer" } },
						["giej"] = { query = { "@jupyter.cell" } },
					},
					goto_previous_end = {
						["gIj"] = {
							query = {
								"@block.outer",
								"@block.inner",
								"@class.outer",
								"@class.inner",
							},
						},
						["gIh"] = { query = { "@function.outer" } },
						["gIc"] = { query = { "@class.outer" } },
						["gIb"] = { query = { "@class.outer" } },
						["gIn"] = { query = { "@parameter.outer" } },
						["gIi"] = { query = { "@conditional.outer" } },
						["gIr"] = { query = { "@loop.outer" } },
						["gIeh"] = { query = { "@assignment.outer" } },
						["gIei"] = { query = { "@assignment.lhs" } },
						["gIek"] = { query = { "@assignment.rhs" } },
						["gIec"] = { query = { "@call.outer" } },
						["gIen"] = { query = { "@statement.outer" } },
						["gIee"] = { query = { "@frame.outer" } },
						["gIej"] = { query = { "@jupyter.cell" } },
					},
					goto_next = {},
					goto_previous = {},
				},
			},
		})

		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

		vim.keymap.set({ "n", "x", "o" }, "r", ts_repeat_move.builtin_f_expr, { expr = true })

		vim.keymap.set({ "n", "x", "o" }, "R", ts_repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
	end,
}

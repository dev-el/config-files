return {
	"julienvincent/nvim-paredit",
	config = function()
		local paredit = require("nvim-paredit")
		paredit.setup({
			use_default_keys = true,
			filetypes = { "clojure", "fennel", "scheme", "lisp", "janet" },
			languages = {
				clojure = {
					whitespace_chars = { " ", "," },
				},
				fennel = {
					whitespace_chars = { " ", "," },
				},
			},
			cursor_behaviour = "auto",
			dragging = {

				auto_drag_pairs = true,
			},
			indent = {
				enabled = false,
				indentor = require("nvim-paredit.indentation.native").indentor,
			},
			keys = {
				["<localleader>fei"] = { paredit.unwrap.unwrap_form_under_cursor, "Splice sexp" },
				[">)"] = { paredit.api.slurp_forwards, "Slurp forwards" },
				["<localleader>fel"] = { paredit.api.slurp_forwards, "Slurp forwards" },
				[">("] = { paredit.api.barf_backwards, "Barf backwards" },
				["<localleader>feL"] = { paredit.api.barf_backwards, "Barf backwards" },
				["<)"] = { paredit.api.barf_forwards, "Barf forwards" },
				["<localleader>fej"] = { paredit.api.barf_forwards, "Barf forwards" },
				["<("] = { paredit.api.slurp_backwards, "Slurp backwards" },
				["<localleader>feJ"] = { paredit.api.slurp_backwards, "Slurp backwards" },
				[">e"] = { paredit.api.drag_element_forwards, "Drag element right" },
				["<e"] = { paredit.api.drag_element_backwards, "Drag element left" },
				[">p"] = { paredit.api.drag_pair_forwards, "Drag element pairs right" },
				["<p"] = { paredit.api.drag_pair_backwards, "Drag element pairs left" },
				[">f"] = { paredit.api.drag_form_forwards, "Drag form right" },
				["<f"] = { paredit.api.drag_form_backwards, "Drag form left" },
				["<localleader>o"] = { paredit.api.raise_form, "Raise form" },
				["<localleader>O"] = { paredit.api.raise_element, "Raise element" },
				["W"] = {
					paredit.api.move_to_next_element_tail,
					"Jump to next element tail",

					repeatable = false,
					mode = { "n", "x", "o", "v" },
				},
				["E"] = {
					paredit.api.move_to_next_element_head,
					"Jump to next element head",
					repeatable = false,
					mode = { "n", "x", "o", "v" },
				},
				["B"] = {
					paredit.api.move_to_prev_element_head,
					"Jump to previous element head",
					repeatable = false,
					mode = { "n", "x", "o", "v" },
				},
				["gE"] = {
					paredit.api.move_to_prev_element_tail,
					"Jump to previous element tail",
					repeatable = false,
					mode = { "n", "x", "o", "v" },
				},
				["("] = {
					paredit.api.move_to_parent_form_start,
					"Jump to parent form's head",
					repeatable = false,
					mode = { "n", "x", "v" },
				},
				[")"] = {
					paredit.api.move_to_parent_form_end,
					"Jump to parent form's tail",
					repeatable = false,
					mode = { "n", "x", "v" },
				},
				["T"] = {
					paredit.api.move_to_top_level_form_head,
					"Jump to top level form's head",
					repeatable = false,
					mode = { "n", "x", "v" },
				},
				["af"] = {
					paredit.api.select_around_form,
					"Around form",
					repeatable = false,
					mode = { "o", "v" },
				},
				["mf"] = {
					paredit.api.select_around_form,
					"Around form",
					repeatable = false,
					mode = { "o", "v" },
				},
				["nf"] = {
					paredit.api.select_in_form,
					"In form",
					repeatable = false,
					mode = { "o", "v" },
				},
				["aF"] = {
					paredit.api.select_around_top_level_form,
					"Around top level form",
					repeatable = false,
					mode = { "o", "v" },
				},
				["mF"] = {
					paredit.api.select_around_top_level_form,
					"Around top level form",
					repeatable = false,
					mode = { "o", "v" },
				},
				["nF"] = {
					paredit.api.select_in_top_level_form,
					"In top level form",
					repeatable = false,
					mode = { "o", "v" },
				},
				["ae"] = {
					paredit.api.select_element,
					"Around element",
					repeatable = false,
					mode = { "o", "v" },
				},
				["me"] = {
					paredit.api.select_element,
					"Around element",
					repeatable = false,
					mode = { "o", "v" },
				},
				["ne"] = {
					paredit.api.select_element,
					"Element",
					repeatable = false,
					mode = { "o", "v" },
				},
			},
		})
	end,
}

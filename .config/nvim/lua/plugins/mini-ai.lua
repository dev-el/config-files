return {
	"echasnovski/mini.ai",
	version = false,
	init = function()
		local miniAI = require("mini.ai")

		miniAI.setup({
			custom_textobjects = {
        f = false,
        d = miniAI.gen_spec.function_call(),
        n = miniAI.gen_spec.argument(),
      },
			mappings = {
				around = "mv",
				inside = "nv",
				around_next = "",
				inside_next = "",
				around_last = "",
				inside_last = "",
				goto_left = "giv",
				goto_right = "gkv",
			},
			n_lines = 50,
			search_method = "cover_or_nearest",
			silent = false,
		})

    vim.keymap.set({"n", "x", "o"}, "gkvh", "])", { noremap = true })
    vim.keymap.set({"n", "x", "o"}, "gkvk", "]]", { noremap = true })
    vim.keymap.set({"n", "x", "o"}, "gkvc", "]}", { noremap = true })
    vim.keymap.set({"n", "x", "o"}, "givh", "[(", { noremap = true })
    vim.keymap.set({"n", "x", "o"}, "givk", "[[", { noremap = true })
    vim.keymap.set({"n", "x", "o"}, "givc", "[{", { noremap = true })
	end,
}

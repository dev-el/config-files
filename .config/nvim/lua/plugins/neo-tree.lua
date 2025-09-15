return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
  lazy = false,
	opts = {
		default_component_configs = {
			indent = {
				indent_size = 2,
				padding = 1,

				with_markers = false,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",

				with_expanders = nil,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},
		window = {
			position = "left",
			width = 30,
			relative = "editor",
			mappings = {
				["<space>"] = false,
				["[b"] = "prev_source",
				["]b"] = "next_source",
				["i"] = false,
				["k"] = false,
				["l"] = false,
				["j"] = false,
				h = "show_file_details",
				e = "open",
				["X"] = "close_node",
				["C"] = "clear_filter",
			},
			fuzzy_finder_mappings = {
				["<C-j>"] = "move_cursor_down",
				["<C-k>"] = "move_cursor_up",
			},
		},
		filesystem = {
			filtered_items = {
				visible = false,
				hide_gitignored = true,
				hide_by_name = {
				 	".git",
				 	".DS_Store",
				 	"thumbs.db",
				},
				never_show = { },
			},
		},
	},
	config = function(PluginSpec, opts)
		require("neo-tree").setup(opts)
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem toggle left<CR>", {silent=true})
	end,
}

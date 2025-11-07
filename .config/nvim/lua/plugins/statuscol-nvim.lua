return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local function show_line_numbers()
			return vim.opt.number:get() or vim.opt.relativenumber:get()
		end
		local statuscol = require("statuscol")
		local builtin = require("statuscol.builtin")
		local clickmod = "c"
		local cfg = {
			setopt = true, -- Whether to set the 'statuscolumn' option, may be set to false for those who
			thousands = false, -- or line number thousands separator string ("." / ",")
			relculright = false, -- whether to right-align the cursor line number with 'relativenumber' set
			ft_ignore = { "neo-tree", "netrw", "dbui" }, -- Lua table with 'filetype' values for which 'statuscolumn' will be unset
			bt_ignore = { "terminal", "nofile", "prompt" }, -- Lua table with 'buftype' values for which 'statuscolumn' will be unset
			segments = {
				{
					sign = {
						namespace = { "MiniDiffViz", "MiniDiffOverlay" },
						maxwidth = 1,
						colwidth = 1,
						fillchar = " ",
						auto = false,
					},
					click = "v:lua.ScSa",
				},
				{
					text = { builtin.lnumfunc, " " },
					condition = { show_line_numbers, show_line_numbers },
					click = "v:lua.ScLa",
					align = "right",
				},
				{
					text = { builtin.foldfunc }, -- table of strings or functions returning a string
					click = "v:lua.ScFa", -- %@ click function label, applies to each text element
					hl = "FoldColumn", -- %# highlight group label, applies to each text element
					condition = { true }, -- table of booleans or functions returning a boolean
					sign = { -- table of fields that configure a sign segment

						name = { ".*" }, -- table of Lua patterns to match the legacy sign name against
						text = { ".*" }, -- table of Lua patterns to match the extmark sign text against
						namespace = { ".*" }, -- table of Lua patterns to match the extmark sign namespace against

						maxwidth = 2, -- maximum number of signs that will be displayed in this segment
						auto = true, -- boolean or string indicating what will be drawn when no signs

						wrap = false, -- when true, signs in this segment will also be drawn on the

						fillchar = " ", -- character used to fill a segment with less signs than maxwidth
						fillcharhl = nil, -- highlight group used for fillchar (SignColumn/CursorLineSign if omitted)
						foldclosed = false, -- when true, show signs from lines in a closed fold on the first line
					},
          align = "left"
				},
				{
					sign = {
						namespace = { "diagnostic/signs" },
            colwidth = 1,
						fillchar = " ",

						auto = false,
					},
					click = "v:lua.ScSa",
				},
				{
          sign = {
            name = { "vimspectorBP", "vimspectorBPCond", "vimspectorBPLog", "vimspectorBPDisabled", "vimspectorPC", "vimspectorPCBP", "vimspectorNonActivePC", "vimspectorCurrentThread", "vimspectorCurrentFrame" },
            maxwidth = 1,
            fillchar = " ",
            auto = false
          },
          click = "v:lua.ScSa"
        },
			},
			clickmod = clickmod,
			clickhandlers = {
				Lnum = builtin.lnum_click,
				FoldClose = builtin.foldclose_click,
				FoldOpen = builtin.foldopen_click,
				FoldOther = builtin.foldother_click,
				DapBreakpointRejected = builtin.toggle_breakpoint,
				DapBreakpoint = builtin.toggle_breakpoint,
				DapBreakpointCondition = builtin.toggle_breakpoint,
				["diagnostic/signs"] = builtin.diagnostic_click,
				gitsigns = builtin.gitsigns_click,
			},
		}
		statuscol.setup(cfg)
		vim.opt.number = true
		vim.opt.signcolumn = "no"
    vim.opt.foldcolumn = "auto:2"
	end,
}

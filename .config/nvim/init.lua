local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.opt.guicursor = "i:block"

require("vim-options")
require("lazy").setup("plugins")

vim.cmd([[
highlight DiagnosticHint guifg=#c586c0 
]])

local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	["vb"] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	["sb"] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

vim.cmd([[
highlight CustomStatusBar guifg=#d4d4d4 guibg=#373737
highlight DiagnosticSignErrorSt guifg=#f44747 guibg=#373737
highlight DiagnosticSignWarnSt guifg=#dcdcaa guibg=#373737
highlight DiagnosticSignHintSt guifg=#c586c0 guibg=#373737
highlight DiagnosticSignInfoSt guifg=#569cd6 guibg=#373737
]])

vim.cmd([[
highlight VertSplit guifg=#373737 guibg=#1f1f1f
highlight StatusLineNC guifg=#d4d4d4 guibg=#373737
highlight CursorLine guibg=#282828
]])

vim.cmd([[
highlight NeoTreeCursorLine guibg=#282828
]])

vim.cmd([[
highlight MsgArea guibg=#373737
highlight ModeMsg guifg=#d4d4d4 guibg=#373737
highlight MoreMsg guifg=#d4d4d4 guibg=#373737
highlight Question guifg=#569cd6 guibg=#373737
highlight ErrorMsg guifg=#f44747 guibg=#373737
highlight WinBar cterm=None gui=None guifg=#d4d4d4 guibg=#373737
highlight WinBarNC guifg=#d4d4d4 guibg=#373737
highlight Directory guifg=#569cd6
]])

vim.cmd([[
highlight DiffDelete guibg=#4b1818
highlight DiffChange guibg=#184b4b
highlight DiffText guibg=#4b4b18
highlight DiffAdd  guibg=#184b18
]])

vim.cmd([[
highlight DapUIPlayPause guifg=#4ec9b0 guibg=#373737
highlight DapUIPlayPauseNC guifg=#4ec9b0 guibg=#373737
highlight DapUIRestart guifg=#4ec9b0 guibg=#373737
highlight DapUIRestartNC guifg=#4ec9b0 guibg=#373737
highlight DapUIStepBack guifg=#c586c0 guibg=#373737
highlight DapUIStepBackNC guifg=#c586c0 guibg=#373737
highlight DapUIStepInto guifg=#c586c0 guibg=#373737
highlight DapUIStepIntoNC guifg=#c586c0 guibg=#373737
highlight DapUIStepOut guifg=#c586c0 guibg=#373737
highlight DapUIStepOutNC guifg=#c586c0 guibg=#373737
highlight DapUIStepOver guifg=#c586c0 guibg=#373737
highlight DapUIStepOverNC guifg=#c586c0 guibg=#373737
highlight DapUIStop guifg=#f44747 guibg=#373737
highlight DapUIStopNC guifg=#f44747 guibg=#373737
highlight DapUIUnavailable guifg=#51504f guibg=#373737
highlight DapUIUnavailableNC guifg=#51504f guibg=#373737
]])

vim.api.nvim_create_autocmd({ "TermOpen" }, { pattern = "*", command = "setlocal nonumber" })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.sld", "*.sls", "*.sps" },
	command = "setfiletype scheme",
})

vim.cmd([[
highlight TreesitterContextSeparator guifg=#51504f
]])

vim.cmd([[
highlight FloatBorder guifg=#5a5a5a guibg=#202020
]])

local lsp = vim.lsp
local ms = lsp.protocol.Methods
local float_opts = { border = "rounded" }

lsp.handlers[ms.textDocument_hover] = lsp.with(lsp.handlers.hover, float_opts)
lsp.handlers[ms.textDocument_signatureHelp] = lsp.with(lsp.handlers.signature_help, float_opts)

vim.g.neovide_resize_increments = true

vim.g.neovide_cursor_trail_size = 0

vim.g.neovide_cursor_animate_command_line = false

vim.g.neovide_scroll_animation_length = 0

vim.g.neovide_position_animation_length = 0
vim.g.neovide_cursor_animation_length = 0.00
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0.00

vim.g.neovide_floating_shadow = false

vim.g.neovide_cursor_vfx_mode = ""

vim.g.neovide_background_color = '#ffffff'

local opts = require("nvlime.config")
local function with_leader(key)
	return (opts.leader .. key)
end
vim.g.nvlime_mappings = {
  global = {
    normal = {
      close_nvlime_windows = with_leader("Ww"),
    }
  },
	lisp = {
		normal = {
			server = {
        rename = with_leader("rN"),
        new = with_leader("rR"),
				stop = with_leader("rt"),
				stop_selected = with_leader("rT"),
				restart = with_leader("ry"),
			},
			repl = {
				show = with_leader("fo"),
				send_atom_expr = with_leader("fs"),
				send_atom = with_leader("fa"),
				send_expr = with_leader("fn"),
				send_toplevel_expr = with_leader("fm"),
				prompt = with_leader("fee"),
			},
			trace = {
				prompt = with_leader("te"),
			},
			macro = {
        expand = with_leader("Mm"),
        expand_once = with_leader("Mo"),
        expand_all = with_leader("Ma") },
		},
		visual = {
			inspect = {
				selection = with_leader("I"),
			},
		},
	},
	repl = {
		normal = {
			inspect_result = "I",
		},
	},
	sldb = {
		normal = {
			local_var = {
				inspect = "I",
			},
		},
	},
	apropos = {
		normal = {
			inspect = "I",
		},
	},
	trace = {
		normal = {
			inspect_value = "I",
		},
	},
}

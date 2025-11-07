vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.wo.wrap = true
vim.wo.linebreak = true

vim.filetype.add({
	extension = {
		vert = "vert",
		tesc = "tesc",
		tese = "tese",
		geom = "geom",
		frag = "frag",
		comp = "comp",
		rgen = "rgen",
		rint = "rint",
		rahit = "rahit",
		rchit = "rchit",
		rmiss = "rmiss",
		rcall = "rcall",
	},
})
vim.treesitter.language.register(
	"glsl",
	{ "vert", "tesc", "tese", "geom", "frag", "comp", "rgen", "rint", "rahit", "rchit", "rmiss", "rcall" }
)

vim.keymap.set({ "n", "x", "o" }, "r", "f", { noremap = true })

vim.keymap.set({ "n", "x", "o" }, "R", "F", { noremap = true })

vim.keymap.set({ "n", "x", "o" }, "F", "r", { silent = true })

vim.keymap.set({ "n", "x", "o" }, "f", "<nop>", { silent = true, remap = true })

vim.keymap.set({ "n", "x", "o" }, "fh", "<nop>", { silent = true, remap = true })

vim.keymap.set({ "n", "x" }, "e", "w", { noremap = true })
vim.keymap.set({ "n", "x" }, "w", "e", { noremap = true })
vim.keymap.set({ "n", "x" }, "E", "W", { noremap = true })
vim.keymap.set({ "n", "x" }, "W", "W", { noremap = true })

vim.keymap.set("n", "fk", "n", { noremap = true })

vim.keymap.set({ "n", "x", "o" }, "n", "i", { noremap = true })

vim.keymap.set("n", "fi", "N", { noremap = true })

vim.keymap.set("n", "fj", "/", { noremap = true })
vim.cmd([[
  function VerifyAtEOL()
    if(col('$') ==# 1)
      return 1
    else
      return (col('$') - col('.')) ==# 1
    endif
  endfunction
]])

vim.cmd([[
  function VerifyAtBOL()
    if(col('.') ==# 1)
      return 1
    else
      return 0
    endif
  endfunction
]])

vim.cmd([[
  function VerifyLineHasChars()
    return col('$') ># 1
  endfunction
]])

vim.cmd([[
  function GetCurCol()
    return col('.')
  endfunction
]])

vim.keymap.set("n", "M", "m", { noremap = true })

vim.keymap.set("n", "m", "X", { noremap = true })
vim.keymap.set({ "x" }, "h", "x", { noremap = true })

vim.keymap.set({ "x", "o" }, "m", "a", { noremap = true })

vim.keymap.set({ "n", "x" }, "i", "k", { noremap = true })
vim.keymap.set({ "n", "x" }, "k", "j", { noremap = true })
vim.keymap.set({ "n", "x" }, "j", "h", { noremap = true })
vim.keymap.set({ "n", "x" }, "l", "l", { noremap = true })

vim.keymap.set("n", "<Leader>j", "gJ", { noremap = true })

vim.keymap.set("n", "<Leader>hk", function()
	vim.cmd.call('append(line("."),   repeat([""], v:count1))')
	local cmd_count = vim.v.count
	if cmd_count == 0 then
		cmd_count = 1
	end
	vim.api.nvim_command("+" .. tostring(cmd_count))
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>hi", function()
	vim.cmd.call('append(line(".")-1,   repeat([""], v:count1))')
	local cmd_count = vim.v.count
	if cmd_count == 0 then
		cmd_count = 1
	end
	vim.api.nvim_command("-" .. tostring(cmd_count))
end, { noremap = true, silent = true }) -- changed gh, look at default gh mapping to see if it need to be replaced with another keymap

vim.cmd([[
  autocmd InsertLeave * :normal! `^
  set virtualedit=onemore
]])
vim.keymap.set("n", "<F6>", ":startinsert<CR>", { noremap = true })

vim.keymap.set({ "i", "x", "s" }, "<F6>", "<ESC>", { noremap = true })

vim.keymap.set({ "n", "x" }, "gh", "<home>", { noremap = true })

vim.keymap.set({ "n", "x" }, "gj", function()
	vim.cmd([[call setreg("n", ["", ""], "v")]])

	vim.cmd([[exe "normal" "\"n\]P"]])
end, { noremap = true })

vim.keymap.set({ "n" }, "<leader>fk", function()
	vim.cmd([[call setreg("b", "\(")]])
	vim.cmd([[call setreg("c", "\)")]])

	vim.cmd([[exe "normal" "\"b\Pl\"cP"]])
end, { noremap = true })

vim.keymap.set({ "n" }, "<leader>fi", function()
	vim.cmd([[call setreg("b", "\[")]])
	vim.cmd([[call setreg("c", "\]")]])

	vim.cmd([[exe "normal" "\"b\Pl\"cP"]])
end, { noremap = true })

vim.keymap.set({ "n" }, "<leader>fhk", function()
	vim.cmd([[call setreg("b", "\{")]])
	vim.cmd([[call setreg("c", "\}")]])

	vim.cmd([[exe "normal" "\"b\Pl\"cP"]])
end, { noremap = true })

vim.keymap.set({ "n" }, "<leader>fhi", function()
	vim.cmd([[call setreg("b", "\|")]])
	vim.cmd([[call setreg("c", "\|")]])

	vim.cmd([[exe "normal" "\"b\Pl\"cP"]])
end, { noremap = true })

vim.keymap.set({ "n" }, "<leader>fhh", function()
	vim.cmd([[call setreg("b", "\"")]])
	vim.cmd([[call setreg("c", "\"")]])

	vim.cmd([[exe "normal" "\"b\Pl\"cP"]])
end, { noremap = true })

vim.keymap.set({ "n" }, "<leader>fhu", function()
	vim.cmd([[call setreg("b", "\'")]])
	vim.cmd([[call setreg("c", "\'")]])

	vim.cmd([[exe "normal" "\"b\Pl\"cP"]])
end, { noremap = true })

vim.keymap.set({ "n", "x" }, "gm", function()
	local line_has_chars = vim.api.nvim_call_function("VerifyLineHasChars", {})
	vim.api.nvim_command('echo "' .. tostring(line_has_chars) .. '"')
	if tonumber(line_has_chars) > 0 then
		local keys = vim.api.nvim_replace_termcodes("<end>l", true, false, true)
		vim.api.nvim_feedkeys(keys, "m", false)
		vim.api.nvim_command('echom "true"')
		vim.api.nvim_command('echo "' .. tostring(line_has_chars) .. '"')
	end
end, { noremap = true })

vim.keymap.set({ "n", "x" }, "g$", "go", { noremap = true })

vim.keymap.set({ "n", "x" }, "gn", "g_", { noremap = true })

vim.keymap.set("n", "<leader>ej", ":wincmd h<CR>", {})
vim.keymap.set("n", "<leader>ek", ":wincmd j<CR>", {})
vim.keymap.set("n", "<leader>ei", ":wincmd k<CR>", {})
vim.keymap.set("n", "<leader>el", ":wincmd l<CR>", {})

vim.keymap.set("n", "<leader>w", ":w<CR>", {})

vim.keymap.set("n", "<leader>rg", ":bprevious <bar> bdelete #<CR>", {})

vim.keymap.set("n", "<leader>ff", ":q<CR>", {})
vim.keymap.set("n", "<leader>re", ":qa<CR>", {})
vim.keymap.set("n", "<leader>vv", ":q!<CR>", {})
vim.keymap.set("n", "<leader>vd", ":bprevious <bar> bdelete! #<CR>", {})

vim.keymap.set("n", "<leader>rh", ":enew<CR>", {})

vim.keymap.set("n", "<leader>rj", ":vertical leftabove split<CR>", {})

vim.keymap.set("n", "<leader>rl", ":vertical rightbelow split<CR>", {})

vim.keymap.set("n", "<leader>ri", ":horizontal leftabove split<CR>", {})

vim.keymap.set("n", "<leader>rk", ":horizontal rightbelow split<CR>", {})

vim.keymap.set("n", "<leader>gi", "<C-o>", {})
vim.keymap.set("n", "<leader>gk", "<C-i>", {})
vim.keymap.set("n", "<leader>gj", ":b#<CR>", {})

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", {})
vim.keymap.set("n", "<leader>th", ":tabclose<CR>", {})
vim.keymap.set("n", "<leader>tk", ":tabnext<CR>", {})
vim.keymap.set("n", "<leader>ti", ":tabprevious<CR>", {})

vim.keymap.set("n", "<C-r>", "h", { noremap = true })
vim.keymap.set("n", "h", "<C-r>", { noremap = true })
vim.keymap.set("n", "U", "<C-r>", { noremap = true })

vim.keymap.set({ "n", "x" }, "N", "I", { noremap = true })

vim.keymap.set({ "n", "x" }, "<leader>fj", "a", { noremap = true })

vim.keymap.set({ "n", "x" }, "f<Space>j", "A", { noremap = true })

vim.keymap.set({ "n", "x" }, "fm", "S", { noremap = true })

vim.keymap.set({ "n", "x" }, "fn", "o", { noremap = true })

vim.keymap.set({ "n", "x" }, "I", "%", { silent = true })

vim.keymap.set("i", "<Up>", function()
	vim.api.nvim_command("-1")
end, { silent = true })
vim.keymap.set("i", "<Down>", function()
	vim.api.nvim_command("+1")
end, { silent = true })

vim.g.jukit_shell_cmd = "ipython3"

vim.g.jukit_terminal = ""

vim.g.jukit_auto_output_hist = 0

vim.g.jukit_use_tcomment = 0

vim.g.jukit_comment_mark = "#"

vim.g.jukit_mappings = 1

vim.g.jukit_mappings_ext_enabled = "*"

vim.g.jukit_notebook_viewer = "jupyter-notebook"

vim.g.jukit_convert_overwrite_default = -1

vim.g.jukit_convert_open_default = -1

vim.g.jukit_file_encodings = "utf-8"

vim.g.jukit_venv_in_output_hist = 1

vim.g.jukit_highlight_markers = 0
vim.g.jukit_enable_textcell_bg_hl = 0

vim.g.vimwiki_list = {
	{
		path = "~/vimwiki/",
		syntax = "markdown",
		ext = "md",
	},
}

vim.keymap.set(
	{ "n", "x" },
	"<Leader>gn",
	[[:silent execute '!chromium --incognito ' . shellescape(expand('<cfile>'), 1)<CR>]],
	{}
)

vim.g.bullets_enabled_file_types = {
	"markdown",
	"gitcommit",
}
vim.g.bullets_enable_in_empty_buffers = 0

vim.g.wiki_root = "~/docs/"
vim.keymap.set("n", "<leader>gh", ":WikiLinkFollow<CR>", {})
vim.g.wiki_mappings_prefix = "<leader>s"

vim.g.vimtex_view_method = "zathura"
vim.g.maplocalleader = " "
vim.maplocalleader = " "

vim.o.foldmethod = "manual"

vim.keymap.set({ "n", "x" }, "g<Space>i", "zo")
vim.keymap.set({ "n", "x" }, "g<Space>k", "zc")
vim.keymap.set({ "n", "x" }, "g<Space>j", "za")
vim.keymap.set({ "n", "x" }, "g<Space>n", "zf")
vim.keymap.set({ "n", "x" }, "g<Space>m", "zD")

vim.keymap.set("n", "<Leader>rm", ":below terminal ./main<CR>")

vim.keymap.set("n", "ftk", "<C-w><C-w>", { noremap = true })

vim.keymap.set("n", "fti", "<C-w><C-b>", { noremap = true })

vim.keymap.set("n", "fen", ":cnext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "feh", ":cbelow<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "fem", ":cprev<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "feu", ":cabove<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "fef", ":crewind<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "fec", ":clast<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "fej", ":copen<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "ff", ":cclose<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>hh", ":nohlsearch<CR>")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function(event)
		local opts = { buffer = event.buf, silent = true }

		vim.keymap.set("n", "e", "<CR><C-w><C-p>", opts) -- keep focus in qflist
		vim.keymap.set("n", "h", "<CR>", opts) -- qflist is readonly
	end,
})

local jcd_to_qf = function()
	local query = vim.treesitter.query.parse(
		"python",
		[[
    ; ipy (jupyter) cells
    ((comment) @jupyter.cell
      (#lua-match? @jupyter.cell "# [%%][%%].*" ))
  ]]
	)
	local tree = vim.treesitter.get_parser():parse()[1]
	local qf_list = {}
	local cur_bufnr = vim.api.nvim_get_current_buf()
	local node_row = nil
	local node_column = nil

	for id, node, metadata in query:iter_captures(tree:root(), 0) do
		node_row, node_column, _ = node:start()
		table.insert(qf_list, {
			bufnr = cur_bufnr,
			lnum = node_row + 1,
			col = node_column,
			text = vim.treesitter.get_node_text(node, cur_bufnr),
		})
	end
	vim.fn.setqflist(qf_list, " ")
end

vim.api.nvim_create_user_command("JCDToQF", jcd_to_qf, { nargs = 0 })

vim.keymap.set("n", "<Leader>feN", jcd_to_qf, { noremap = true })

vim.g.VM_maps = {
	["i"] = "n",
	["I"] = "N",
	["Find Next"] = "fk",
	["Find Prev"] = "fi",
	["Find Operator"] = "M", -- leave m for "around" in select
	["Replace Characters"] = "",
	["Replace"] = "F",
	["Visual Find"] = "g<Space>r",
	["Goto Next"] = "gk",
	["Goto Prev"] = "gi",
	["Select All"] = "<Space>H",
	["Visual All"] = "<Space>H",
	["Visual Add"] = "<Space>h",
	["Align"] = "<Space>h",
	["Filter Regions"] = "g<Space>r",
	["Split Regions"] = "<Space>er",
	["Transform Regions"] = "<Space>ef",
	["Search Menu"] = "<Space>F",
	["Run Ex"] = "<Space>en",
	["Run Last Ex"] = "<Space>eN",
	["Toggle Multiline"] = "<Leader>em",
	["Rewrite Last Search"] = "<Space>fu",
}

vim.g.VM_custom_motions = { ["i"] = "k", ["j"] = "h", ["k"] = "j", ["r"] = "f", ["R"] = "F" }

vim.g.VM_custom_remaps = {
	["I"] = "<C-Up>",
	["K"] = "<C-Down>",
	["J"] = "<S-Left>",
	["L"] = "<S-Right>",
	["fh"] = "<Esc>",
	["fj"] = "/",
	["H"] = "s",
	["<Space>j"] = "\\z",
	["<Space>J"] = "\\Z",
}

vim.g.VM_leader = "<Space>"

vim.keymap.set({ "n", "x" }, "K", vim.lsp.buf.hover, { silent = true })
vim.keymap.set({ "n", "x" }, "<Leader>ecK", "<Plug>(VM-Add-Cursor-Down)", { noremap = true })
vim.keymap.set({ "n", "x" }, "<Leader>ecI", "<Plug>(VM-Add-Cursor-Up)", { noremap = true })
vim.keymap.set({ "n", "x" }, "<Leader>ecc", "<Plug>(VM-Add-Cursor-At-Pos)", { noremap = true })

vim.cmd([[exe "normal" "\<Plug>(VM-Toggle-Mappings)"]])

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("EnterVMPre", {}),
	pattern = "visual_multi_start",

	callback = function(env)
		vim.keymap.del("n", "<leader>hf")
		vim.keymap.del("n", "<leader>hg")
		vim.keymap.del("n", "<leader>ht")
		vim.keymap.del("n", "<leader>hr")
		vim.keymap.del("n", "<leader>he")
		vim.keymap.del("n", "<Leader>hk")
		vim.keymap.del("n", "<Leader>hi")
		vim.keymap.del("n", "<Leader>j")
		vim.keymap.del("n", "<leader>er", { buffer = 0 })
		vim.keymap.del("n", "<leader>ef", { buffer = 0 })
		vim.keymap.del("n", "<leader>m")
		vim.keymap.del("n", "<leader>en")
		vim.keymap.del("n", "<leader>em")
		vim.keymap.del("n", "<Leader>fen")
		vim.keymap.del("n", "<Leader>dm")
		vim.keymap.del("n", "<Leader>dl")
		vim.keymap.del("n", "<Leader>dn")
		vim.keymap.del("n", "<Leader>dk")
		vim.keymap.del("n", "<Leader>dg")
		vim.keymap.del("n", "<Leader>di")
		vim.keymap.del("n", "<Leader>db")
		vim.keymap.del("n", "<Leader>dh")
		vim.keymap.del("n", "<Leader>dB")
		vim.keymap.del("n", "<Leader>du")
		vim.keymap.del("n", "<Leader>dv")
		vim.keymap.del("n", "<Leader>dV")
		vim.keymap.del("n", "<Leader>dr")
		vim.keymap.del("n", "<Leader>dj")
		vim.keymap.del("n", "<Leader>dc")
		vim.keymap.del({ "n", "v" }, "<Leader>do")
		vim.keymap.del({ "n", "v" }, "<Leader>dp")
		vim.keymap.del("n", "<Leader>dw")
	end,
})

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("LeaveVMPost", {}),
	pattern = "visual_multi_exit",

	callback = function(env)
		vim.keymap.set("n", "<leader>hf", ":lua MiniDiff.toggle_overlay()<CR>", { noremap = true, silent = true })
		vim.keymap.set(
			"n",
			"<leader>hg",
			":lua vim.fn.setqflist(MiniDiff.export('qf', { scope = 'current' }))<CR>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>ht",
			":lua vim.fn.setqflist(MiniDiff.export('qf', { scope = 'all' }))<CR>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set("n", "<leader>hr", ":lua vim.fn.setqflist({})<CR>", { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>hv", ":lua MiniDiff.toggle()<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>hk", function()
			vim.cmd.call('append(line("."),   repeat([""], v:count1))')
			local cmd_count = vim.v.count
			if cmd_count == 0 then
				cmd_count = 1
			end
			vim.api.nvim_command("+" .. tostring(cmd_count))
		end, { noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>hi", function()
			vim.cmd.call('append(line(".")-1,   repeat([""], v:count1))')
			local cmd_count = vim.v.count
			if cmd_count == 0 then
				cmd_count = 1
			end
			vim.api.nvim_command("-" .. tostring(cmd_count))
		end, { noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>j", "gJ", { noremap = true })
		vim.keymap.set(
			"n",
			"<leader>er",
			"<cmd>Telescope diagnostics bufnr=0<CR>",
			{ buffer = 0, silent = true, desc = "Show buffer diagnostics" }
		) -- show  diagnostics for file
		vim.keymap.set(
			"n",
			"<leader>ef",
			vim.diagnostic.open_float,
			{ buffer = 0, silent = true, desc = "Show line diagnostics" }
		) -- show diagnostics for line
		local telescope_builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>m", telescope_builtin.buffers, {})
		vim.keymap.set("n", "<leader>en", telescope_builtin.live_grep, {})
		vim.keymap.set("n", "<leader>em", telescope_builtin.find_files, {})
		vim.keymap.set("n", "<Leader>fen", jcd_to_qf, { noremap = true })
	end,
})

vim.cmd([[augroup IPYNVimFTCell
  autocmd!
  autocmd FileType c,cpp,rust,javascript,typescript  if !exists('b:ipy_celldef') | let b:ipy_celldef = '^// %%' | endif
  autocmd FileType python,julia  if !exists('b:ipy_celldef') | let b:ipy_celldef = '^# %%' | endif
  autocmd FileType racket  if !exists('b:ipy_celldef') | let b:ipy_celldef = '^; %%' | endif
  autocmd FileType * if !exists('b:ipy_celldef') | let b:ipy_celldef = '^# %%' | endif
augroup END]])

vim.keymap.set("n", "<Leader>vk", function()
	vim.cmd("VCoolor")
end)
vim.keymap.set("n", "<Leader>vi", function()
	vim.cmd("VCoolIns r")
end)
vim.keymap.set("n", "<Leader>vh", function()
	vim.cmd("VCoolIns h")
end)
vim.keymap.set("n", "<Leader>vn", function()
	vim.cmd("VCoolIns ra")
end)

vim.g.vcoolor_disable_mappings = 1

vim.g.vcoolor_custom_picker = 'GTK_THEME=Adwaita:dark zenity --title "Color Picker" --color-selection --color '

vim.keymap.set("n", "<Leader>ecm", ":tab split<CR>")

vim.cmd("set noshowcmd")

vim.cmd("set laststatus=0")

function _G.current_treesitter_context()
	local f = require("nvim-treesitter").statusline({
		indicator_size = 300,
		type_patterns = {
			"class",
			"function",
			"method",
			"interface",
			"type_spec",
			"table",
			"if_statement",
			"for_statement",
			"for_in_statement",
		},
	})
	local context = string.format("%s", f) -- convert to string, it may be a empty ts node

	if context == "vim.NIL" then
		return ""
	end
	return " " .. context
end

vim.cmd("set winbar=%<%F\\ %=%h%m%r")

vim.cmd("set guifont=BlexMono\\ Nerd\\ Font\\ Light:h16")

vim.opt.fillchars = {
	horiz = "█",
	horizup = "█",
	horizdown = "█",
	vert = "█",
	vertleft = "█",
	vertright = "█",
	verthoriz = "█",
}

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

vim.diagnostic.config({ virtual_text = false, severity_sort = false, float = { border = "rounded" } }) -- disable inline errors/warns/suggestions

vim.cmd.colorscheme(vim.g.colors_name)

vim.keymap.set({ "n", "x" }, "g<Space>t", function()
	return vim.v.count .. "%"
end, { noremap = true, expr = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "neo-tree", "dbui" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
		vim.opt_local.foldcolumn = "0"
		vim.wo.foldcolumn = "0"
	end,
})

vim.api.nvim_create_user_command("DiffSelfGit", function()
	local filename = vim.api.nvim_buf_get_name(0)
	local cmd = "enew "
	if vim.loop.fs_stat(filename) ~= nil then
		cmd = cmd .. (" | r ! git diff %s"):format(filename)
	end
	vim.cmd(cmd)
end, { nargs = 0 })

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrw_gitignore = 1

vim.keymap.set({ "n", "x" }, "<Leader>vj", function()
	vim.cmd(
		[[execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . b:vimtex.compiler.file_info.root . "/" . b:vimtex.compiler.file_info.target_name  . ".pdf"]]
	)
end, { noremap = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("compileAndRunLatex", { clear = true }),
	pattern = { "tex" },
	callback = function()
		vim.api.nvim_set_keymap(
			"n",

			"<Leader>fn",
			":w<CR>:below split|:terminal!latexmk -f -verbose -file-line-error -synctex=1 -interaction=nonstopmode -pdf "
				.. vim.b.vimtex.compiler.file_info.root
				.. "/"
				.. vim.b.vimtex.compiler.file_info.target_name
				.. " <CR>",
			{ noremap = true, silent = true }
		)
	end,
})

vim.keymap.set({ "n", "t" }, "<C-k>", "<C-\\><C-n>", { noremap = true })

vim.keymap.set("n", "<Leader>hef", ":lua require('ferris.methods.expand_macro')()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>her", ":lua require('ferris.methods.rebuild_macros')()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>hec", ":lua require('ferris.methods.reload_workspace')()<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>,,", ":DBUIToggle<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>d,", ":DBUIFindBuffer<CR>", { noremap = true })

vim.g.db_ui_force_echo_notifications = 1

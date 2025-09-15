return {
	"pogyomo/submode.nvim",
	event = "VeryLazy",
	config = function()
		local submode = require("submode")

		submode.create("WinResize", {
			mode = "n",
			enter = "<Space>rs",
			leave = { "fh", "h", "m", "q", "<ESC>" },
			default = function(register)
				register("j", "<cmd>vertical resize -1<cr>")
				register("i", "<cmd>resize +1<cr>")
				register("k", "<cmd>resize -1<cr>")
				register("l", "<cmd>vertical resize +1<cr>")
			end,
		})

		submode.create(
			"ArrowKeysModeVM",
			{ -- toggle Visual Multi normal mappings by issuing <Leader><Space>, where <Leader> normally is set to <Space>, to leave out enable mappings in VM again (<Leader><Space>)
				mode = "n",
				enter = "fek",
				leave = { "<Leader><Space>", "fh", "q", "<ESC>" },
				default = function(register)
					register("l", "<Right>")
					register("j", "<Left>")
					register("i", "<Up>")
					register("k", "<Down>")
					register("u", "<PageUp>")
					register("h", "<PageDown>")
					register("m", "<Plug>(VM-Add-Cursor-At-Pos)")
				end,
			}
		)

		submode.create("ArrowKeysModeVMV", { -- to leave out enable mappings in VM again (<Leader><Space>)
			mode = "x",
			enter = "fek",
			leave = { "<Leader><Space>", "fh", "q", "<ESC>" },
			default = function(register)
				register("l", "<Right>")
				register("j", "<Left>")
				register("i", "<Up>")
				register("k", "<Down>")
				register("u", "<PageUp>")
				register("h", "<PageDown>")
				register("m", "<Plug>(VM-Add-Cursor-At-Pos)")
			end,
		})

		local miniMove = require("mini.move")

		submode.create("ShiftModeV", {
			mode = "x",
			enter = "fer",
			leave = { "fh", "h", "m", "q", "<ESC>" },
			default = function(register)
				register("l", function()
					miniMove.move_selection("right")
				end)
				register("j", function()
					miniMove.move_selection("left")
				end)
				register("i", function()
					miniMove.move_selection("up")
				end)
				register("k", function()
					miniMove.move_selection("down")
				end)
			end,
		})

		submode.create("ShiftMode", {
			mode = "n",
			enter = "fer",
			leave = { "fh", "h", "m", "q", "<ESC>" },
			default = function(register)
				register("l", function()
					miniMove.move_line("right")
				end)
				register("j", function()
					miniMove.move_line("left")
				end)
				register("i", function()
					miniMove.move_line("up")
				end)
				register("k", function()
					miniMove.move_line("down")
				end)
			end,
		})

		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		submode.create("RepeatNavMode", {
			mode = "n",
			enter = "fet",
			leave = { "fh", "q", "<ESC>" },
			default = function(register)
				register("h", ts_repeat_move.repeat_last_move_next)

				register("u", ts_repeat_move.repeat_last_move_previous)
			end,
		})

		submode.create("FindPersist", {
			mode = "n",
			enter = "<Space>et",
			leave = { "eh", "q", "<ESC>" },
			default = function(register)
				register("n", "<cmd>cnext<cr>")
				register("h", "<cmd>cbelow<cr>")
				register("m", "<cmd>cprev<cr>")
				register("u", "<cmd>cabove<cr>")
				register("ef", "<cmd>cc<cr>")
				register("ec", "<cmd>clast<cr>")
				register("f", "<cmd>cclose<cr>")
				register("ej", "<cmd>copen<cr>")
				register("k", "n")
				register("i", "N")
				register("j", "/")
				register("tk", "<c-w><c-w>")
				register("ti", "<c-w><c-b>")
			end,
		})
		local switchable = { __index = nil }

		local make_sw_w_def = function(t)
			setmetatable(t, switchable) -- enable __index (default) values/functions
			return t
		end

		local switch_from_sw = function(t, c)
			local f = t[c]
			if f then
				f()
			end
		end

		local enter_arrow_k_mode = function()
			if next(vim.b.VM_Selection or {}) ~= nil then
				vim.cmd([[exe "normal" "\<Plug>(VM-Toggle-Mappings)"]])
				vim.keymap.set("n", "<leader>er", "<nop>", { buffer = 0, silent = true }) -- show  diagnostics for file
				vim.keymap.set(
					"n",
					"<leader>ef",
					vim.diagnostic.open_float,
					{ buffer = 0, silent = true, desc = "Show line diagnostics" }
				) -- show diagnostics for line
			else
			end
		end

		local leave_arrow_k_mode = function()
			if next(vim.b.VM_Selection or {}) ~= nil then
				vim.cmd([[exe "normal" "\<Plug>(VM-Toggle-Mappings)"]])
			else
			end
		end

		local submode_enter_pre_ev_h = make_sw_w_def({
			["FindPersist"] = function()
				vim.keymap.del("n", "ff")
				vim.keymap.del("n", "fej")
				vim.keymap.del("n", "fef")
				vim.keymap.del("n", "feh")
				vim.keymap.del("n", "feu")
				vim.keymap.del("n", "fec")
				vim.keymap.del("n", "fen")
				vim.keymap.del("n", "fem")
				vim.keymap.del("n", "fti")
				vim.keymap.del("n", "ftk")
				vim.keymap.del("n", "fj")
				vim.keymap.del("n", "fi")
				vim.keymap.del("n", "fk")
			end,
			["ArrowKeysModeVM"] = enter_arrow_k_mode,
			["ArrowKeysModeVMV"] = enter_arrow_k_mode,
		})

		local submode_leave_pre_ev_h = make_sw_w_def({
			["FindPersist"] = function()
				vim.keymap.set("n", "ftk", "<c-w><c-w>", { noremap = true })
				vim.keymap.set("n", "fti", "<c-w><c-b>", { noremap = true })
				vim.keymap.set("n", "fen", ":cnext<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "fem", ":cprev<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "fef", ":crewind<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "feh", ":cbelow<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "feu", ":cabove<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "fec", ":clast<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "fej", ":copen<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "ff", ":cclose<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "fj", "/", { noremap = true })
				vim.keymap.set("n", "fi", "N", { noremap = true })
				vim.keymap.set("n", "fk", "n", { noremap = true })
			end,
		})

		local submode_leave_pos_ev_h = make_sw_w_def({
			["ArrowKeysModeVM"] = leave_arrow_k_mode,
			["ArrowKeysModeVMV"] = leave_arrow_k_mode,
		})

		vim.api.nvim_create_autocmd("User", {
			group = vim.api.nvim_create_augroup("EnterSubmodePre", {}),
			pattern = "SubmodeEnterPre",
			callback = function(env)
				switch_from_sw(submode_enter_pre_ev_h, env.data.name)
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			group = vim.api.nvim_create_augroup("LeaveSubmodePre", {}),
			pattern = "SubmodeLeavePre",
			callback = function(env)
				switch_from_sw(submode_leave_pre_ev_h, env.data.name)
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			group = vim.api.nvim_create_augroup("LeaveSubmodePost", {}),
			pattern = "SubmodeLeavePost",
			callback = function(env)
				switch_from_sw(submode_leave_pos_ev_h, env.data.name)
			end,
		})
	end,
}

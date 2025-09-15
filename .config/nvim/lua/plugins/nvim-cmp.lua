return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
		},
		"onsails/lspkind.nvim",
		"windwp/nvim-autopairs",
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local handlers = require("nvim-autopairs.completion.handlers")

		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done({
				filetypes = {
					["*"] = {
						["("] = {
							kind = {
								cmp.lsp.CompletionItemKind.Function,
								cmp.lsp.CompletionItemKind.Method,
							},
							handler = handlers["*"],
						},
					},
					lua = {
						["("] = {
							kind = {
								cmp.lsp.CompletionItemKind.Function,
								cmp.lsp.CompletionItemKind.Method,
							},
							handler = function(char, item, bufnr, rules, commit_character)
							end,
						},
					},

					tex = false,
				},
			})
		)

		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		local select_opts = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping({
				["<tab>"] = cmp.mapping(function(fallback)
					fallback()
				end, { "i", "s" }),
        ["<CR>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i", "s"}),
				["<C-i>"] = cmp.mapping.select_prev_item(),
				["<C-k>"] = cmp.mapping.select_next_item(),
				["<A-i>"] = cmp.mapping.select_prev_item(),
				["<A-k>"] = cmp.mapping.select_next_item(),
				["<A-u>"] = cmp.mapping.scroll_docs(-4),
				["<A-h>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<A-n>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<A-e>"] = cmp.mapping.abort(),
				["<A-j>"] = cmp.mapping.abort(),
				["<A-l>"] = cmp.mapping.confirm({ select = false }),
				["<C-l>"] = cmp.mapping.confirm({ select = false }),
				["<C-m>"] = cmp.mapping.confirm({ select = false }),
				["<A-m>"] = cmp.mapping.confirm({ select = false }),
				["<C-b>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
        { name = 'nvlime' },
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				fields = { "menu", "abbr", "kind" },
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = true,
					before = function(entry, item)
						local menu_icon = {
              nvlime = 'ν',
							nvim_lsp = "λ",
							luasnip = "σ",
							buffer = "β",
							path = "α",
						}
						item.menu = menu_icon[entry.source.name]
						return item
					end,
				}),
			},
		})

		vim.keymap.set({ "n", "s" }, "<leader>k", function()
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			end
		end, { silent = true })
		vim.keymap.set({ "n", "s" }, "<leader>i", function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { silent = true })
		vim.keymap.set({ "s" }, "<leader>e", function()
			local keys = vim.api.nvim_replace_termcodes("<C-o>s<C-space>", true, false, true)
			vim.api.nvim_feedkeys(keys, "m", false)
		end, { silent = true })
	end,
}

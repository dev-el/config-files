return {
	"neovim/nvim-lspconfig",
	version = "v1.x",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"

				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Show LSP definitions"

				keymap.set("n", "gd", "<C-]>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"

				keymap.set("n", "gN", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"

				keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

				opts.desc = "See available code actions"

				keymap.set({ "n", "v" }, "<leader>ci", vim.lsp.buf.code_action, opts) -- see available code actions; in visual mode will apply to selection

				opts.desc = "Smart rename"

				keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"

				keymap.set("n", "<leader>er", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"

				keymap.set("n", "<leader>ef", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"

				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"

				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Restart LSP"

				keymap.set("n", "<leader>rp", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		capabilities = vim.tbl_extend("force", capabilities, {
			workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = false,
				},
			},
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local path_lua = require("path")
		local RootDirFinder = require("root-dir-finder")

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["pyright"] = function()
				lspconfig["pyright"].setup({
					capabilities = capabilities,

					root_dir = lspconfig.util.root_pattern("pyrightconfig.json", "pyproject.toml", ".git"),
				})
			end,
			["ts_ls"] = function()
				lspconfig["ts_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
						"vue",
					},
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = "/usr/lib/node_modules/@vue/language-server",
								languages = { "vue" },
							},
						},
					},
					root_dir = function(p)
						local cur_dir = vim.fs.dirname(p)
						local root_dir_finder = RootDirFinder:new({
							may_contain_f = false,
							t = { "package.json" },
							f = { "deno.json", "deno.jsonc" },
						})
						local res = root_dir_finder:find_root_dir(cur_dir)
						path_lua.chdir(cur_dir)
						return res
					end,
					single_file_support = false,
				})
			end,
			["svelte"] = function()
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,
			["graphql"] = function()
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {

							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["rust_analyzer"] = function()
				lspconfig["rust_analyzer"].setup({
					capabilities = capabilities,
					settings = {
						["rust-analyzer"] = {
							diagnostics = {
								enable = true,
								styleLints = {
									enable = true,
								},

								disabled = { "unresolved-proc-macro" },
							},
							imports = {
								granularity = {
									group = "module",
								},
								prefix = "self",
							},
							cargo = {
								buildScripts = {
									enable = true,
								},
							},
							procMacro = {
								enable = true,
							},
							checkOnSave = true,
							check = {
								command = "clippy",
								workspace = true,
							},
						},
					},
				})
			end,
			["emmet_language_server"] = function()
				lspconfig["emmet_language_server"].setup({
					capabilities = capabilities,
					filetypes = {
						"css",
						"eruby",
						"html",
						"javascript",
						"javascriptreact",
						"less",
						"sass",
						"scss",
						"pug",
						"typescriptreact",
						"vue",
					},
					init_options = {
						includeLanguages = {
							html = "html",
							javascript = "javascript",
							css = "css",
							typescript = "typescript",
							vue = "vue",
						},
						excludeLanguages = {},
						extensionsPath = {},
						preferences = {},
						showAbbreviationSuggestions = true,
						showExpandedAbbreviation = "always",
						showSuggestionsAsSnippets = false,
						syntaxProfiles = {
							html = {
								self_closing_tag = true,
							},
							vue = {
								self_closing_tag = true,
							},
						},
						variables = {},
					},
				})
			end,
		})

		lspconfig["eslint"].setup({
			capabilities = capabilities,
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"vue",
				"svelte",
				"astro",
			},
		})

		lspconfig["denols"].setup({
			capabilities = capabilities,
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			settings = {
				deno = {
					enable = true,
					suggest = {
						imports = {
							hosts = {
								["https://deno.land"] = true,
							},
						},
					},
				},
			},
			root_dir = function(p)
				local cur_dir = vim.fs.dirname(p)
				local root_dir_finder = RootDirFinder:new({
					may_contain_f = true,
					t = { "deno.json", "deno.jsonc" },
					f = { "package.json" },
				})
				local res = root_dir_finder:find_root_dir(cur_dir)
				path_lua.chdir(cur_dir)
				return res
			end,
			single_file_support = false,
		})

		lspconfig["racket_langserver"].setup({
			capabilities = capabilities,
			cmd = { "racket", "--lib", "racket-langserver" },
			filetypes = { "racket" },
			root_dir = function(fname)
				local search_res = vim.fs.dirname(
					vim.fs.find({ ".git", "Akku.manifest", "manifest.scm" }, { path = fname, upward = true })[1]
				)
				local ret = (function()
					if search_res ~= nil then
						return search_res
					else
						return vim.fs.dirname(fname)
					end
				end)()
				return ret
			end,
			single_file_support = true,
		})

		lspconfig["scheme_langserver"].setup({
			capabilities = capabilities,
			cmd = {
				"/usr/local/bin/scheme-langserver",
				"~/scheme-langserver.log",
				"enable",
				"enable",
			},
			filetypes = { "scheme" },
			root_dir = function(fname)
				local search_res = vim.fs.dirname(
					vim.fs.find({ ".git", "Akku.manifest", "manifest.scm" }, { path = fname, upward = true })[1]
				)
				local ret = (function()
					if search_res ~= nil then
						return search_res
					else
						return vim.fs.dirname(fname)
					end
				end)()
				return ret
			end,
			single_file_support = true,
		})
	end,
}

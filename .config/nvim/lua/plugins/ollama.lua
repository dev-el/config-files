return {
	"nomnivore/ollama.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
	keys = {
		{
			"<leader>oo",
			":<c-u>lua require('ollama').prompt()<cr>",
			desc = "ollama prompt",
			mode = { "n", "v" },
		},

		{
			"<leader>oG",
			":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
			desc = "ollama Generate Code",
			mode = { "n", "v" },
		},
		{
			"<leader>og",
			":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
			desc = "ollama Generate Code",
			mode = { "n", "v" },
		},
		{
			"<leader>om",
			":<c-u>lua require('ollama').prompt('Modify_Code')<cr>",
			desc = "ollama Modify Code",
			mode = { "n", "v" },
		},
		{
			"<leader>os",
			":<c-u>lua require('ollama').prompt(Simplify_Code')<cr>",
			desc = "ollama Simplify Code",
			mode = { "n", "v" },
		},

		{
			"<leader>oe",
			":<c-u>lua require('ollama').prompt('Explain_Code')<cr>",
			desc = "ollama Explain Code",
			mode = { "n", "v" },
		},
		{
			"<leader>oi",
			":<c-u>lua require('ollama').prompt('Ask_About_Code')<cr>",
			desc = "ollama Ask About Code",
			mode = { "n", "v" },
		},
	},
	opts = {
		model = "llama3.1",
		url = "http://127.0.0.1:11434",
		serve = {
			on_start = false,
			command = "ollama",
			args = { "serve" },
			stop_command = "pkill",
			stop_args = { "-SIGTERM", "ollama" },
		},
		prompts = {
			Sample_Prompt = {
				prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
				input_label = "> ",
				model = "mistral-nemo",
				action = "display",
			},
		},
	},
}

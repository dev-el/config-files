return {
	'LukasPietzschmann/telescope-tabs',
	config = function()
		require('telescope').load_extension 'telescope-tabs'
		require('telescope-tabs').setup {
			vim.keymap.set('n', '<leader>tm', ':Telescope telescope-tabs list_tabs<CR>', { desc = 'List Tabs (Telescope)' })
		}
	end,
	dependencies = { 'nvim-telescope/telescope.nvim' },
}

return {
  'bfredl/nvim-ipy',
  config = function()
    vim.keymap.set('n', '<leader><space>', '<Plug>(IPy-RunCell)', {noremap = true})
    vim.keymap.set('n', '<leader>all', '<Plug>(IPy-RunAllCells)', {noremap = true})
    vim.keymap.set({'n', 'x'}, '<leader>feu', '<Plug>(IPy-Run)', {noremap = true})
    vim.keymap.set('n', '<leader>cc', '<Plug>(IPy-Clear)', {noremap = true})
    vim.keymap.set('n', '<leader>feh', '<Plug>(IPy-Interrupt)', {noremap = true})
    vim.keymap.set('n', '<leader>fem', '<Plug>(IPy-Terminate)', {noremap = true})

    vim.keymap.set('n', '<leader>eh', '<Plug>(IPy-WordObjInfo)', {noremap = true})
    vim.keymap.set('n', '<leader>fen', '<Plug>(IPy-WordObjInfo)', {noremap = true})
    vim.keymap.set('n', '<leader>fer', '<Plug>(IPy-Restart)', {noremap = true})
  end,
}

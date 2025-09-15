return {
  'kevinhwang91/nvim-ufo',
  dependencies = {'kevinhwang91/promise-async'},
  config = function()
    vim.o.foldcolumn = 'auto:1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    local ufo = require('ufo')

    vim.keymap.set({'n', 'x'}, 'g<Space>I', ufo.openAllFolds)
    vim.keymap.set({'n', 'x'}, 'g<Space>K', ufo.closeAllFolds)
    vim.keymap.set({'n', 'x'}, 'g<Space>i', 'zo')
    vim.keymap.set({'n', 'x'}, 'g<Space>k', 'zc')
    vim.keymap.set({'n', 'x'}, 'g<Space>j', 'za')
    vim.keymap.set({'n', 'x'}, 'g<Space>n', 'zf')
    vim.keymap.set({'n', 'x'}, 'g<Space>m', 'zD')

    ufo.setup({
      ---@diagnostic disable-next-line: unused-local
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    })
  end
}

return {
  'kevinhwang91/nvim-ufo',
  dependencies = {'kevinhwang91/promise-async'},
  config = function()
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99

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
        if buftype == "" then
          return {'treesitter', 'indent'}
        else
          return ''
        end
      end
    })

    vim.api.nvim_create_autocmd("BufWinEnter", {
      callback = function(args)
        local bufnr = args.buf
        local bt = vim.bo[bufnr].buftype
        local bn = vim.api.nvim_buf_get_name(bufnr)

        local ok, u = pcall(require, "ufo")
        if not ok or not u then
          return
        end
        if bt ~= "" or vim.fn.empty(bn) == 1 then
          u.detach(bufnr)
        else
          u.attach(bufnr)
        end
      end,
    })
  end
}

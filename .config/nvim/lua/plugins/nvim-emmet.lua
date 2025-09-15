return {
  "olrtg/nvim-emmet",
  config = function()
    vim.keymap.set({ "n", "x" }, '<leader>ee', require('nvim-emmet').wrap_with_abbreviation)
  end,
}

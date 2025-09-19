return {
  "hedyhli/outline.nvim",
  config = function()
    vim.keymap.set("n", "<leader>fen", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

    require("outline").setup({
      keymaps = {
        unfold = "h",
        fold = "u",
        fold_toggle = "e",
        goto_location = {"n", "gd"},
        fold_reset = "H",
        rename_symbol = "R",
        peek_location = "r",
        code_actions = 'ci',
      }
    })
  end
}

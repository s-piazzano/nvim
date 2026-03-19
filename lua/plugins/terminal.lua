return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 12,
      open_mapping = [[<C-t>]], -- Prova prima questo
      direction = "horizontal",
    })

    -- AGGIUNGI QUESTO: Mapping manuale di emergenza
    -- Se Ctrl+t non va, scrivi :T per aprirlo
    vim.api.nvim_create_user_command("T", "ToggleTerm", {})
    -- Oppure usa Spazio + t
    vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Apri Terminale" })
  end,
}

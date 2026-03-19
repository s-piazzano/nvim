return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        relativenumber = true,
      },
      -- Opzioni grafiche
      renderer = {
        group_empty = true,
      },
      -- Chiudi l'albero se è l'ultimo buffer rimasto aperto
      filters = {
        dotfiles = false,
      },
    })

    -- Mapping per aprire/chiudere l'albero con <Leader>e (Spazio + e)
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
  end,
}

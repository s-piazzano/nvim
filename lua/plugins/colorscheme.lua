return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- Caricalo subito all'avvio
    priority = 1000, -- Assicurati che venga caricato prima degli altri
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}

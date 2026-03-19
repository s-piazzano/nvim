return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "lua_ls", 
          "ts_ls",        -- TypeScript/JavaScript
          "tailwindcss", 
          "eslint", 
          "jsonls" 
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- NOTA: In Neovim 0.11+ si usa vim.lsp.config invece del vecchio require('lspconfig')
      -- Per mantenere compatibilità con Windows e Mac, usiamo un check
      
      local servers = { "lua_ls", "ts_ls", "tailwindcss", "eslint", "jsonls" }
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      for _, lsp in ipairs(servers) do
        -- Se esiste il nuovo metodo (Nvim 0.11+), usiamo quello
        if vim.lsp.config then
            vim.lsp.config(lsp, { capabilities = capabilities })
        else
            -- Altrimenti usiamo il vecchio metodo (per versioni precedenti)
            require("lspconfig")[lsp].setup({ capabilities = capabilities })
        end
      end
    end,
  },
}

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
          "ts_ls",        -- TypeScript/JavaScript (React Native)
          "tailwindcss",  -- Tailwind CSS
          "eslint",       -- Errori di sintassi
          "jsonls"        -- Per i file package.json
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = { "lua_ls", "ts_ls", "tailwindcss", "eslint", "jsonls" }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({ capabilities = capabilities })
      end
    end,
  },
}

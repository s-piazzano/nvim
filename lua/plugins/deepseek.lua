return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim", -- Per cercare file in tutto il progetto
    "stevearc/dressing.nvim",        -- Menu grafici per l'agente
  },
  config = function()
    require("codecompanion").setup({
      -- 1. STRATEGIE (Pieni Poteri Agentici)
      strategies = {
        chat = {
          adapter = "deepseek",
          -- AGENTE: Gli diamo i "Tools" per esplorare la tua app
          agent = {
            tools = {
              "files",   -- Cerca file nel progetto
              "symbols", -- Trova funzioni/classi
              "buffer",  -- Legge i file aperti
            },
          },
          -- KEYMAPS: Configurazione semplificata (Evita il tuo errore Lua)
          keymaps = {
            send = {
              modes = { n = "<CR>", i = "<C-s>" },
            },
            close = {
              modes = { n = "q" },
            },
            -- Questo abilita 'ga' sul codice senza mandare in crash Neovim
            codeblock_action = {
              modes = { n = "ga" },
            },
          },
        },
        inline = {
          adapter = "deepseek",
        },
      },

      -- 2. ADATTATORE DEEPSEEK
      adapters = {
        deepseek = function()
          return require("codecompanion.adapters").extend("deepseek", {
            env = {
              api_key = os.getenv("DEEPSEEK_API_KEY"),
            },
            schema = {
              model = {
                default = "deepseek-chat",
              },
            },
          })
        end,
      },

      -- 3. INTERFACCIA
      display = {
        chat = {
          show_token_count = true,
          window = {
            layout = "vertical",
            width = 0.45,
            border = "rounded",
          },
        },
      },

      -- 4. SLASH COMMANDS (# e /)
      opts = {
        language = "it",
        system_prompt = [[Sei un esperto React Native. Rispondi in italiano. 
        Usa i tool a tua disposizione per analizzare i file se necessario.]],
      },
    })

    -- 5. MAPPATURE GLOBALI (Spazio è il tuo Leader)
    vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat Agentic" })
    vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "AI Inline Edit" })
    
    -- Tasti rapidi per accettare/rifiutare modifiche dell'AI
    vim.keymap.set("n", "<leader>ay", "<cmd>CodeCompanionAccept<cr>", { desc = "Accetta AI" })
    vim.keymap.set("n", "<leader>an", "<cmd>CodeCompanionReject<cr>", { desc = "Rifiuta AI" })
  end,
}

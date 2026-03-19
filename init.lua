-- Imposta il tasto Leader (Spazio) prima di tutto
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Carica le opzioni base (le scriveremo tra un attimo)
require("core.options")

-- Carica il gestore plugin (Lazy.nvim)
require("core.lazy_init")

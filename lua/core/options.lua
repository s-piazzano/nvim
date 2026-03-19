local opt = vim.opt

opt.number = true           -- Numeri di riga
opt.relativenumber = true   -- Numeri relativi (fondamentali per muoversi veloci)
opt.tabstop = 4             -- 1 Tab = 4 spazi
opt.shiftwidth = 4
opt.expandtab = true        -- Trasforma tab in spazi
opt.smartindent = true      -- Indentazione intelligente
opt.mouse = "a"             -- Abilita il mouse (utile all'inizio)
opt.termguicolors = true    -- Colori a 24-bit
opt.ignorecase = true       -- Ignora maiuscole nella ricerca
opt.smartcase = true        -- ...a meno che non usi una maiuscola
opt.clipboard = "unnamedplus" -- Sincronizza con la clipboard del sistema (Mac/Win)

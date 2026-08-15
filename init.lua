-- init.lua
-- Entry point. Each concern lives in its own module under lua/.
--
--  lua/
--  ├── options.lua           editor options
--  ├── keymaps.lua           global keymaps (leader set here too)
--  ├── autocmds.lua          editor autocmds  →  returns augroup
--  ├── statusline.lua        pure-lua statusline
--  ├── theme.lua             omarchy theme integration + SIGUSR1 reload
--  ├── plugins.lua           vim.pack declarations
--  └── plugins/
--      ├── treesitter.lua    nvim-treesitter
--      ├── obsidian.lua      obsidian.nvim
--      ├── nvim-tree.lua     nvim-tree
--      ├── fzf.lua           fzf-lua
--      ├── mini.lua          mini.nvim suite + sessions
--      ├── git.lua           mini.diff + mini.git + neogit
--      ├── terminal.lua      floating terminal
--      └── mason.lua         mason.nvim

-- ── Core setup ───────────────────────────────────────────────────────────────

require("options")
require("keymaps")
local augroup = require("autocmds")
require("statusline").setup()

-- ── Plugins (must come before plugin configs) ────────────────────────────────

require("plugins")

-- ── Theme (applied after plugins so colorscheme plugins are available) ───────

local theme = require("theme")
theme.setup()   -- register SIGUSR1 handler
theme.apply()   -- apply current omarchy theme

-- ── Plugin configs ───────────────────────────────────────────────────────────

require("plugins.treesitter")
require("plugins.obsidian")
require("plugins.nvim-tree")
require("plugins.fzf")
require("plugins.mini")
require("plugins.git")
require("plugins.terminal")
require("plugins.mason")

-- ── LSP (last: needs blink.cmp and efmls-configs loaded first) ───────────────

require("lsp").setup(augroup)

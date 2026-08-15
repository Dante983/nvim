-- Plugin declarations (vim.pack)
-- Run  :lua vim.pack.update()  (or <leader>ps) to install / update.

vim.pack.add({
	-- ── Omarchy theme colorschemes ──────────────────────────────────────
	-- aether.nvim is used for themes that don't ship a dedicated neovim.lua
	{ src = "https://github.com/bjarneo/aether.nvim", branch = "v3" },
	-- Named colorschemes for each stock omarchy theme
	"https://github.com/catppuccin/nvim",
	"https://github.com/neanias/everforest-nvim",
	"https://github.com/kepano/flexoki-neovim",
	"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/bjarneo/hackerman.nvim",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/omacom-io/lumon.nvim",
	"https://github.com/tahayvr/matteblack.nvim",
	"https://github.com/EdenEast/nightfox.nvim",
	"https://github.com/OldJobobo/retro-82.nvim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/ribru17/bamboo.nvim",
	"https://github.com/ficcdaf/ashen.nvim",
	"https://github.com/folke/tokyonight.nvim",

	-- ── UI ───────────────────────────────────────────────────────────────
	"https://github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/ibhagwan/fzf-lua",

	-- ── Editing utilities (mini.nvim suite) ──────────────────────────────
	"https://github.com/echasnovski/mini.nvim",

	-- ── Treesitter ───────────────────────────────────────────────────────
	{
		src    = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build  = ":TSUpdate",
	},

	-- ── LSP & completion ─────────────────────────────────────────────────
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",
	{
		src     = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/L3MON4D3/LuaSnip",

	-- ── Language-specific ────────────────────────────────────────────────
	"https://github.com/mrcjkb/rustaceanvim",
	-- "https://github.com/phpactor/phpactor",  -- phpantom LSP (disabled)

	-- ── Notes ────────────────────────────────────────────────────────────
	"https://github.com/obsidian-nvim/obsidian.nvim",

	-- ── Git ──────────────────────────────────────────────────────────────
	"https://github.com/NeogitOrg/neogit",

	-- ── Navigation ───────────────────────────────────────────────────────
	"https://github.com/christoomey/vim-tmux-navigator",
})

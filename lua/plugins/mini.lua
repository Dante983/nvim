-- mini.nvim suite setup
-- Sessions are CWD-scoped: auto-loaded on startup, auto-saved on exit.

local session_dir = "~/.local/share/nvim/session"

local function cwd_session_name()
	return vim.fn.substitute(vim.fn.getcwd(), "/", "_", "g") .. ".vim"
end

-- ── Mini modules ─────────────────────────────────────────────────────────────

require("mini.ai").setup({})
require("mini.bufremove").setup({})
require("mini.clue").setup({
	triggers = {
		{ mode = { "n", "x" }, keys = "<Leader>" },
		{ mode = "n",          keys = "[" },
		{ mode = "n",          keys = "]" },
		{ mode = "i",          keys = "<C-x>" },
		{ mode = { "n", "x" }, keys = "g" },
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },
		{ mode = "n",          keys = "<C-w>" },
		{ mode = { "n", "x" }, keys = "z" },
	},
	window = {
		config     = {},
		delay      = 500,
		scroll_down = "<C-d>",
		scroll_up   = "<C-u>",
	},
})
require("mini.comment").setup({})
require("mini.cursorword").setup({})
require("mini.icons").setup({})
-- require("mini.indentscope").setup({})  -- disabled
require("mini.move").setup({})
require("mini.notify").setup({})
require("mini.pairs").setup({})
require("mini.sessions").setup({
	autoread  = false,
	autowrite = false,
	directory = session_dir,
	file      = "",
	verbose   = { read = false, write = true, delete = false },
})
require("mini.surround").setup({})
require("mini.trailspace").setup({})

-- ── Session autocmds ─────────────────────────────────────────────────────────

-- Auto-load CWD session on startup (only when nvim opened with no arguments)
vim.api.nvim_create_autocmd("VimEnter", {
	nested   = true,
	once     = true,
	callback = function()
		if vim.fn.argc() == 0 then
			pcall(require("mini.sessions").read, cwd_session_name())
		end
	end,
})

-- Auto-save CWD session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		require("mini.sessions").write(cwd_session_name(), { force = true })
	end,
})

-- ── Session keymaps ──────────────────────────────────────────────────────────

local map = vim.keymap.set

map("n", "<leader>Ls", function()
	require("mini.sessions").write(cwd_session_name(), { force = true })
end, { desc = "Save session" })

map("n", "<leader>Ll", function()
	require("mini.sessions").read(cwd_session_name())
end, { desc = "Load session" })

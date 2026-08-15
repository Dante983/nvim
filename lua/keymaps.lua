-- Keymaps
-- LSP keymaps live in lsp.lua (set on LspAttach).
-- Plugin-specific keymaps live alongside their setup in lua/plugins/.

vim.g.mapleader      = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Movement: wrap-aware j/k
map("n", "j", function() return vim.v.count == 0 and "gj" or "j" end,
	{ expr = true, silent = true, desc = "Down (wrap-aware)" })
map("n", "k", function() return vim.v.count == 0 and "gk" or "k" end,
	{ expr = true, silent = true, desc = "Up (wrap-aware)" })

-- Search
map("n", "<leader>c", ":nohlsearch<CR>",  { desc = "Clear search highlights" })
map("n", "n",         "nzzzv",            { desc = "Next match (centered)" })
map("n", "N",         "Nzzzv",            { desc = "Prev match (centered)" })
map("n", "<C-d>",     "<C-d>zz",          { desc = "Half-page down (centered)" })
map("n", "<C-u>",     "<C-u>zz",          { desc = "Half-page up (centered)" })

-- Editing
map("x", "<leader>p",      '"_dP',         { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>x", '"_d',      { desc = "Delete without yanking" })
map("n", "J",              "mzJ`z",        { desc = "Join lines (keep cursor)" })
map("v", "<",              "<gv",          { desc = "Indent left and reselect" })
map("v", ">",              ">gv",          { desc = "Indent right and reselect" })
map("n", "<A-j>",          ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>",          ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>",          ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>",          ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Buffers
map("n", "<leader>bn", ":bnext<CR>",     { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Prev buffer" })

-- Window navigation (works with tmux via vim-tmux-navigator)
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>",  { desc = "Window/pane left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>",  { desc = "Window/pane down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>",    { desc = "Window/pane up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Window/pane right" })

-- Window splits and resize
map("n", "<leader>sv", ":vsplit<CR>",            { desc = "Split vertically" })
map("n", "<leader>sh", ":split<CR>",             { desc = "Split horizontally" })
map("n", "<C-Up>",    ":resize +2<CR>",          { desc = "Increase height" })
map("n", "<C-Down>",  ":resize -2<CR>",          { desc = "Decrease height" })
map("n", "<C-Left>",  ":vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- Misc
map("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

map("n", "<leader>Td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

map("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>", { desc = "Update plugins" })

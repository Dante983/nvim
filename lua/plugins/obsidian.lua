-- obsidian.nvim setup

local function notes_path()
	local release = vim.fn.system("cat /etc/os-release")
	return vim.fn.expand(release:match("Arch") and "~/notes/personal" or "~/notes/work")
end

require("obsidian").setup({
	legacy_commands = false,
	workspaces      = { { name = "Notes", path = notes_path() } },
	picker          = { name = "fzf-lua" },
})

local map = vim.keymap.set

map("n", "<leader>nn", function()
	vim.cmd("Obsidian workspace")
	vim.defer_fn(function() vim.cmd("Obsidian new") end, 500)
end, { desc = "New note" })
map("n", "<leader>nf", "<cmd>Obsidian quick_switch<cr>", { desc = "Find note" })
map("n", "<leader>ns", "<cmd>Obsidian search<cr>",       { desc = "Search notes" })
map("n", "<leader>nt", "<cmd>Obsidian today<cr>",        { desc = "Today's daily note" })
map("n", "<leader>nw", "<cmd>Obsidian workspace<cr>",    { desc = "Switch workspace" })

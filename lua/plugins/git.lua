-- Git tooling: mini.diff, mini.git, neogit

local map = vim.keymap.set

-- ── mini.diff ────────────────────────────────────────────────────────────────

require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "▎", change = "▎", delete = "▎" },
	},
})

local MiniDiff = require("mini.diff")

map("n", "<leader>gn", function() MiniDiff.goto_hunk("next") end, { desc = "Next hunk" })
map("n", "<leader>gp", function() MiniDiff.goto_hunk("prev") end, { desc = "Prev hunk" })
map("n", "<leader>hs", MiniDiff.operator,                         { desc = "Stage hunk" })
map("n", "<leader>hp", function() MiniDiff.toggle_overlay() end,  { desc = "Diff overlay" })

-- ── mini.git ─────────────────────────────────────────────────────────────────

require("mini.git").setup({})

map("n", "<leader>hb", function()
	require("mini.git").show_at_cursor()
end, { desc = "Git blame / show" })

-- ── neogit ───────────────────────────────────────────────────────────────────

require("neogit").setup()

map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit" })

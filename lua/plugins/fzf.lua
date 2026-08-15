-- fzf-lua setup + keymaps

require("fzf-lua").setup({
	oldfiles = {
		prompt                  = "History❯ ",
		cwd_only                = true,
		stat_file               = true,
		include_current_session = false,
		ignore_current_buffer   = false,
	},
})

local fzf = require("fzf-lua")
local map = vim.keymap.set

map("n", "<leader>ff",    fzf.files,                                      { desc = "Find files" })
map("n", "<leader>fF",    function()
	fzf.files({ hidden = true, respect_gitignore = false })
end,                                                                        { desc = "Find files (all)" })
map("n", "<leader>fw",    fzf.live_grep,                                   { desc = "Live grep" })
map("n", "<leader>fb",    fzf.buffers,                                     { desc = "Buffers" })
map("n", "<leader>f<CR>", fzf.live_grep_resume,                           { desc = "Resume grep" })
map("n", "<leader>o",     fzf.oldfiles,                                    { desc = "Recent files" })

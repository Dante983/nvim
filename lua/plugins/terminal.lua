-- Floating terminal
-- Toggle with <leader>t. Persists across open/close within the session.
-- <Esc> exits terminal mode; <C-q> closes the window.

local state = { buf = nil, win = nil, open = false }

local function toggle()
	-- Close if already open
	if state.open and state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_close(state.win, false)
		state.open = false
		return
	end

	-- Create buffer on first open
	if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
		state.buf = vim.api.nvim_create_buf(false, true)
		vim.bo[state.buf].bufhidden = "hide"
	end

	-- Centre the window at 80% of editor dimensions
	local w   = math.floor(vim.o.columns * 0.8)
	local h   = math.floor(vim.o.lines   * 0.8)
	local row = math.floor((vim.o.lines   - h) / 2)
	local col = math.floor((vim.o.columns - w) / 2)

	state.win = vim.api.nvim_open_win(state.buf, true, {
		relative = "editor",
		width    = w,
		height   = h,
		row      = row,
		col      = col,
		style    = "minimal",
		border   = "single",
	})

	vim.wo[state.win].winblend    = 0
	vim.wo[state.win].winhighlight =
		"Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder"
	vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none" })

	if vim.bo[state.buf].buftype ~= "terminal" then
		vim.fn.termopen(os.getenv("SHELL"))
	end

	state.open = true
	vim.cmd("startinsert")

	-- Close window when the terminal buffer loses focus
	local ag = vim.api.nvim_create_augroup("FloatingTermLeave_" .. state.win, { clear = true })
	vim.api.nvim_create_autocmd("BufLeave", {
		group  = ag,
		buffer = state.buf,
		once   = true,
		callback = function()
			if state.open and state.win and vim.api.nvim_win_is_valid(state.win) then
				vim.api.nvim_win_close(state.win, false)
				state.open = false
			end
		end,
	})
end

local function close()
	if state.open and state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_close(state.win, false)
		state.open = false
	end
end

local map = vim.keymap.set

map("n", "<leader>t", toggle, { noremap = true, silent = true, desc = "Toggle floating terminal" })
map("t", "<Esc>",     "<C-\\><C-n>", { noremap = true, silent = true, desc = "Terminal normal mode" })
map("t", "<C-q>",     close,  { noremap = true, silent = true, desc = "Close floating terminal" })

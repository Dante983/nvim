-- Autocommands

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Format on save via efm-langserver (only real file buffers, only when efm is attached)
vim.api.nvim_create_autocmd("BufWritePre", {
	group   = augroup,
	pattern = {
		"*.lua", "*.py", "*.go",
		"*.js", "*.jsx", "*.ts", "*.tsx",
		"*.json", "*.css", "*.scss", "*.html",
		"*.sh", "*.bash", "*.zsh",
		"*.c", "*.cpp", "*.h", "*.hpp",
	},
	callback = function(args)
		local buf = args.buf
		if vim.bo[buf].buftype ~= "" then return end
		if not vim.bo[buf].modifiable then return end
		if vim.api.nvim_buf_get_name(buf) == "" then return end

		local has_efm = vim.iter(vim.lsp.get_clients({ bufnr = buf }))
			:any(function(c) return c.name == "efm" end)
		if not has_efm then return end

		pcall(vim.lsp.buf.format, {
			bufnr      = buf,
			timeout_ms = 2000,
			filter     = function(c) return c.name == "efm" end,
		})
	end,
})

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
	group    = augroup,
	callback = function() vim.hl.on_yank() end,
})

-- Restore last cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
	group    = augroup,
	desc     = "Restore last cursor position",
	callback = function()
		if vim.o.diff then return end
		local pos = vim.api.nvim_buf_get_mark(0, '"')
		local last_line = vim.api.nvim_buf_line_count(0)
		if pos[1] >= 1 and pos[1] <= last_line then
			pcall(vim.api.nvim_win_set_cursor, 0, pos)
		end
	end,
})

-- Wrap + spellcheck in prose filetypes
vim.api.nvim_create_autocmd("FileType", {
	group    = augroup,
	pattern  = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap      = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell     = true
	end,
})

-- Terminal: hide line numbers and sign column
vim.api.nvim_create_autocmd("TermOpen", {
	group    = augroup,
	callback = function()
		vim.opt_local.number         = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn     = "no"
	end,
})

-- Terminal: close buffer automatically when process exits cleanly
vim.api.nvim_create_autocmd("TermClose", {
	group    = augroup,
	callback = function()
		if vim.v.event.status == 0 then
			vim.api.nvim_buf_delete(0, {})
		end
	end,
})

-- Expose augroup for other modules that need to attach autocmds to it
return augroup

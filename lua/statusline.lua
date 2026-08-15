-- Statusline
-- Pure-lua statusline using Nerd Font icons. No plugins required.

local M = {}

-- Git branch with 5-second cache to avoid shelling out on every redraw
local _branch_cache = ""
local _branch_ts    = 0

local function git_branch()
	local now = vim.uv.now()
	if now - _branch_ts > 5000 then
		_branch_cache = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
		_branch_ts    = now
	end
	if _branch_cache ~= "" then
		return " \u{e725} " .. _branch_cache .. " " -- 
	end
	return ""
end

local function file_type()
	local ft = vim.bo.filetype
	local icons = {
		lua          = "\u{e620} ",   -- 
		python       = "\u{e73c} ",   -- 
		javascript   = "\u{e74e} ",   -- 
		typescript   = "\u{e628} ",   -- 
		javascriptreact = "\u{e7ba} ",
		typescriptreact = "\u{e7ba} ",
		html         = "\u{e736} ",   -- 
		css          = "\u{e749} ",   -- 
		scss         = "\u{e749} ",
		json         = "\u{e60b} ",   -- 
		markdown     = "\u{e73e} ",   -- 
		vim          = "\u{e62b} ",   -- 
		sh           = "\u{f489} ",   -- 
		bash         = "\u{f489} ",
		zsh          = "\u{f489} ",
		rust         = "\u{e7a8} ",   -- 
		go           = "\u{e724} ",   -- 
		c            = "\u{e61e} ",   -- 
		cpp          = "\u{e61d} ",   -- 
		java         = "\u{e738} ",   -- 
		php          = "\u{e73d} ",   -- 
		ruby         = "\u{e739} ",   -- 
		swift        = "\u{e755} ",   -- 
		kotlin       = "\u{e634} ",
		dart         = "\u{e798} ",
		elixir       = "\u{e62d} ",
		haskell      = "\u{e777} ",
		sql          = "\u{e706} ",
		yaml         = "\u{f481} ",
		toml         = "\u{e615} ",
		xml          = "\u{f05c} ",
		dockerfile   = "\u{f308} ",   -- 
		gitcommit    = "\u{f418} ",   -- 
		gitconfig    = "\u{f1d3} ",   -- 
		vue          = "\u{fd42} ",   -- 
		svelte       = "\u{e697} ",
		astro        = "\u{e628} ",
	}
	if ft == "" then return " \u{f15b} " end
	return (icons[ft] or " \u{f15b} ") .. ft
end

local function file_size()
	local size = vim.fn.getfsize(vim.fn.expand("%"))
	if size < 0 then return "" end
	local s
	if size < 1024 then
		s = size .. "B"
	elseif size < 1024 * 1024 then
		s = string.format("%.1fK", size / 1024)
	else
		s = string.format("%.1fM", size / 1024 / 1024)
	end
	return " \u{f016} " .. s .. " " -- 
end

local function mode_indicator()
	local labels = {
		n        = " \u{f121}  NORMAL",   -- 
		i        = " \u{f11c}  INSERT",   -- 
		v        = " \u{f0168} VISUAL",   -- 󰅨
		V        = " \u{f0168} V-LINE",
		["\22"]  = " \u{f0168} V-BLOCK",
		c        = " \u{f120} COMMAND",   -- 
		s        = " \u{f0c5} SELECT",    -- 
		S        = " \u{f0c5} S-LINE",
		["\19"]  = " \u{f0c5} S-BLOCK",
		R        = " \u{f044} REPLACE",   -- 
		r        = " \u{f044} REPLACE",
		["!"]    = " \u{f489} SHELL",
		t        = " \u{f120} TERMINAL",
	}
	return labels[vim.fn.mode()] or (" \u{f059} " .. vim.fn.mode())
end

-- Expose to vimscript %{v:lua.*} expressions
_G.sl_mode      = mode_indicator
_G.sl_branch    = git_branch
_G.sl_filetype  = file_type
_G.sl_filesize  = file_size

local SEP = "\u{e0b1}" -- nf-pl-left_hard_divider 

local ACTIVE = table.concat({
	"  ",
	"%#StatusLineBold#%{v:lua.sl_mode()}%#StatusLine#",
	" " .. SEP .. " %f %h%m%r",
	"%{v:lua.sl_branch()}",
	SEP .. " %{v:lua.sl_filetype()}",
	" " .. SEP .. " %{v:lua.sl_filesize()}",
	"%=",
	" \u{f017} %l:%c  %P ", -- 
})

local INACTIVE = "  %f %h%m%r " .. SEP .. " %{v:lua.sl_filetype()} %=  %l:%c   %P "

function M.setup()
	vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

	local augroup = vim.api.nvim_create_augroup("Statusline", { clear = true })

	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
		group    = augroup,
		callback = function() vim.opt_local.statusline = ACTIVE end,
	})
	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
		group    = augroup,
		callback = function() vim.opt_local.statusline = INACTIVE end,
	})
end

return M

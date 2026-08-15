-- Omarchy theme integration
-- Reads the active theme from ~/.local/state/omarchy/current/theme/ and
-- applies the matching colorscheme. Called at startup and on SIGUSR1
-- (sent by the omarchy theme-set hook).

local M = {}

local THEME_DIR = vim.fn.expand("~/.local/state/omarchy/current/theme")

-- Parse a minimal subset of TOML: key = "value" and key = bare_value
local function parse_toml(path)
	local t = {}
	local f = io.open(path, "r")
	if not f then return t end
	for line in f:lines() do
		local k, v = line:match('^%s*([%w_]+)%s*=%s*"([^"]+)"')
		if not k then k, v = line:match("^%s*([%w_]+)%s*=%s*([%w#%-]+)") end
		if k then t[k] = v end
	end
	f:close()
	return t
end

-- Read plugin repo + colorscheme from the theme's neovim.lua (LazyVim format)
local function read_neovim_lua()
	local path = THEME_DIR .. "/neovim.lua"
	local f = io.open(path, "r")
	if not f then return nil, nil end
	local content = f:read("*a")
	f:close()
	local repo = content:match('"([%w%-%.]+/[%w%-%.]+)"')
	if repo == "LazyVim/LazyVim" then repo = nil end
	local cs = content:match('colorscheme%s*=%s*"([^"]+)"')
	return repo, cs
end

-- Re-apply transparency highlights after any colorscheme change
local function apply_transparency()
	local groups = {
		"Normal", "NormalNC", "EndOfBuffer", "NormalFloat", "FloatBorder",
		"SignColumn", "StatusLine", "StatusLineNC", "TabLine", "TabLineFill",
		"TabLineSel", "ColorColumn", "NvimTreeNormal", "NvimTreeNormalNC",
		"NvimTreeSignColumn", "NvimTreeEndOfBuffer", "FloatingTermNormal",
		"FloatingTermBorder",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
	vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#2a2a2a", bg = "none" })
end

-- Configure and apply aether.nvim using colors from colors.toml
local function apply_aether()
	local c = parse_toml(THEME_DIR .. "/colors.toml")
	if next(c) then
		local ok, aether = pcall(require, "aether")
		if ok then
			aether.setup({
				colors = {
					bg                   = c.background,
					dark_bg              = c.dark_background,
					darker_bg            = c.darker_background,
					lighter_bg           = c.lighter_background,
					fg                   = c.foreground,
					dark_fg              = c.dark_foreground,
					light_fg             = c.light_foreground,
					bright_fg            = c.bright_foreground,
					muted                = c.muted,
					red                  = c.red,
					yellow               = c.yellow,
					orange               = c.orange,
					green                = c.green,
					cyan                 = c.cyan,
					blue                 = c.blue,
					magenta              = c.magenta,
					brown                = c.brown,
					bright_red           = c.bright_red,
					bright_yellow        = c.bright_yellow,
					bright_green         = c.bright_green,
					bright_cyan          = c.bright_cyan,
					bright_blue          = c.bright_blue,
					bright_magenta       = c.bright_magenta,
					accent               = c.accent,
					cursor               = c.bright_foreground,
					foreground           = c.foreground,
					background           = c.background,
					selection            = c.selection,
					selection_foreground = c.selection_foreground,
					selection_background = c.selection_background,
				},
			})
		end
	end
	pcall(vim.cmd.colorscheme, "aether")
end

-- Apply the current omarchy theme
function M.apply()
	local _, cs = read_neovim_lua()
	if cs then
		pcall(vim.cmd.colorscheme, cs)
	else
		apply_aether()
	end
	vim.schedule(apply_transparency)
end

-- Listen for SIGUSR1 (sent by omarchy theme-set hook)
function M.setup()
	vim.uv.new_signal():start("sigusr1", vim.schedule_wrap(M.apply))
end

return M

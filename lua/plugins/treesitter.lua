-- nvim-treesitter setup
-- Installs missing parsers on startup; activates highlighting per FileType.

local parsers = {
	"bash", "c", "cpp", "css", "go", "html",
	"javascript", "json", "lua", "markdown",
	"php", "python", "rust", "svelte",
	"typescript", "vim", "vimdoc", "vue",
}

local ts      = require("nvim-treesitter")
local ts_cfg  = require("nvim-treesitter.config")

ts.setup({})

-- Install only parsers not yet present
local installed = ts_cfg.get_installed()
local missing   = vim.tbl_filter(
	function(p) return not vim.tbl_contains(installed, p) end,
	parsers
)
if #missing > 0 then
	ts.install(missing)
end

-- Enable highlighting for installed languages on FileType
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TreesitterHL", { clear = true }),
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if lang and vim.list_contains(ts_cfg.get_installed(), lang) then
			vim.treesitter.start(args.buf)
		end
	end,
})

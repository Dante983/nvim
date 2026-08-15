-- LSP, diagnostics, completion (blink.cmp), and formatting (efm)

local M = {}

-- ── Diagnostic display ───────────────────────────────────────────────────────

local signs = {
	Error = "\u{f057} ", -- 
	Warn  = "\u{f071} ", -- 
	Hint  = "\u{ea61}",  -- 
	Info  = "\u{f05a}",  -- 
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN]  = signs.Warn,
			[vim.diagnostic.severity.INFO]  = signs.Info,
			[vim.diagnostic.severity.HINT]  = signs.Hint,
		},
	},
	underline        = true,
	update_in_insert = false,
	severity_sort    = true,
	float = {
		border    = "single",
		source    = true,
		header    = "",
		prefix    = "",
		focusable = false,
		style     = "minimal",
	},
})

-- Force single border on all LSP floating windows
do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts        = opts or {}
		opts.border = opts.border or "single"
		return orig(contents, syntax, opts, ...)
	end
end

-- ── On-attach keymaps ────────────────────────────────────────────────────────

local function on_attach(ev)
	if not vim.lsp.get_client_by_id(ev.data.client_id) then return end

	local buf  = ev.buf
	local opts = { noremap = true, silent = true, buffer = buf }
	local map  = function(lhs, rhs, desc)
		vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
	end
	local fzf  = require("fzf-lua")

	-- Navigation
	map("<leader>gd", fzf.lsp_definitions,                 "Go to definition")
	map("<leader>gS", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end,                                                    "Go to definition (split)")
	map("gr",         fzf.lsp_references,                  "Find references")
	map("<leader>fi", fzf.lsp_implementations,             "Find implementations")
	map("<leader>ft", fzf.lsp_typedefs,                    "Find type definitions")
	map("<leader>fs", fzf.lsp_document_symbols,            "Document symbols")
	map("<leader>fW", fzf.lsp_workspace_symbols,           "Workspace symbols")

	-- Actions
	map("<leader>ca", vim.lsp.buf.code_action,             "Code actions")
	map("<leader>rn", vim.lsp.buf.rename,                  "Rename symbol")
	map("K",          vim.lsp.buf.hover,                   "Hover docs")

	-- Diagnostics
	map("<leader>D",  function() vim.diagnostic.open_float({ scope = "line" })   end, "Line diagnostics")
	map("<leader>d",  function() vim.diagnostic.open_float({ scope = "cursor" }) end, "Cursor diagnostics")
	map("<leader>nd", function() vim.diagnostic.jump({ count = 1 })              end, "Next diagnostic")
	map("<leader>pd", function() vim.diagnostic.jump({ count = -1 })             end, "Prev diagnostic")
	map("<leader>q",  function() vim.diagnostic.setloclist({ open = true })      end, "Diagnostic list")
	map("<leader>dl", vim.diagnostic.open_float,                                 "Show line diagnostics")
end

-- ── Server configurations ────────────────────────────────────────────────────

local function read_intelephense_key()
	local path = os.getenv("HOME") .. "/intelephense/license.txt"
	local f    = assert(io.open(path, "rb"))
	local key  = f:read("*a")
	f:close()
	return (key:gsub("%s+", ""))
end

local function configure_servers()
	vim.lsp.config["*"] = {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
	}

	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				telemetry   = { enable = false },
			},
		},
	})

	vim.lsp.config("intelephense", {
		init_options = { licenceKey = read_intelephense_key() },
	})

	-- Servers with no extra config needed
	for _, name in ipairs({ "pyright", "bashls", "ts_ls", "gopls", "clangd" }) do
		vim.lsp.config(name, {})
	end

	vim.g.rustaceanvim = {
		server = { capabilities = require("blink.cmp").get_lsp_capabilities() },
	}
end

-- ── efm (linting + formatting) ───────────────────────────────────────────────

local function configure_efm()
	local clang_format = require("efmls-configs.formatters.clang_format")
	local cpplint      = require("efmls-configs.linters.cpplint")
	local gofumpt      = require("efmls-configs.formatters.gofumpt")
	local go_revive    = require("efmls-configs.linters.go_revive")
	local prettier_d   = require("efmls-configs.formatters.prettier_d")
	local eslint_d     = require("efmls-configs.linters.eslint_d")
	local fixjson      = require("efmls-configs.formatters.fixjson")
	local luacheck     = require("efmls-configs.linters.luacheck")
	local stylua       = require("efmls-configs.formatters.stylua")
	local flake8       = require("efmls-configs.linters.flake8")
	local black        = require("efmls-configs.formatters.black")
	local shellcheck   = require("efmls-configs.linters.shellcheck")
	local shfmt        = require("efmls-configs.formatters.shfmt")

	vim.lsp.config("efm", {
		filetypes = {
			"c", "cpp", "css", "go", "html",
			"javascript", "javascriptreact",
			"json", "jsonc", "lua", "markdown",
			"python", "sh",
			"typescript", "typescriptreact",
			"vue", "svelte",
		},
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				c               = { clang_format, cpplint },
				cpp             = { clang_format, cpplint },
				go              = { gofumpt,      go_revive },
				css             = { prettier_d },
				html            = { prettier_d },
				javascript      = { eslint_d,     prettier_d },
				javascriptreact = { eslint_d,     prettier_d },
				json            = { eslint_d,     fixjson },
				jsonc           = { eslint_d,     fixjson },
				lua             = { luacheck,     stylua },
				markdown        = { prettier_d },
				python          = { flake8,       black },
				sh              = { shellcheck,   shfmt },
				typescript      = { eslint_d,     prettier_d },
				typescriptreact = { eslint_d,     prettier_d },
				vue             = { eslint_d,     prettier_d },
				svelte          = { eslint_d,     prettier_d },
			},
		},
	})
end

-- ── Completion (blink.cmp) ───────────────────────────────────────────────────

local function configure_completion()
	require("blink.cmp").setup({
		keymap = {
			preset      = "none",
			["<C-Space>"] = { "show", "hide" },
			["<CR>"]      = { "accept", "fallback" },
			["<C-j>"]     = { "select_next", "fallback" },
			["<C-k>"]     = { "select_prev", "fallback" },
			["<Tab>"]     = { "snippet_forward", "fallback" },
			["<S-Tab>"]   = { "snippet_backward", "fallback" },
		},
		appearance = { nerd_font_variant = "mono" },
		completion = {
			menu = {
				auto_show = function()
					return vim.bo.filetype ~= "markdown"
				end,
			},
		},
		sources  = { default = { "lsp", "path", "buffer", "snippets" } },
		snippets = {
			expand = function(snippet) require("luasnip").lsp_expand(snippet) end,
		},
		fuzzy = {
			implementation      = "prefer_rust",
			prebuilt_binaries   = { download = true },
		},
	})
end

-- ── Public setup ─────────────────────────────────────────────────────────────

function M.setup(augroup)
	configure_completion()
	configure_servers()
	configure_efm()

	vim.lsp.enable({
		"lua_ls", "pyright", "bashls", "ts_ls",
		"gopls", "clangd", "efm", "intelephense",
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		group    = augroup,
		callback = on_attach,
	})
end

return M

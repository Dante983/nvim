-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

	-- == Examples of Adding Plugins ==

	"andweeb/presence.nvim",
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},

	-- == Examples of Overriding Plugins ==

	-- customize alpha options
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				" █████  ███████ ████████ ██████   ██████",
				"██   ██ ██         ██    ██   ██ ██    ██",
				"███████ ███████    ██    ██████  ██    ██",
				"██   ██      ██    ██    ██   ██ ██    ██",
				"██   ██ ███████    ██    ██   ██  ██████",
				" ",
				"    ███    ██ ██    ██ ██ ███    ███",
				"    ████   ██ ██    ██ ██ ████  ████",
				"    ██ ██  ██ ██    ██ ██ ██ ████ ██",
				"    ██  ██ ██  ██  ██  ██ ██  ██  ██",
				"    ██   ████   ████   ██ ██      ██",
			}
			return opts
		end,
	},

	-- You can disable default plugins as follows:
	{ "max397574/better-escape.nvim", enabled = false },

	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	{
		"L3MON4D3/LuaSnip",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.luasnip")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom luasnip configuration such as filetype extend or custom snippets
			local luasnip = require("luasnip")
			luasnip.filetype_extend("javascript", { "javascriptreact" })
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom autopairs configuration such as custom rules
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			npairs.add_rules(
				{
					Rule("$", "$", { "tex", "latex" })
						-- don't add a pair if the next character is %
						:with_pair(cond.not_after_regex("%%"))
						-- don't add a pair if  the previous character is xxx
						:with_pair(
							cond.not_before_regex("xxx", 3)
						)
						-- don't move right when repeat character
						:with_move(cond.none())
						-- don't delete if the next character is xx
						:with_del(cond.not_after_regex("xx"))
						-- disable adding a newline when you press <cr>
						:with_cr(cond.none()),
				},
				-- disable for .vim files, but it work for another filetypes
				Rule("a", "a", "-vim")
			)
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			window = {
				layout = "float",
				relative = "cursor",
				width = 1,
				height = 0.4,
				row = 1,
			},

			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"tzachar/local-highlight.nvim",
		event = "BufRead",
		config = function()
			require("local-highlight").setup({
				file_types = { "php", "js" }, -- If this is given only attach to this
				-- OR attach to every filetype except:
				disable_file_types = { "tex" },
				hlgroup = "Search",
				cw_hlgroup = nil,
				-- Whether to display highlights in INSERT mode or not
				insert_mode = false,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"ThePrimeagen/vim-be-good",
	},
	-- {
	--   -- colorsheme
	--   "rebelot/kanagawa.nvim",
	-- },
	-- {
	--   -- colorscheme #2
	--   "askfiy/killer-queen",
	--   priority = 100,
	-- },
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({})
		end,
	},
	{
		"folke/noice.nvim",
		opts = {
			lsp = {
				signature = {
					enabled = false,
				},
			},
		},
		views = {
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
	},
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{ "folke/neodev.nvim", opts = {} },
	-- {
	--   "scottmckendry/cyberdream.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     require("cyberdream").setup {
	--       -- Recommended - see "Configuring" below for more config options
	--       transparent = true,
	--       italic_comments = true,
	--       hide_fillchars = true,
	--       borderless_telescope = true,
	--       terminal_colors = true,
	--     }
	--     vim.cmd "colorscheme cyberdream" -- set the colorscheme
	--   end,
	-- },
	{
		"echasnovski/mini.animate",
		recommended = true,
		event = "VeryLazy",
		opts = function()
			-- don't use animate when scrolling with the mouse
			local mouse_scrolled = false
			for _, scroll in ipairs({ "Up", "Down" }) do
				local key = "<ScrollWheel" .. scroll .. ">"
				vim.keymap.set({ "", "i" }, key, function()
					mouse_scrolled = true
					return key
				end, { expr = true })
			end

			local animate = require("mini.animate")
			return {
				resize = {
					timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
					subscroll = animate.gen_subscroll.equal({
						predicate = function(total_scroll)
							if mouse_scrolled then
								mouse_scrolled = false
								return false
							end
							return total_scroll > 1
						end,
					}),
				},
			}
		end,
	},
	{
		"NStefan002/15puzzle.nvim",
		cmd = "Play15puzzle",
		config = true,
	},
	{
		"NStefan002/2048.nvim",
		cmd = "Play2048",
		config = true,
	},
	{
		"NStefan002/speedtyper.nvim",
		cmd = "Speedtyper",
		opts = {
			-- your config
		},
	},
}

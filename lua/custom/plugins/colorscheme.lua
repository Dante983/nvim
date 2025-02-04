return {
  -- {
  --   'neanias/everforest-nvim',
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     require('everforest').setup {
  --       -- Your config here
  --       -- vim.cmd.colorscheme 'everforest',
  --       ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
  --       ---Default is "medium".
  --       background = 'medium',
  --       ---How much of the background should be transparent. 2 will have more UI
  --       ---components be transparent (e.g. status line background)
  --       transparent_background_level = 2,
  --       ---Whether italics should be used for keywords and more.
  --       italics = false,
  --       ---Disable italic fonts for comments. Comments are in italics by default, set
  --       ---this to `true` to make them _not_ italic!
  --       disable_italic_comments = false,
  --       ---By default, the colour of the sign column background is the same as the as normal text
  --       ---background, but you can use a grey background by setting this to `"grey"`.
  --       sign_column_background = 'none',
  --       ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
  --       ---`"low"` (default).
  --       ui_contrast = 'low',
  --       ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
  --       ---
  --       ---When this option is used in conjunction with show_eob set to `false`, the
  --       ---end of the buffer will only be hidden inside the active window. Inside
  --       ---inactive windows, the end of buffer filler characters will be visible in
  --       ---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
  --       dim_inactive_windows = true,
  --       ---Some plugins support highlighting error/warning/info/hint texts, by
  --       ---default these texts are only underlined, but you can use this option to
  --       ---also highlight the background of them.
  --       diagnostic_text_highlight = false,
  --       ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
  --       diagnostic_virtual_text = 'coloured',
  --       ---Some plugins support highlighting error/warning/info/hint lines, but this
  --       ---feature is disabled by default in this colour scheme.
  --       diagnostic_line_highlight = false,
  --       ---By default, this color scheme won't colour the foreground of |spell|, instead
  --       ---colored under curls will be used. If you also want to colour the foreground,
  --       ---set this option to `true`.
  --       spell_foreground = false,
  --       ---Whether to show the EndOfBuffer highlight.
  --       show_eob = true,
  --       ---Style used to make floating windows stand out from other windows. `"bright"`
  --       ---makes the background of these windows lighter than |hl-Normal|, whereas
  --       ---`"dim"` makes it darker.
  --       ---
  --       ---Floating windows include for instance diagnostic pop-ups, scrollable
  --       ---documentation windows from completion engines, overlay windows from
  --       ---installers, etc.
  --       ---
  --       ---NB: This is only significant for dark backgrounds as the light palettes
  --       ---have the same colour for both values in the switch.
  --       float_style = 'bright',
  --       ---Inlay hints are special markers that are displayed inline with the code to
  --       ---provide you with additional information. You can use this option to customize
  --       ---the background color of inlay hints.
  --       ---
  --       ---Options are `"none"` or `"dimmed"`.
  --       inlay_hints_background = 'none',
  --       ---You can override specific highlights to use other groups or a hex colour.
  --       ---This function will be called with the highlights and colour palette tables.
  --       ---@param highlight_groups Highlights
  --       ---@param palette Palette
  --       on_highlights = function(highlight_groups, palette) end,
  --       ---You can override colours in the palette to use different hex colours.
  --       ---This function will be called once the base and background colours have
  --       ---been mixed on the palette.
  --       ---@param palette Palette
  --       colours_override = function(palette) end,
  --     }
  --   end,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup {
  --       flavour = 'auto', -- latte, frappe, macchiato, mocha
  --       background = { -- :h background
  --         light = 'latte',
  --         dark = 'mocha',
  --       },
  --       transparent_background = true, -- disables setting the background color.
  --       show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  --       term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  --       dim_inactive = {
  --         enabled = false, -- dims the background color of inactive window
  --         shade = 'dark',
  --         percentage = 0.15, -- percentage of the shade to apply to the inactive window
  --       },
  --       no_italic = false, -- Force no italic
  --       no_bold = false, -- Force no bold
  --       no_underline = false, -- Force no underline
  --       styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
  --         comments = { 'italic' }, -- Change the style of comments
  --         conditionals = { 'italic' },
  --         loops = {},
  --         functions = {},
  --         keywords = {},
  --         strings = {},
  --         variables = {},
  --         numbers = {},
  --         booleans = {},
  --         properties = {},
  --         types = {},
  --         operators = {},
  --         -- miscs = {}, -- Uncomment to turn off hard-coded styles
  --       },
  --       color_overrides = {},
  --       custom_highlights = {},
  --       default_integrations = true,
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         nvimtree = true,
  --         treesitter = true,
  --         notify = false,
  --         mini = {
  --           enabled = true,
  --           indentscope_color = '',
  --         },
  --         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  --       },
  --     }
  --     --     -- Toggle background transparency
  --     -- local bg_transparent = true
  --     -- --
  --     -- local toggle_transparency = function()
  --     --   bg_transparent = not bg_transparent
  --     --   -- vim.g.transparent_background = bg_transparent
  --     --   require('catppuccin').setup {
  --     --     transparent_background = bg_transparent,
  --     --   }
  --     --   vim.cmd [[colorscheme catppuccin]]
  --     -- end
  --     --
  --     -- vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  --
  --     -- setup must be called before loading
  --     -- vim.cmd.colorscheme 'catppuccin'
  --   end,
  -- },
  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('bamboo').setup {
  --       -- optional configuration here
  --     }
  --     require('bamboo').load()
  --     -- local bg_transparent = false
  --     -- --
  --     -- local toggle_transparency = function()
  --     --   bg_transparent = not bg_transparent
  --     --   -- vim.g.transparent_background = bg_transparent
  --     --   require('bamboo').setup {
  --     --     transparent = bg_transparent,
  --     --   }
  --     --   vim.cmd [[colorscheme bamboo]]
  --     -- end
  --     --
  --     -- vim.keymap.set('n', '<leader>bg', toggle_transparency, { desc = 'Transparent background', noremap = true, silent = true })
  --     -- vim.cmd.colorscheme 'bamboo'
  --   end,
  -- },
  {
    'Tsuzat/NeoSolarized.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local ok_status, NeoSolarized = pcall(require, 'NeoSolarized')

      if not ok_status then
        return
      end

      NeoSolarized.setup {
        -- your configuration comes here
        style = 'dark', -- "dark" or "light"
        transparent = true, -- true/false; Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
        styles = {
          -- Style to be applied to different syntax groups
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
          string = { italic = true },
          underline = true, -- true/false; for global underline
          undercurl = true, -- true/false; for global undercurl
        },
        -- Add specific hightlight groups
        on_highlights = function(highlights, colors)
          highlights.Include.fg = colors.red -- Using `red` foreground for Includes
        end,
      }

      -- NeoSolarized.setup()
      -- local bg_transparent = true
      -- -- --
      -- local toggle_transparency = function()
      --   bg_transparent = not bg_transparent
      --   vim.g.transparent_background = bg_transparent
      --   NeoSolarized.setup {
      --     transparent = bg_transparent,
      --     style = 'dark',
      --   }
      --   vim.cmd [[colorscheme NeoSolarized]]
      -- end
      -- --
      -- vim.keymap.set('n', '<leader>bg', toggle_transparency, { desc = 'Transparent background', noremap = true, silent = true })
      vim.cmd [[ colorscheme NeoSolarized ]]
    end,
  },
  -- {
  --   'craftzdog/solarized-osaka.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('solarized-osaka').setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       transparent = true, -- Enable this to disable setting the background color
  --       terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  --       styles = {
  --         -- Style to be applied to different syntax groups
  --         -- Value is any valid attr-list value for `:help nvim_set_hl`
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         functions = {},
  --         variables = {},
  --         -- Background styles. Can be "dark", "transparent" or "normal"
  --         sidebars = 'dark', -- style for sidebars, see below
  --         floats = 'dark', -- style for floating windows
  --       },
  --       sidebars = { 'qf', 'help' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  --       day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  --       hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  --       dim_inactive = false, -- dims inactive windows
  --       lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
  --
  --       --- You can override specific color groups to use other groups or a hex color
  --       --- function will be called with a ColorScheme table
  --       ---@param colors ColorScheme
  --       on_colors = function(colors) end,
  --
  --       --- You can override specific highlights to use other groups or a hex color
  --       --- function will be called with a Highlights and ColorScheme table
  --       ---@param highlights Highlights
  --       ---@param colors ColorScheme
  --       on_highlights = function(highlights, colors) end,
  --     }
  --
  --     require('solarized-osaka').setup {
  --       on_highlights = function(hl, c)
  --         local prompt = '#2d3149'
  --         hl.TelescopeNormal = {
  --           bg = c.bg_dark,
  --           fg = c.fg_dark,
  --         }
  --         hl.TelescopeBorder = {
  --           bg = c.bg_dark,
  --           fg = c.bg_dark,
  --         }
  --         hl.TelescopePromptNormal = {
  --           bg = prompt,
  --         }
  --         hl.TelescopePromptBorder = {
  --           bg = prompt,
  --           fg = prompt,
  --         }
  --         hl.TelescopePromptTitle = {
  --           bg = prompt,
  --           fg = prompt,
  --         }
  --         hl.TelescopePreviewTitle = {
  --           bg = c.bg_dark,
  --           fg = c.bg_dark,
  --         }
  --         hl.TelescopeResultsTitle = {
  --           bg = c.bg_dark,
  --           fg = c.bg_dark,
  --         }
  --       end,
  --     }
  --     vim.cmd [[colorscheme solarized-osaka]]
  --     --     --     -- Toggle background transparency
  --     local bg_transparent = true
  --     --     -- --
  --     local toggle_transparency = function()
  --       bg_transparent = not bg_transparent
  --       -- vim.g.transparent_background = bg_transparent
  --       require('solarized-osaka').setup {
  --         transparent = bg_transparent,
  --       }
  --       vim.cmd [[colorscheme solarized-osaka]]
  --     end
  --     --     --
  --     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  --     --
  --     -- setup must be called before loading
  --     vim.cmd.colorscheme 'solarized-osaka'
  --   end,
  -- },
}

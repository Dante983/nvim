return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  -- scrilling pluggins
  {
    'declancm/cinnamon.nvim',
    version = '*', -- use latest release
    opts = {},
    config = function()
      require('cinnamon').setup {
        -- Enable all provided keymaps
        keymaps = {
          basic = true,
          extra = true,
        },
        -- Only scroll the window
        options = { mode = 'window' },
      }
    end,
  },
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
  -- end scrilling pluggins
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'stevearc/resession.nvim',
    config = function()
      local resession = require 'resession'

      ---@diagnostic disable-next-line: missing-parameter
      resession.setup()

      vim.keymap.set('n', '<leader>Ss', resession.save, { desc = 'Save Session' })
      vim.keymap.set('n', '<leader>SL', resession.load, { desc = 'Load Session' })
      vim.keymap.set('n', '<leader>Sd', resession.delete, { desc = 'Delete Session' })
      vim.keymap.set('n', '<leader>Sl', function()
        require('resession').load 'last'
      end, { desc = 'Load last session' })

      vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function()
          resession.save 'last'
        end,
      })
    end,
  },
  {
    'rcarriga/nvim-notify',
  },
  { 'fladson/vim-kitty' },
  {
    'f-person/git-blame.nvim',
    -- load the plugin at startup
    event = 'VeryLazy',
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin wil only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = ' <date> • <summary> • <author>', -- template for the blame message, check the Message template section for more options
      date_format = '%m-%d-%Y %H:%M:%S', -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  {
    'FabijanZulj/blame.nvim',
    init = function()
      vim.api.nvim_set_keymap('n', '<Leader>gB', ':BlameToggle<CR>', { noremap = true, silent = true })
    end,
    config = true,
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('colorizer').setup { '*' }
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  {
    'NStefan002/speedtyper.nvim',
    lazy = false,
    branch = 'v2',
  },
  {
    'nvzone/typr',
    cmd = 'TyprStats',
    dependencies = 'nvzone/volt',
    opts = {},
  },
  -- {
  --   'AckslD/nvim-neoclip.lua',
  --   dependencies = {
  --     { 'kkharji/sqlite.lua', module = 'sqlite' },
  --     -- you'll need at least one of these
  --     { 'nvim-telescope/telescope.nvim' },
  --     -- {'ibhagwan/fzf-lua'},
  --   },
  --   config = function()
  --     require('neoclip').setup()
  --   end,
  -- },
  'princejoogie/dir-telescope.nvim',
  -- telescope.nvim is a required dependency
  dependencies = 'nvim-telescope/telescope.nvim',
  config = function()
    require('dir-telescope').setup {
      -- these are the default options set
      hidden = true,
      no_ignore = false,
      show_preview = true,
      follow_symlinks = false,
    }
  end,
  vim.keymap.set('n', '<leader>fW', '<cmd>Telescope dir live_grep<CR>', { desc = '[F]ind word in Dir', noremap = true, silent = true }),
  vim.keymap.set('n', '<leader>fD', '<cmd>Telescope dir find_files<CR>', { desc = '[F]ind Dir in Dir', noremap = true, silent = true }),
}

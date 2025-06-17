return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<C-w>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<C-w>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   branch = 'main',
  --   event = 'BufEnter',
  --   dependencies = {
  --     { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
  --     { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
  --   },
  --   build = 'make tiktoken', -- Only on MacOS or Linux
  --   opts = {
  --     debug = false, -- Enable debugging
  --     -- See Configuration section for rest
  --     -- default window options
  --     window = {
  --       layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
  --       width = 0.3, -- fractional width of parent, or absolute width in columns when > 1
  --       height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
  --       -- Options below only apply to floating windows
  --       relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
  --       border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
  --       row = nil, -- row position of the window, default is centered
  --       col = nil, -- column position of the window, default is centered
  --       title = 'Copilot Chat', -- title of chat window
  --       footer = nil, -- footer of chat window
  --       zindex = 1, -- determines if window is on top or below other floating windows
  --     },
  --   },
  --   mappings = {
  --     complete = {
  --       detail = '<C-w>',
  --       normal = '<C-w>',
  --       insert = '<C-w>',
  --     },
  --     close = {
  --       normal = 'q',
  --       insert = '<C-c>',
  --     },
  --     reset = {
  --       normal = '<C-c>',
  --       insert = '<C-c>',
  --     },
  --     submit_prompt = {
  --       normal = '<CR>',
  --       insert = '<C-s>',
  --     },
  --     accept_diff = {
  --       normal = '<C-y>',
  --       insert = '<C-y>',
  --     },
  --     yank_diff = {
  --       normal = 'gy',
  --       register = '"',
  --     },
  --     show_diff = {
  --       normal = 'gd',
  --     },
  --     show_system_prompt = {
  --       normal = 'gp',
  --     },
  --     show_user_selection = {
  --       normal = 'gs',
  --     },
  --   },
  --   keys = {
  --     vim.keymap.set('n', '<leader>cc', ':CopilotChat<cr>', { noremap = true, silent = true }),
  --     vim.keymap.set('n', '<leader>cf', function()
  --       require('CopilotChat').open {
  --         window = {
  --           layout = 'float',
  --           relative = 'cursor',
  --           width = 1,
  --           height = 0.4,
  --           row = 1,
  --         },
  --       }
  --     end, { desc = '[C]opilotChat [O]pen', noremap = true, silent = true }),
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
}

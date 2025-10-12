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
            accept = "<C-W>",
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
  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      event = "BufEnter",
      build = "make tiktoken",
      opts = {
        -- See Configuration section for options
      },
      keys = {
        vim.keymap.set('n', '<leader>cc', ':CopilotChat<cr>', { noremap = true, silent = true }),
        vim.keymap.set('n', '<leader>cf', function()
          require('CopilotChat').open {
            window = {
              layout = 'float',
              relative = 'cursor',
              width = 1,
              height = 0.4,
              row = 1,
            },
          }
        end, { desc = '[C]opilotChat [O]pen', noremap = true, silent = true }),
      },
    },
  },
}

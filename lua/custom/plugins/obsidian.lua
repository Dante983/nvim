return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  -- lazy = true,
  event = 'VimEnter',
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  -- keys = {
  --   '<leader>Nn',
  --   '<cmd>ObsidianNewNote<Space>',
  --   { desc = 'New Note', noremap = true, silent = true },
  -- },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/notes/personal',
        overrides = {
          notes_subdir = 'notes/dev',
        },
      },
      {
        name = 'work',
        path = '~/notes/work',
      },
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      -- Create a new note in the current workspace.
      ['<leader>Nn'] = {
        action = function()
          return require('obsidian').new_note()
        end,
        opts = { desc = 'New Note', noremap = true, silent = true },
      },
    },

    -- see below for full list of options 👇
  },

  vim.api.nvim_create_user_command('ObsidianGitSync', function()
    local sync_file = '~/notes/personal/.trigger_git_sync'
    vim.fn.writefile({}, sync_file)
    print '📡 Poslat signal Obsidianu da izvrši git sync.'
  end, {}),

  vim.keymap.set('n', '<leader>OS', ':ObsidianGitSync<CR>', { desc = 'Git Sync in Obsidian' }),
}

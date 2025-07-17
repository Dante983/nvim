return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ui = { enable = true},
    workspaces = {
      {
        name = "personal",
        path = "~/notes/personal",
        overrides = {
          notes_subdir = "notes/dev",
        },
      },
      {
        name = "work",
        path = "~/notes/work",
      },
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      -- Create a new note in the current workspace.
      ["<leader>Nn"] = {
        action = function()
          return require("obsidian").new_note()
        end,
        opts = { desc = "New Note", noremap = true, silent = true },
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    }

    -- see below for full list of options 👇
  },
  vim.api.nvim_create_user_command("ObsidianSync", function()
    local message = vim.fn.input("Commit message: ")
    if message == "" then
      print("Commit message is required.")
      return
    end
    local cmd = string.format("cd ~/notes/personal/notes/dev && git pull && git add . && git commit -m '%s' && git push", message)
    vim.fn.jobstart(cmd, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          print(table.concat(data, "\n"))
        end
      end,
      on_stderr = function(_, data)
        if data then
          print("Error: " .. table.concat(data, "\n"))
        end
      end,
      on_exit = function(_, code)
        if code == 0 then
          print("✅ Notes synced successfully!")
        else
          print("❌ Failed to sync notes.")
        end
      end,
    })
  end, {}),

  vim.keymap.set('n', '<leader>OP', function()
    local obsidian_path = '~/notes/personal/notes'
    local cmd = string.format('cd %s && git pull', obsidian_path)
    vim.fn.jobstart(cmd, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data)
        if data then
          vim.schedule(function()
            vim.notify(table.concat(data, '\n'), vim.log.levels.INFO, { title = 'Obsidian Git Pull' })
          end)
        end
      end,
      on_stderr = function(_, data)
        if data then
          vim.schedule(function()
            vim.notify(table.concat(data, '\n'), vim.log.levels.ERROR, { title = 'Obsidian Git Pull Error' })
          end)
        end
      end,
      on_exit = function(_, code)
        if code == 0 then
          vim.schedule(function()
            vim.notify('Obsidian notes pulled successfully!', vim.log.levels.INFO, { title = 'Obsidian Git Pull' })
          end)
        end
      end,
    })
  end, { desc = 'Git pull Obsidian notes' });

  vim.keymap.set(
    "n",
    "<leader>OS",
    "<cmd>ObsidianSync<CR>",
    { desc = "Sync Obsidian Notes", noremap = true, silent = true }
  ),
}

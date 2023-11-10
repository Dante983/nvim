return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      ---@class Shortcut
      ---@field icon string
      ---@field icon_hl string|nil
      ---@field desc string
      ---@field desc_hl string|nil
      ---@field key string
      ---@field key_hl string|nil
      ---@field keymap string|nil
      ---@field action string|fun()
      ---@param shortcut Shortcut
      ---@return Shortcut
      local function key(shortcut)
        shortcut.icon_hl = shortcut.icon_hl or "Title"
        shortcut.desc_hl = shortcut.desc_hl or "String"
        shortcut.key_hl = shortcut.key_hl or "Keyword"
        return shortcut
      end
      require("dashboard").setup {
        theme = "doom",
        config = {
          header = {
            "",
            "",
            "",
            "",
            "",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
             "⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ",
             "⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ",
             "⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ",
             "⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ",
             "⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ",
             "⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ",
             "⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ",
             "⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ",
             "⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ",
             "⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ",
             "⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ",
             "⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ",
             "⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ",
             "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
            "",
            "",
            "",
          },
          center = {
            {
              icon = "  ",
              desc = 'Find Files',
              key = 'SPC f f',
              -- keymap = 'SPC f f',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua print(3)'
            },
            {
              icon = "  ",
              desc = 'Find Recent Files',
              key = 'SPC f r',
              -- keymap = 'SPC f r',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua print(3)'
            },
            {
              icon = "  ",
              desc = 'Find Words in CWD',
              key = 'SPC f s',
              -- keymap = 'SPC f s',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua print(3)'
            },
            -- key { icon = "  ", desc = "FZF", key = "fw", action = "FzfLua" },
            -- key { icon = "  ", desc = "Find Files", key = "ff", action = "FzfLua files" },
            -- key { icon = "  ", desc = "Recent Files", key = "ff", action = "FzfLua files" },
            -- key { icon = "  ", desc = "Find Word", key = "fr", action = "FzfLua oldfiles" },
            -- key { icon = "󰒲  ", desc = "Plugins", key = "<SPC> l p", action = "Lazy" },
            -- key { icon = "  ", desc = "Help", key = "fh", action = "FzfLua help_tags" },
          },
          footer = { "IDEMO NIS!!!" },
        },
      }
    end,
  }
}

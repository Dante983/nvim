-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity/color/transparent-nvim" },
  { import = "astrocommunity/git/git-blame-nvim" },
  { import = "astrocommunity/git/blame-nvim" },
  { import = "astrocommunity/motion/leap-nvim" },
  -- { import = "astrocommunity/bars-and-lines/heirline-vscode-winbar" },
  { import = "astrocommunity/bars-and-lines/bufferline-nvim" },
  { import = "astrocommunity/utility/noice-nvim" },
  { import = "astrocommunity/scrolling/nvim-scrollbar" },
  -- { import = "astrocommunity/scrolling/mini-animate" },
  { import = "astrocommunity/file-explorer/oil-nvim" },
  { import = "astrocommunity/git/diffview-nvim" },
  { import = "astrocommunity/editing-support/nvim-treesitter-context" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity/pack/full-dadbod" },
  { -- further customize the options set by the community
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },
  -- import/override with your plugins folder
}

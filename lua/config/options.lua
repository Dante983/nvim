local opt = vim.opt
local api = vim.api

opt.number = true         -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true     -- Highlight current line
opt.wrap = false          -- Don't wrap lines
opt.scrolloff = 10        -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor
vim.o.signcolumn = "yes"

-- Indentation
opt.tabstop = 2        -- Tab width
opt.shiftwidth = 2     -- Indent width
opt.softtabstop = 2    -- Soft tab stop
opt.expandtab = true   -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true  -- Copy indent from current line

-- Search settings
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true  -- Case sensitive if uppercase in search
opt.hlsearch = false  -- Don't highlight search results
opt.incsearch = true  -- Show matches as you type

-- File handling
opt.backup = false                            -- Don't create backup files
opt.writebackup = false                       -- Don't create backup before writing
opt.swapfile = false                          -- Don't create swap files
opt.undofile = true                           -- Persistent undo
opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
opt.updatetime = 300                          -- Faster completion
opt.timeoutlen = 500                          -- Key timeout duration
opt.ttimeoutlen = 0                           -- Key code timeout
opt.autoread = true                           -- Auto reload files changed outside vim
opt.autowrite = false                         -- Don't auto save

-- Behavior settings
--
opt.hidden = true                   -- Allow hidden buffers
opt.errorbells = false              -- No error bells
opt.backspace = "indent,eol,start"  -- Better backspace behavior
opt.autochdir = false               -- Don't auto change directory
opt.iskeyword:append("-")           -- Treat dash as part of word
opt.path:append("**")               -- include subdirectories in search
opt.selection = "exclusive"         -- Selection behavior
opt.mouse = "a"                     -- Enable mouse support
opt.clipboard:append("unnamedplus") -- Use system clipboard
opt.modifiable = true               -- Allow buffer modifications
opt.encoding = "UTF-8"              -- Set encoding

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

opt.splitright = true
vim.o.termguicolors = true

-- vim.g.netrw_banner = 0       -- Hide the Netrw banner on top
-- vim.g.netrw_altv = 1         -- Create the split of the Netrw window to the left
-- vim.g.netrw_browse_split = 4 -- Open files in previous window. This emulates the typical "drawer" behavior
-- vim.g.netrw_liststyle = 4    -- Set the styling of the file list to be one column with files inside
-- vim.g.netrw_winsize = 14     -- Set the width of the "drawer"

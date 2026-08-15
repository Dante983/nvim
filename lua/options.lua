-- Editor options

local opt = vim.opt

-- Display
opt.number         = true           -- line numbers
opt.relativenumber = true           -- relative line numbers
opt.cursorline     = true           -- highlight current line
opt.wrap           = false          -- no line wrapping
opt.scrolloff      = 10             -- keep 10 lines above/below cursor
opt.sidescrolloff  = 10             -- keep 10 columns left/right of cursor
opt.signcolumn     = "yes"          -- always show sign column
opt.colorcolumn    = "100"          -- ruler at 100 chars
opt.showmatch      = true           -- highlight matching brackets
opt.showmode       = false          -- mode shown in statusline instead
opt.cmdheight      = 1              -- single-line command bar
opt.pumheight      = 10             -- popup menu max height
opt.pumblend       = 10             -- popup menu transparency
opt.winblend       = 0              -- floating window transparency
opt.fillchars      = { eob = " " } -- hide ~ on empty lines
opt.synmaxcol      = 300            -- syntax highlight limit per line
opt.termguicolors  = true

-- Cursor shape: block in normal, bar in insert, underscore in replace
opt.guicursor =
	"n-v-c:block,i:ver25,r-cr:hor20,o:hor50" ..
	",a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" ..
	",sm:block-blinkwait175-blinkoff150-blinkon175"

-- Indentation
opt.tabstop     = 4     -- tab width
opt.shiftwidth  = 4     -- indent width
opt.softtabstop = 4     -- soft tab stop
opt.expandtab   = true  -- spaces instead of tabs
opt.smartindent = true  -- smart auto-indent
opt.autoindent  = true  -- copy indent from current line

-- Search
opt.ignorecase = true   -- case-insensitive search
opt.smartcase  = true   -- case-sensitive if uppercase present
opt.hlsearch   = true   -- highlight all matches
opt.incsearch  = true   -- show matches while typing

-- Splits
opt.splitbelow = true   -- horizontal splits open below
opt.splitright = true   -- vertical splits open to the right

-- Folding (treesitter expression, all folds open by default)
opt.foldmethod = "expr"
opt.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel  = 99

-- Completion
opt.completeopt = "menuone,noinsert,noselect"
opt.wildmenu    = true
opt.wildmode    = "longest:full,full"

-- Files
opt.backup      = false   -- no backup file
opt.writebackup = false   -- no write backup
opt.swapfile    = false   -- no swap file
opt.undofile    = true    -- persistent undo
opt.autoread    = true    -- auto-reload externally changed files
opt.autowrite   = false   -- no auto-save
opt.hidden      = true    -- allow hidden buffers

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
opt.undodir = undodir

-- Misc
opt.updatetime    = 300                  -- faster completion/CursorHold
opt.timeoutlen    = 1000                 -- key sequence timeout
opt.ttimeoutlen   = 50                   -- key code timeout
opt.errorbells    = false                -- no error sounds
opt.backspace     = "indent,eol,start"  -- sensible backspace
opt.autochdir     = false
opt.selection     = "inclusive"          -- include last char in selection
opt.mouse         = "a"                  -- enable mouse
opt.modifiable    = true
opt.conceallevel  = 2                    -- required by obsidian.nvim
opt.concealcursor = ""                   -- don't conceal on cursor line
opt.diffopt:append("linematch:60")       -- better diff alignment
opt.redrawtime    = 10000                -- tolerate slow syntax files
opt.maxmempattern = 20000

opt.iskeyword:append("-")   -- treat foo-bar as one word
opt.path:append("**")       -- recursive :find
opt.clipboard:append("unnamedplus") -- use system clipboard

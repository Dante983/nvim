local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " " -- change localleader to a space

vim.keymap.set("n", "<leader>e", function()
    -- Check if any window has netrw open
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "netrw" then
            vim.api.nvim_win_close(win, false)
            return
        end
    end
    -- Open netrw on the right with specific width
    vim.cmd("botright vsplit")
    vim.cmd("vertical resize 50") -- Width in columns (adjust as needed)
    vim.cmd("edit " .. vim.fn.expand("%:p:h"))
end)
vim.keymap.set("n", "<leader>w", ":write!<CR>", { silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>W", "<cmd>noautocmd w <CR>", { desc = "Save without formatting" })
vim.keymap.set("n", "<leader>q", ":q!<CR>", opts)

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- move focus
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

-- Panes resizing
vim.keymap.set("n", "+", ":vertical resize +5<CR>")
vim.keymap.set("n", "_", ":vertical resize -5<CR>")
vim.keymap.set("n", "=", ":resize +5<CR>")
vim.keymap.set("n", "-", ":resize -5<CR>")

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "*", "*zzv", opts)
vim.keymap.set("n", "#", "#zzv", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

-- Select all
vim.keymap.set("n", "<leader>A", "ggVG", opts)

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Move lines up/down
vim.keymap.set("n", "<A-d>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-u>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-d>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-u>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

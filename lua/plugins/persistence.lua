return -- Lua
{
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
        -- add any custom options here
    },
    keymaps = {
        -- load the session for the current directory
        vim.keymap.set("n", "<leader>Ls", function()
            require("persistence").load()
        end, { desc = "Load Session" }),

        -- -- select a session to load
        vim.keymap.set("n", "<leader>LS", function()
            require("persistence").select()
        end, { desc = "Select Session" }),
        --
        -- -- load the last session
        vim.keymap.set("n", "<leader>Ll", function()
            require("persistence").load({ last = true })
        end, { desc = "Load Last Session" }),
        --
        -- -- stop Persistence => session won't be saved on exit
        vim.keymap.set("n", "<leader>Ld", function()
            require("persistence").stop()
        end, { desc = "Stop Persistence" }),
    },
}

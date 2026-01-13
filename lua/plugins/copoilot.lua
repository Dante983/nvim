return {
    {
        "github/copilot.vim",
        config = function()
            vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false,
            })
            vim.g.copilot_no_tab_map = true
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            "folke/snacks.nvim",
        },
        opts = {},
        config = function(_, opts)
            -- Ensure Snacks ui_select is enabled
            require("snacks").setup({
                picker = {
                    ui_select = true, -- Enable ui_select integration
                },
            })

            require("CopilotChat").setup(opts)
        end,
        keys = {
            { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
        },
    },
}

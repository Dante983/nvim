return {
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set("i", "<S-TAB>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
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

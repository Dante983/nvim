return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find all files" })
        vim.keymap.set("n", "<leader>fF", function()
            builtin.find_files({ hidden = true, follow = true, no_ignore = true })
        end, { desc = "Find hidden files" })
        vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
        -- vim.keymap.set("n", "<leader>o", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
        vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope old files" })
        vim.keymap.set("n", "<leader>f<CR>", builtin.resume, { desc = "Telescope resume search" })
        require("telescope").setup({
            pickers = {
                find_files = {
                    layout_config = { height = 40 },
                    theme = "ivy",
                },
                olffiles = {
                    layout_config = { height = 40 },
                    theme = "ivy",
                },
                lsp_references = {
                    layout_config = { height = 40 },
                    theme = "ivy",
                },
                buffers = {
                    show_all_buffers = true,
                    sort_lastused = true,
                    -- theme = "dropdown",
                    -- previewer = false,
                    mappings = {
                        i = {
                            ["<c-d>"] = "delete_buffer",
                        },
                    },
                },
            },
        })
    end,
}

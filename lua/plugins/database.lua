return {
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod",                     lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.dbs = {
                {
                    -- cbleap local
                    name = "docker-mysql-cbleap",
                    url = "mysql://root:secret@127.0.0.1:3306/cbleap",
                },
            }
        end,
        keymaps = {
            vim.keymap.set("n", "<leader>B", "<cmd>DBUIToggle<CR>", { desc = "DB toggle" }),
        },
    },
}

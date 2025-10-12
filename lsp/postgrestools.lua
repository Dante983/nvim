local blink = require("blink.cmp")
return {
    cmd = { "postgrestools", "lsp-proxy"},
    filetypes = { "sql", "pgsql" },
    root_dir = vim.fs.root(0, { 'postgrestools.jsonc' }),
    single_file_support = true,
    settings = {
        postgrestools = {
            -- Example settings, replace with actual settings for postgrestools
            format = {
                enable = true,
                style = "sql-formatter", -- or "sql-formatter"
            },
            lint = {
                enable = true,
                rules = {
                    "no-select-star",
                    "consistent-case",
                },
            },
        },
    },
   capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        blink.get_lsp_capabilities(),
        {
            fileOperations = {
                didRename = true,
                willRename = true,
            },
        }
    ),
}

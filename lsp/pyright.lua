local blink = require("blink.cmp")

return {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python", "py" },
    root_markers = { ".git", "pyproject.toml", "setup.py", "setup.cfg" },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
    capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        blink.get_lsp_capabilities()
    ),
}

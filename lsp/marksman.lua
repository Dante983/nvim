return {
  cmd = { "marksman", "server" },
  -- filetypes = { "markdown", "markdown.mdx", ".md" },
  -- root_markers = { ".marksman.toml", ".git" },
  config = function()
    require("marksman").setup({
      enable_syntax_highlighting = true,
    })
  end,
}

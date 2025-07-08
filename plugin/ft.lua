-- if a file is a .env or .envrc file, set the filetype to sh
vim.filetype.add({
  filename = {
    [".env"] = "sh",
    [".envrc"] = "sh",
    ["*.env"] = "sh",
    ["*.envrc"] = "sh"
  },
  vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
    pattern = ".env*",
    callback = function()
      -- Disable diagnostics (warnings and errors) for .env files
      vim.diagnostic.disable(0)
    end,
  })
})

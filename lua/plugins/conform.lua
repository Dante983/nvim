return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofmt", "goimports" },
        php = { "php-cs-fixer" },
        templ = { "templ" },
        tmpl = { "htmlbeautifier", "htmlhint" },
        blade = { "blade-formatter" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 10000,
      },
      formatters = {
        ["php-cs-fixer"] = {
          command = "php-cs-fixer",
          args = {
            "fix",
            "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
            "$FILENAME",
          },
          stdin = false,
        },
      },
      --  formatters= {
      --   ['blade-formatter'] = {
      --     timeout_ms = 10000
      --   },
      -- }
    })

    vim.keymap.set("", "<leader>Ff", function()
      require("conform").format({ async = true }, function(err)
        if not err then
          local mode = vim.api.nvim_get_mode().mode
          if vim.startswith(string.lower(mode), "v") then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
          end
        end
      end)
    end, { desc = "Format code" })

    require("conform").setup({
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
    })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })

    -- Add format toggle keymap
    vim.keymap.set("n", "<leader>Fe", function()
      if vim.g.disable_autoformat then
        vim.cmd("FormatEnable")
        vim.notify("Format on save: enabled", "info")
      else
        vim.cmd("FormatDisable")
        vim.notify("Format on save: disabled", "info")
      end
    end, { desc = "Toggle format on save" })
  end,
}

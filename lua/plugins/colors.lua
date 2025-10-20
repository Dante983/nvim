local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

return {
    --    {
    --    "folke/tokyonight.nvim",
    --    lazy = false,
    --    priority = 1000,
    --    config = function()
    -- require("tokyonight").setup({
    --     transparent = true,
    --     styles = {
    -- 	sidebars = "transparent",
    -- 	floats = "transparent",
    --     }
    -- })
    --      vim.cmd([[colorscheme tokyonight]])
    --    end,
    --  },
    {
        "tahayvr/matteblack.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("matteblack")
            vim.cmd("hi Directory guibg=NONE")
            vim.cmd("hi SignColumn guibg=NONE")
            enable_transparency()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "tokyonight",
        },
    },
}

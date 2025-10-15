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
            vim.cmd.colorscheme "matteblack"
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            theme = "tokyonight"
        }
    }
}

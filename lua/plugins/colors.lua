-- local function enable_transparency()
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- end

return {
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --         -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --         -- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    --         -- enable_transparency()
    --         require("tokyonight").setup({
    --             transparent = true,
    --             styles = {
    --                 sidebars = "transparent",
    --                 floats = "transparent",
    --             },
    --         })
    --         vim.cmd([[colorscheme tokyonight]])
    --     end,
    -- },
    -- Install without configuration
    -- { 'projekt0n/github-nvim-theme', name = 'github-theme' }

    -- Or with configuration
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                transparent_background = true,
                integrations = {
                    telescope = true,
                    lualine = true,
                    treesitter = true,
                    notify = true,
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    -- {
    --     "AlphaTechnolog/pywal.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("pywal").setup({
    --             theme = "auto",
    --             bg_contrast = 0.1,
    --             transparent_bg = true,
    --         })
    --         vim.cmd.colorscheme("pywal")
    --     end,
    -- },
    -- {
    -- 	"tahayvr/matteblack.nvim",
    -- 	lazy = false,
    -- 	priority = 1000,
    -- 	config = function()
    -- 		vim.cmd.colorscheme("matteblack")
    -- 		vim.cmd("hi Directory guibg=NONE")
    -- 		vim.cmd("hi SignColumn guibg=NONE")
    -- 		enable_transparency()
    -- 	end,
    -- },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "tokyonight",
            -- theme = "pywal-nvim",
            sections = {
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    },
                },
            },
        },
    },
}

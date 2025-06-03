return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                }
            },
        },
        config = function()
            require("lspconfig").lua_ls.setup({})
            require("lspconfig").gopls.setup({})
            vim.deep_equal()
        end
    },
    {
        "gbprod/phpactor.nvim",
        config = function ()
            require("lspconfig").phpactor.setup({})
        end
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    }
}

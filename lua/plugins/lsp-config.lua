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

            vim.diagnostic.config({
                virtual_text = {
                    spacing = 4,
                    prefix = "●",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
            vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "DiagnosticError" })
            vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { link = "DiagnosticWarn" })
            vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { link = "DiagnosticInfo" })
            vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { link = "DiagnosticHint" })

            vim.deep_equal()
        end,
        opts = {
            inline_hints = { enabled = true },
        }
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
        config = function()
            require("typescript-tools").setup({})
        end
    }
}

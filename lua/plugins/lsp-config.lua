return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            {
                "phpactor/phpactor",
            }
        },
        config = function()
            require("lspconfig").lua_ls.setup({})
            require("lspconfig").gopls.setup({})
            require("lspconfig").ts_ls.setup({})
            -- require('lspconfig').intelephense.setup {
            --     settings = {
            --         intelephense = {
            --             environment = { includePaths = { "src" } },
            --             files = {
            --                 maxSize = 5000000;
            --             },
            --         },
            --     },
            -- }
            require("lspconfig").phpactor.setup{
                on_attach = function(client, bufnr)
                    vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
                        local client_name = ctx.client_id and vim.lsp.get_client_by_id(ctx.client_id).name or "unknown"
                        local level = result.type
                        local message = result.message

                        if level == vim.lsp.protocol.MessageType.Info then
                            return
                        else
                            vim.api.nvim_echo({{client_name .. ": " .. message, "Normal"}}, true, {})
                        end
                    end
                end
            }
        end
    }
}

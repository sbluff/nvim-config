return {
    "stevearc/conform.nvim",
    lazy = true,
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                php = { "php" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
            notify_on_error = true,
            formatters = {
                php = {
                    command = "php-cs-fixer",
                    args = {
                        "fix",
                        "$FILENAME",
                    },
                    stdin = false,
                }
            }
        })
    end,
}

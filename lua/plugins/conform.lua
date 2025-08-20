return {
    'stevearc/conform.nvim',
    setup = {
        formatters_by_ft = {
            lua = {"stylua"},
            php = {"easy-coding-standard"},
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}


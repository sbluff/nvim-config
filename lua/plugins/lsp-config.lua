return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    setup = {
        ensure_installed = { "lua_ls", "intelephense" },
    },
    config = function()
        require("mason")

        local mason_lsp_config = require("mason-lspconfig")
        mason_lsp_config.setup()
    end,
}

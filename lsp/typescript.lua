local root_files = {
    "tsconfig.base.json",
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
}

local function get_root_dir(bufnr)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local found = vim.fs.find(root_files, { path = fname, upward = true })[1]
    return found and vim.fs.dirname(found) or vim.fn.getcwd()
end

local root = get_root_dir(0)

return {
    name = { 'typescript' },
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'javascript, javscritpreact' },
    root_dir = root,
}

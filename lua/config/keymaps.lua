local set = vim.keymap.set

local function map_modes(modes, source_remap, target_remap, opts)
    opts = opts or { noremap = true, silent = true }

    for _, mode in ipairs(modes) do
        if mode ~= 't' then
            set(mode, source_remap, target_remap, opts)
        else
            local converted_remap = 'jk' .. target_remap
            set(mode, source_remap, converted_remap, opts)
        end
    end
end

-- Split remaps
set('n', '<C-s>', function()
    vim.cmd.vnew()
end)

map_modes({ 'i', 'n', 't' }, '<C-h>', '<C-w>h')
map_modes({ 'i', 'n', 't' }, '<C-j>', '<C-w>j')
map_modes({ 'i', 'n', 't' }, '<C-k>', '<C-w>k')
map_modes({ 'i', 'n', 't' }, '<C-l>', '<C-w>l')
map_modes({ 'i', 'n', 't' }, '<C-v>', '<C-w>v')
map_modes({ 'i', 'n', 't' }, '<C-s>', '<C-w>s')
map_modes({ 'i', 'n', 't' }, '<C-a>', '<C-w>a')
map_modes({ 'i', 'n', 't' }, '<C-a>', '<C-w>a')

map_modes({ 'n' }, '<leader><leader>x', '<cmd>source %<CR>')
map_modes({ 'n' }, '<leader>t', '<cmd>term<CR>')

set('n', '<C-q>', ':bd!<CR>')
set('n', '<C-n>', ':tabnew<CR>', { noremap = true, silent = true })
set('n', '<leader>d', vim.diagnostic.goto_next)

set('i', 'jk', '<Esc>')
set('i', 'jK', '<Esc>')
set('i', 'kj', '<Esc>')
set('i', 'kJ', '<Esc>')
set('t', 'jk', [[<C-\><C-n>]], { noremap = true, silent = true })
set('t', 'kj', [[<C-\><C-n>]], { noremap = true, silent = true })

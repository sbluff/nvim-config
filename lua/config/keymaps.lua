local set = vim.keymap.set

-- Split remaps
set('n', '<C-s>', function()
  vim.cmd.vnew()
end)

-- set('n', '<C-v>', '<C-w>v')
set('n', '<C-h>', '<C-w>h')
set('n', '<C-j>', '<C-w>j')
set('n', '<C-k>', '<C-w>k')
set('n', '<C-l>', '<C-w>l')
set('n', '<C-v>', '<C-w>v')
set('n', '<C-s>', '<C-w>s')
set('n', '<C-a>', '<C-w>a')
set('n', '<C-a>', '<C-w>a')

set('n', '<leader><leader>x', '<cmd>source %<CR>')
set('n', '<leader>t', '<cmd>term<CR>')

set('n', '<C-q>', ':bd<CR>')
set('n', '<C-1>', ':bnext<CR>')
set('n', '<C-2>', ':bprev<CR>')
set('n', '<C-n>', ':tabnew<CR>', { noremap = true, silent = true })

set('i', 'jk', '<Esc>')
set('i', 'jK', '<Esc>')
set('i', 'kj', '<Esc>')
set('i', 'kJ', '<Esc>')
set('t', 'jk', [[<C-\><C-n>]], { noremap = true, silent = true })
set('t', 'kj', [[<C-\><C-n>]], { noremap = true, silent = true })

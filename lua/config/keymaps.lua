local set = vim.keymap.set

vim.g.mapleader = ' '

-- Split remaps
set('n', '<C-s>', '<C-w>s')
set('n', '<C-v>', '<C-w>v')
set('n', '<C-h>', '<C-w>h')
set('n', '<C-j>', '<C-w>j')
set('n', '<C-k>', '<C-w>k')
set('n', '<C-l>', '<C-w>l')
set('n', '<C-x>', ':close<CR>')
set('n', '<C-o>', ':only<CR>')

set('n', '<C-w>', ':tabclose<CR>', { noremap = true, silent = true })
set('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })
set('n', '<C-1>', 'gt')
set('n', '<C-2>', 'gT')

set('n', 'jk', 'Esc')
set('n', 'jK', 'Esc')

set('n', '<leader>st', function()
  vim.cmp.vnew()
  vim.cmp.term()
  vim.cmp.wincmd 'J'
  vim.api.nvim_win_set_height(0, 10)
end)

local set = vim.keymap.set

vim.g.mapleader = ' '

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
set('n', '<C-x>', ':close<CR>')
set('n', '<C-o>', ':only<CR>')

set('n', '<C-w>', ':tabclose<CR>', { noremap = true, silent = true })
set('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })
set('n', '<C-1>', 'gt')
set('n', '<C-2>', 'gT')

set('i', 'jk', '<Esc>')
set('i', 'jK', '<Esc>')

local function open_floating_terminal() end

-- Map it to a key (e.g., `<leader>t`)
vim.keymap.set('n', '<leader>t', open_floating_terminal, { desc = 'Open floating terminal' })

set('n', '<leader>st', function()
  local buf = vim.api.nvim_create_buf(false, true) -- Create a new scratch buffer
  local width = math.floor(vim.o.columns * 0.8) -- 80% of the editor width
  local height = math.floor(vim.o.lines * 0.8) -- 80% of the editor height

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    style = 'minimal',
    border = 'rounded',
  })

  vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      vim.api.nvim_win_close(win, true)
    end,
  })
  vim.cmd 'startinsert'
end)

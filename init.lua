vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.lsp.enable('luals')
vim.lsp.enable('intelephense')

require 'config.options'

require 'config.keymaps'

require 'config.lazy'

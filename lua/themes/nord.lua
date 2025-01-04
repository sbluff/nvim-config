return {
  {
    'shaunsingh/nord.nvim',
    priority = 1000,
    init = function()
      print 'Nord theme is being used'
      vim.cmd.colorscheme 'nord'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

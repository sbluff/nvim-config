return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local ts_undo = require 'telescope-undo.actions'
      local h_pct = 0.90
      local w_pct = 0.80
      local w_limit = 75

      local standard_setup = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        preview = { hide_on_startup = true },
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            mirror = true,
            prompt_position = 'top',
            width = function(_, cols, _)
              return math.min(math.floor(w_pct * cols), w_limit)
            end,
            height = function(_, _, rows)
              return math.floor(rows * h_pct)
            end,
            preview_cutoff = 10,
            preview_height = 0.4,
          },
        },
      }

      local fullscreen_setup = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        preview = { hide_on_startup = false },
        layout_strategy = 'flex',
        layout_config = {
          flex = { flip_columns = 100 },
          horizontal = {
            mirror = false,
            prompt_position = 'top',
            width = function(_, cols, _)
              return math.floor(cols * w_pct)
            end,
            height = function(_, _, rows)
              return math.floor(rows * h_pct)
            end,
            preview_cutoff = 10,
            preview_width = 0.5,
          },
          vertical = {
            mirror = true,
            prompt_position = 'top',
            width = function(_, cols, _)
              return math.floor(cols * w_pct)
            end,
            height = function(_, _, rows)
              return math.floor(rows * h_pct)
            end,
            preview_cutoff = 10,
            preview_height = 0.5,
          },
        },
      }

      require('telescope').setup {
        defaults = vim.tbl_extend('error', standard_setup, {
          sorting_strategy = 'ascending',
          path_display = { 'filename_first' },
          mappings = {
            n = {
              ['o'] = require('telescope.actions.layout').toggle_preview,
              ['<C-c>'] = require('telescope.actions').close,
            },
            i = {
              ['<C-o>'] = require('telescope.actions.layout').toggle_preview,
            },
          },
        }),

        pickers = {
          find_files = {
            find_command = {
              'fd',
              '--type',
              'f',
              '-H',
              '--strip-cwd-prefix',
            },
          },
        },

        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          undo = vim.tbl_extend('error', fullscreen_setup, {
            diff_context_lines = 4,
            preview_title = 'Diff',
            mappings = {
              i = {
                ['<cr>'] = ts_undo.restore,
                ['<C-cr>'] = ts_undo.restore,
                ['<C-y>d'] = ts_undo.yank_deletions,
                ['<C-y>a'] = ts_undo.yank_additions,
              },
              n = {
                ['<cr>'] = ts_undo.restore,
                ['ya'] = ts_undo.yank_additions,
                ['yd'] = ts_undo.yank_deletions,
              },
            },
          }),
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}

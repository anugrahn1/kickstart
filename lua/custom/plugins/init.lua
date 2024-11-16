-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
-- See the kickstart.nvim README for more information

return {
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    config = function()
      require('oil').setup {
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,

        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, '.')
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return name == '.git' -- hide .git folder in Oil.nvim
          end,
        },
        use_default_keymaps = false,
        keymaps = {
          ['<CR>'] = 'actions.select',
          ['-'] = 'actions.parent',
          ['<C-c>'] = 'actions.close',
          ['<C-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
          ['<C-h>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
          ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory', mode = 'n' }, -- changes current working directory
        },
      }
      -- TODO: make oil window split and toggleable with vim.o.filetype
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
    -- Optional dependencies
    dependencies = { 'echasnovski/mini.icons' },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-j>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-k>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-l>', function()
        harpoon:list():select(4)
      end)
    end,
  },

  {
    'numToStr/FTerm.nvim',
    enabled = false,
    event = 'VeryLazy',
    config = function()
      vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
      vim.api.nvim_set_keymap('t', '<C-c>', '<C-\\><C-n>', { noremap = true })
      vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
      vim.keymap.set({ 'n', 't' }, '<C-\\>', vim.cmd.FTermToggle)
    end,
  },

  {
    'VonHeikemen/searchbox.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>r', vim.cmd.SearchBoxReplace)
      vim.keymap.set('n', '<leader>R', ':SearchBoxReplace confirm=menu <CR>')
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    enabled = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- event = "ColorScheme",
    event = 'VeryLazy',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          -- lualine_b = { 'buffers' },
          -- lualine_c = {'filename'},
          -- lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = { 'progress' },
          -- lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },

  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    event = 'VeryLazy',
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  {
    'CRAG666/code_runner.nvim',
    enabled = false,
    event = 'VeryLazy',
    config = true,
  },

  {
    'echasnovski/mini.basics',
    event = 'VeryLazy',
    version = false,
    opts = {
      options = {
        basic = false,
      },
      mappings = {
        basic = true,
      },
      autocommands = {
        basic = false,
      },
    },
  },

  {
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    version = false,
    opts = {},
  },

  {
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    version = false,
    opts = {},
  },
  {
    'mbbill/undotree',
    keys = {
      { '<leader>ut', ':UndotreeToggle<CR>', desc = 'Toggle UndoTree' },
    },
    config = function()
      -- require('undotree').setup({})
    end,
  },
  {
    'leath-dub/snipe.nvim',
    event = 'VeryLazy',
    config = function()
      local snipe = require 'snipe'
      snipe.setup()
      vim.keymap.set('n', '<leader>b', snipe.open_buffer_menu)
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    event = 'VeryLazy',
    version = false,
    opts = {},
  },

  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'college',
          path = '~/Obsidian/College Research/',
        },
        -- {
        --   name = "work",
        --   path = "~/vaults/work",
        -- },
      },

      -- see below for full list of options 👇
    },
  },

  {
    'echasnovski/mini.indentscope',
    opts = {
      symbol = '│',
      options = { try_as_border = true },
      draw = {
        delay = 100,
        priority = 2,
        animation = function(s, n)
          return s / n * 20
        end,
      },
    },
  },

  {
    'OXY2DEV/markview.nvim',
    -- lazy = false,      -- Recommended
    ft = 'markdown', -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      'nvim-treesitter/nvim-treesitter',

      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      vim.cmd 'Markview disableAll'
    end,
    keymaps = {
      vim.keymap.set('n', '<leader>ma', ':Markview splitToggle<CR>'),
    },
  },

  {
    'nvchad/ui',
    config = function()
      require 'nvchad'
    end,
  },

  {
    'nvchad/base46',
    lazy = true,
    build = function()
      require('base46').load_all_highlights()
    end,
  },

  {
    'nvchad/volt',
    lazy = true,
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'VeryLazy',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    opts = {
      bar = {
        sources = function(buf, _)
          local sources = require 'dropbar.sources'
          local utils = require 'dropbar.utils'
          if vim.bo[buf].ft == 'markdown' then
            return {
              sources.path,
              sources.markdown,
            }
          end
          if vim.bo[buf].buftype == 'terminal' then
            return {
              sources.terminal,
            }
          end
          return {
            sources.path,
            -- utils.source.fallback {
            --   sources.lsp,
            --   sources.treesitter,
            -- },
          }
        end,
      },
    },
  },

  {
    -- 'anugrahn1/better-gf',
    dir = '~/projects/better-gf/',

    event = 'VeryLazy',
    opts = {
      use_picker = true,
    },
    keys = {
      { '<leader>w', '<CMD>BetterGF<CR>', desc = 'BetterGF' },
    },
  },

  {
    -- 'anugrahn1/goto-github.nvim',
    dir = '~/projects/goto-github.nvim/',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { '<leader>go', '<CMD>OpenGithubLink<CR>', desc = 'GoToGithub' },
    },
  },

  {
    'gbprod/substitute.nvim',
    enabled = false,
    opts = {},
  },
  {
    'echasnovski/mini.jump',
    version = false,
    opts = {},
  },

  {
    'echasnovski/mini.files',
    event = 'VeryLazy',
    version = false,
    opts = {},
  },
}

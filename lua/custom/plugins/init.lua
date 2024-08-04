-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
-- See the kickstart.nvim README for more information

return {
  --   {
  --     "rose-pine/neovim",
  --     as = "rose-pine",
  --     config = function()
  --       require("rose-pine").setup({
  --         highlight_groups = {
  --           TelescopeBorder = { fg = "highlight_high", bg = "none" },
  --           TelescopeNormal = { bg = "none" },
  --           TelescopePromptNormal = { bg = "base" },
  --           TelescopeResultsNormal = { fg = "subtle", bg = "none" },
  --           TelescopeSelection = { fg = "text", bg = "base" },
  --           TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
  --           StatusLine = { fg = "love", bg = "love", blend = 10 },
  --           StatusLineNC = { fg = "subtle", bg = "surface" },
  --           vim.api.nvim_set_hl(0, "Normal", { bg = "none" }),
  --           vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }),
  --           vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#330000" }),
  --         },
  --       })
  --     end
  --   },
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   enabled = false,
  --   priority = 1000,
  --   init = function()
  --     vim.cmd.colorscheme("cyberdream")
  --   end,
  --   opts = {
  --     transparent = true,
  --     italic_comments = true,
  --     hide_fill_chars = true,
  --   }
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = true,
    init = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
    opts = {},
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme('gruvbox-material')
    end
  },
  {
    'stevearc/oil.nvim',
    event = "VeryLazy",
    config = function()
      require("oil").setup({
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
        },
        use_default_keymaps = false,
        keymaps = {
          ["<CR>"] = "actions.select",
          ["-"] = "actions.parent",
          ["<C-c>"] = "actions.close",

        }
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
    -- Optional dependencies
    dependencies = { "echasnovski/mini.icons" },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },

  {
    "nvim-neorg/neorg",
    -- lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    event = 'VeryLazy',
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes/",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
    end,
  },

  {
    "numToStr/FTerm.nvim",
    event = "VeryLazy",
    config = function()
      vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
      vim.api.nvim_set_keymap('t', '<C-c>', '<C-\\><C-n>', { noremap = true })
      vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
      vim.keymap.set({ 'n', 't' }, "<C-\\>", vim.cmd.FTermToggle)
    end
  },

  {
    "VonHeikemen/searchbox.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>r", vim.cmd.SearchBoxReplace)
      vim.keymap.set("n", "<leader>R", ":SearchBoxReplace confirm=menu <CR>")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- event = "ColorScheme",
    event = "VeryLazy",
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
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'buffers' },
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
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    event = "VeryLazy",
    cmd = "Trouble",
    keys = {
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "CRAG666/code_runner.nvim",
    event = "VeryLazy",
    config = true
  },

  {
    'echasnovski/mini.basics',
    event = "VeryLazy",
    version = false,
    opts = {
      options = {
        basic = false
      },
      mappings = {
        basic = true,
      },
      autocommands = {
        basic = false
      },
    },
  },

  {
    'echasnovski/mini.ai',
    event = "VeryLazy",
    version = false,
    opts = {},
  },

  {
    'echasnovski/mini.surround',
    event = "VeryLazy",
    version = false,
    opts = {}
  },
  {
    'mbbill/undotree',
    keys = {
      { "<leader>ut", ":UndotreeToggle<CR>", desc = "Toggle UndoTree" }
    },
    config = function()
      -- require('undotree').setup({})
    end,
  },
  {
    "leath-dub/snipe.nvim",
    event = "VeryLazy",
    config = function()
      local snipe = require("snipe")
      snipe.setup()
      vim.keymap.set("n", "<leader>b", snipe.create_buffer_menu_toggler())
    end
  },
  {
    'echasnovski/mini.splitjoin',
    event = "VeryLazy",
    version = false,
    opts = {}
  },

}

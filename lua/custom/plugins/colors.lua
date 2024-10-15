return {
  'catppuccin/nvim',
  enabled = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#330000' })
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
    vim.cmd.colorscheme 'catppuccin'
  end,
}
-- {
--   'sainnhe/gruvbox-material',
--   -- lazy = false,
--   event = "VimEnter",
--   priority = 1000,
--   config = function()
--     -- Optionally configure and load the colorscheme
--     -- directly inside the plugin declaration.
--     vim.g.gruvbox_material_enable_italic = 1
--     vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
--     vim.g.gruvbox_material_enable_bold = 1
--     vim.g.gruvbox_material_better_performance = 1
--     vim.cmd.colorscheme('gruvbox-material')
--   end
-- }

-- {
--   "rose-pine/neovim",
--   as = "rose-pine",
--   config = function()
--     require("rose-pine").setup({
--       highlight_groups = {
--         TelescopeBorder = { fg = "highlight_high", bg = "none" },
--         TelescopeNormal = { bg = "none" },
--         TelescopePromptNormal = { bg = "base" },
--         TelescopeResultsNormal = { fg = "subtle", bg = "none" },
--         TelescopeSelection = { fg = "text", bg = "base" },
--         TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
--         StatusLine = { fg = "love", bg = "love", blend = 10 },
--         StatusLineNC = { fg = "subtle", bg = "surface" },
--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" }),
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }),
--         vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#330000" }),
--       },
--     })
--   end
-- }
-- {
--   "scottmckendry/cyberdream.nvim",
--   lazy = false,
--   -- enabled = false,
--   priority = 1000,
--   init = function()
--     vim.cmd.colorscheme("cyberdream")
--   end,
--   opts = {
--     transparent = true,
--     italic_comments = true,
--     hide_fill_chars = true,
--   }
-- }

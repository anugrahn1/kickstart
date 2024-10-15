local M = {}


M.base46 = {
  theme = 'catppuccin',
  transparency = false,
  hl_override = {
    -- Normal = { bg = 'none'},
    -- NormalFloat = { bg = 'none'},
    -- LspReferenceWrite = { bg = LSP_HI},
    -- LspReferenceRead = { bg = LSP_HI},
    -- LspReferenceText = { bg = LSP_HI},
  },
}


M.ui = {
  cmp = {
    style = 'atom',
    format_colors = {
      tailwind = true,
    },
  },
  statusline = { theme = 'vscode_colored' },
  tabufline = { enabled = false },
  -- telescope = { style = 'bordered' },
}

M.colorify = {
  enabled = false
}
return M

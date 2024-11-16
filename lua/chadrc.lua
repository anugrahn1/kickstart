local M = {}

M.base46 = {
  -- theme = 'dark_horizon',
  theme = 'jellybeans',
  transparency = false,
  hl_override = {
    Normal = { bg = '#111111'},
    NormalFloat = { bg = '#111111'},
    -- LspReferenceWrite = { bg = LSP_HI},
    -- LspReferenceRead = { bg = LSP_HI},
    -- LspReferenceText = { bg = LSP_HI},
    ['@comment'] = { italic = true }, -- make comments use italics
    ['@string'] = { fg = '#a6e3a1' }, -- make strings green
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
  enabled = false,
}
return M

local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    TelescopeNormal          = { fg = c.fg_float, bg = c.bg_float },
    TelescopeBorder          = { fg = c.border_highlight, bg = c.bg_float },
    TelescopeTitle           = { fg = c.ui.special, bg = c.bg_float, bold = true },
    TelescopePromptBorder    = { fg = c.border_highlight, bg = c.bg_float },
    TelescopePromptTitle     = { fg = c.syn.constant, bg = c.bg_float, bold = true },
    TelescopePromptPrefix    = { fg = c.syn.constant, bg = c.bg_float },
    TelescopeSelection       = "CursorLine",
    TelescopeSelectionCaret  = "CursorLineNr",
    TelescopeMatching        = { fg = c.syn.fun, bold = true },
    TelescopeResultsComment  = { fg = c.syn.comment },
    TelescopeResultsClass    = "Structure",
    TelescopeResultsStruct   = "Structure",
    TelescopeResultsField    = "@variable.member",
    TelescopeResultsMethod   = "Function",
    TelescopeResultsVariable = "@variable",
  }
end

return M

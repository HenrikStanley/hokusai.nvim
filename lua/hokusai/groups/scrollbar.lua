local M = {}

M.url = "https://github.com/petertriho/nvim-scrollbar"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    ScrollbarError        = { fg = c.diag.error, bg = c.none },
    ScrollbarErrorHandle  = { fg = c.diag.error, bg = c.ui.bg_p2 },
    ScrollbarHandle       = { fg = c.none, bg = c.ui.bg_p2 },
    ScrollbarHint         = { fg = c.diag.hint, bg = c.none },
    ScrollbarHintHandle   = { fg = c.diag.hint, bg = c.ui.bg_p2 },
    ScrollbarInfo         = { fg = c.diag.info, bg = c.none },
    ScrollbarInfoHandle   = { fg = c.diag.info, bg = c.ui.bg_p2 },
    ScrollbarMisc         = { fg = c.accent.violet, bg = c.none },
    ScrollbarMiscHandle   = { fg = c.accent.violet, bg = c.ui.bg_p2 },
    ScrollbarSearch       = { fg = c.accent.orange, bg = c.none },
    ScrollbarSearchHandle = { fg = c.accent.orange, bg = c.ui.bg_p2 },
    ScrollbarWarn         = { fg = c.diag.warning, bg = c.none },
    ScrollbarWarnHandle   = { fg = c.diag.warning, bg = c.ui.bg_p2 },

  }
end

return M

local M = {}

M.url = "https://github.com/echasnovski/mini.tabline"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniTablineCurrent         = { fg = c.ui.fg_dim, bg = opts.transparent and c.none or c.ui.bg_p1, bold = true },
    MiniTablineFill            = "TabLineFill",
    MiniTablineHidden          = { fg = c.ui.special, bg = c.bg_statusline },
    MiniTablineModifiedCurrent = { fg = c.ui.bg_p1, bg = c.ui.fg_dim, bold = true },
    MiniTablineModifiedHidden  = { fg = c.bg_statusline, bg = c.ui.special },
    MiniTablineModifiedVisible = { fg = c.bg_statusline, bg = c.ui.special, bold = true },
    MiniTablineTabpagesection  = { fg = c.ui.fg, bg = c.ui.bg_search, bold = true },
    MiniTablineVisible         = { fg = c.ui.special, bg = c.bg_statusline, bold = true },
  }
end

return M

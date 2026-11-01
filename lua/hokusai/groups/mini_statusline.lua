local M = {}

M.url = "https://github.com/echasnovski/mini.statusline"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local bg_p1 = opts.transparent and c.none or c.ui.bg_p1
  -- stylua: ignore
  return {
    MiniStatuslineDevinfo     = { fg = c.ui.fg_dim, bg = bg_p1 },
    MiniStatuslineFileinfo    = { fg = c.ui.fg_dim, bg = bg_p1 },
    MiniStatuslineFilename    = { fg = c.ui.fg_dim, bg = opts.transparent and c.none or c.ui.bg_dim },
    MiniStatuslineInactive    = "StatusLineNC",
    MiniStatuslineModeCommand = { fg = c.ui.bg, bg = c.syn.operator, bold = true },
    MiniStatuslineModeInsert  = { fg = c.ui.bg, bg = c.diag.ok, bold = true },
    MiniStatuslineModeNormal  = { fg = c.ui.bg_m3, bg = c.syn.fun, bold = true },
    MiniStatuslineModeOther   = { fg = c.ui.bg, bg = c.syn.type, bold = true },
    MiniStatuslineModeReplace = { fg = c.ui.bg, bg = c.syn.constant, bold = true },
    MiniStatuslineModeVisual  = { fg = c.ui.bg, bg = c.syn.keyword, bold = true },
  }
end

return M

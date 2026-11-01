local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LeapMatch          = { bg = c.accent.pink, fg = c.ui.bg_m3, bold = true },
    LeapLabel          = { fg = c.accent.pink, bold = true },
    LeapBackdrop       = { fg = c.ui.nontext },
  }
end

return M

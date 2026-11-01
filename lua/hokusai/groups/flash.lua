local M = {}

M.url = "https://github.com/folke/flash.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    FlashBackdrop = { fg = c.ui.nontext },
    FlashLabel    = { bg = c.accent.pink, bold = true, fg = c.ui.bg_m3 },
  }
end

return M

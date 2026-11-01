local M = {}

M.url = "https://github.com/echasnovski/mini.hipatterns"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniHipatternsFixme = { fg = c.ui.bg, bg = c.diag.error, bold = true },
    MiniHipatternsHack  = { fg = c.ui.bg, bg = c.diag.warning, bold = true },
    MiniHipatternsNote  = { fg = c.ui.bg, bg = c.diag.info, bold = true },
    MiniHipatternsTodo  = { fg = c.ui.bg, bg = c.diag.hint, bold = true },
  }
end

return M

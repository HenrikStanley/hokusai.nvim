local M = {}

M.url = "https://github.com/dense-analysis/ale"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    ALEErrorSign   = { fg = c.diag.error },
    ALEWarningSign = { fg = c.diag.warning },
  }
end

return M

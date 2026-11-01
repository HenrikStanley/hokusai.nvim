local M = {}

M.url = "https://github.com/echasnovski/mini.test"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniTestEmphasis = { bold = true },
    MiniTestFail     = { fg = c.diag.error, bold = true },
    MiniTestPass     = { fg = c.diag.ok, bold = true },
  }
end

return M

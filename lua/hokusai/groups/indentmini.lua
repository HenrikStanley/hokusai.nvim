local M = {}

M.url = "https://github.com/nvimdev/indentmini.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentLine                 = { fg = c.ui.indent, nocombine = true },
    IndentLineCurrent          = { fg = c.ui.indent_active, nocombine = true },
  }
end

return M

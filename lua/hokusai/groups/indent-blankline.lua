local M = {}

M.url = "https://github.com/lukas-reineke/indent-blankline.nvim"

---@type hokusai.HighlightsFn
function M.get(c)
  local indent = { fg = c.ui.indent, nocombine = true }
  local scope = { fg = c.ui.indent_active, nocombine = true }
  -- stylua: ignore
  return {
    IndentBlanklineChar               = indent,
    IndentBlanklineSpaceChar          = indent,
    IndentBlanklineSpaceCharBlankline = indent,
    IndentBlanklineContextChar        = scope,
    IndentBlanklineContextStart       = { sp = c.ui.indent_active, underline = true, nocombine = true },
    IblIndent                         = indent,
    IblWhitespace                     = indent,
    IblScope                          = scope,
  }
end

return M

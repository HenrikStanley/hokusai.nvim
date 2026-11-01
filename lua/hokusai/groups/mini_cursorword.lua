local M = {}

M.url = "https://github.com/echasnovski/mini.cursorword"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniCursorword        = { underline = true },
    MiniCursorwordCurrent = { underline = true },
  }
end

return M

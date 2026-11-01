local M = {}

M.url = "https://github.com/echasnovski/mini.surround"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniSurround = "IncSearch",
  }
end

return M

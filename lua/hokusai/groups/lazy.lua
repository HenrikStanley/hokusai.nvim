local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    LazyProgressDone = { bold = true, fg = c.syn.special1 },
    LazyProgressTodo = { bold = true, fg = c.ui.nontext },
  }
end

return M

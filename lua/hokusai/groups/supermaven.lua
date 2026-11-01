local M = {}

M.url = "https://github.com/supermaven-inc/supermaven-nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    SupermavenSuggestion = { fg = c.ui.nontext },
  }
  return ret
end

return M

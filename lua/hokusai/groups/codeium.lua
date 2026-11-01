local M = {}

M.url = "https://github.com/Exafunction/codeium.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CodeiumSuggestion = { fg = c.ui.nontext },
  }
  return ret
end

return M

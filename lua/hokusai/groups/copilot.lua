local M = {}

M.url = "https://github.com/zbirenbaum/copilot.lua"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CopilotAnnotation = { fg = c.ui.nontext },
    CopilotSuggestion = { fg = c.ui.nontext },
  }
  return ret
end

return M

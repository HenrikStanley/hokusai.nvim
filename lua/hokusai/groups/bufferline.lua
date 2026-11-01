local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    BufferLineIndicatorSelected = { fg = c.vcs.changed },
  }
end

return M

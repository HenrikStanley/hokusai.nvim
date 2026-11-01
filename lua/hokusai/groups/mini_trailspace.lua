local M = {}

M.url = "https://github.com/echasnovski/mini.trailspace"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniTrailspace = { bg = c.vcs.removed },
  }
end

return M

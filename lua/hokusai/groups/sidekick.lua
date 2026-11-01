local M = {}

M.url = "https://github.com/folke/sidekick.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    SidekickDiffContext = "DiffChange",
    SidekickDiffAdd     = "DiffAdd",
    SidekickDiffDelete  = "DiffDelete",
    SidekickSignAdd     = { fg = c.vcs.added },
    SidekickSignChange  = { fg = c.vcs.changed },
    SidekickSignDelete  = { fg = c.vcs.removed },
  }
  return ret
end

return M

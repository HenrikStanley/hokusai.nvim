local M = {}

M.url = "https://github.com/TimUntersberger/neogit"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    NeogitBranch               = { fg = c.syn.keyword },
    NeogitRemote               = { fg = c.syn.keyword },
    NeogitHunkHeader           = { fg = c.syn.fun, bg = c.ui.bg_p1 },
    NeogitHunkHeaderHighlight  = { fg = c.syn.constant, bg = c.diff.change },
    NeogitDiffContextHighlight = { bg = c.diff.change },
    NeogitDiffDeleteHighlight  = { fg = c.vcs.removed, bg = c.diff.delete },
    NeogitDiffAddHighlight     = { fg = c.vcs.added, bg = c.diff.add },
  }
end

return M

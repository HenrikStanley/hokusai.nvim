local M = {}

M.url = "https://github.com/nvim-neotest/neotest"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    NeotestAdapterName  = { fg = c.syn.special3, bold = true },
    NeotestBorder       = { fg = c.border_highlight },
    NeotestDir          = { fg = c.syn.fun },
    NeotestExpandMarker = { fg = c.syn.punct, bold = true },
    NeotestFailed       = { fg = c.diag.error },
    NeotestFile         = { fg = c.syn.fun },
    NeotestFocused      = { bold = true, underline = true },
    NeotestIndent       = { fg = c.ui.special, bold = true },
    NeotestMarked       = { fg = c.diag.warning, italic = true },
    NeotestNamespace    = { fg = c.syn.fun },
    NeotestPassed       = { fg = c.diag.ok },
    NeotestRunning      = { fg = c.vcs.changed },
    NeotestSkipped      = { fg = c.syn.special1 },
    NeotestTarget       = { fg = c.syn.special3 },
    NeotestTest         = { fg = c.fg_float },
    NeotestUnknown      = { fg = c.syn.deprecated },
    NeotestWatching     = { fg = c.vcs.changed },
    NeotestWinSelect    = { fg = c.diag.hint },
  }
end

return M

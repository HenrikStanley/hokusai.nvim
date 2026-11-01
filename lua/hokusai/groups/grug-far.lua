local M = {}

M.url = "https://github.com/MagicDuck/grug-far.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    GrugFarHelpHeader             = { fg = c.syn.comment },
    GrugFarHelpHeaderKey          = { fg = c.accent.cyan },
    GrugFarInputLabel             = { fg = c.accent.cyan },
    GrugFarInputPlaceholder       = { fg = c.ui.nontext },
    GrugFarResultsChangeIndicator = { fg = c.vcs.changed },
    GrugFarResultsHeader          = { fg = c.accent.orange },
    GrugFarResultsLineColumn      = { fg = c.ui.nontext },
    GrugFarResultsLineNo          = { fg = c.ui.nontext },
    GrugFarResultsMatch           = { fg = c.ui.bg_m3, bg = c.accent.red },
    GrugFarResultsStats           = { fg = c.accent.blue },
  }
end

return M

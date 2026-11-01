local M = {}

M.url = "https://github.com/glepnir/lspsaga.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    DefinitionCount            = { fg = c.accent.violet },
    DefinitionIcon             = { fg = c.accent.blue },
    DiagnosticInformation      = "DiagnosticInfo",
    DiagnosticWarning          = "DiagnosticWarn",
    LspFloatWinBorder          = { fg = c.border_highlight },
    LspFloatWinNormal          = { bg = c.bg_float },
    LspSagaBorderTitle         = { fg = c.accent.cyan },
    LspSagaCodeActionBorder    = { fg = c.accent.blue },
    LspSagaCodeActionContent   = { fg = c.accent.violet },
    LspSagaCodeActionTitle     = { fg = c.accent.cyan },
    LspSagaDefPreviewBorder    = { fg = c.accent.green },
    LspSagaFinderSelection     = { fg = c.ui.bg_visual },
    LspSagaHoverBorder         = { fg = c.accent.blue },
    LspSagaRenameBorder        = { fg = c.accent.green },
    LspSagaSignatureHelpBorder = { fg = c.accent.red },
    ReferencesCount            = { fg = c.accent.violet },
    ReferencesIcon             = { fg = c.accent.blue },
    TargetWord                 = { fg = c.accent.cyan },
  }
end

return M

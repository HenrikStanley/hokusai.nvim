local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  local ret = {
    CmpDocumentation       = "NormalFloat",
    CmpDocumentationBorder = "FloatBorder",
    CmpCompletion          = "Pmenu",
    CmpCompletionSel       = "PmenuSel",
    CmpCompletionBorder    = { fg = c.ui.bg_search, bg = c.ui.pmenu.bg },
    CmpCompletionThumb     = "PmenuThumb",
    CmpCompletionSbar      = "PmenuSbar",
    CmpGhostText           = { fg = c.syn.comment },
    CmpItemAbbr            = { fg = c.ui.pmenu.fg, bg = c.none },
    CmpItemAbbrDeprecated  = { fg = c.syn.comment, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch       = { fg = c.syn.fun, bg = c.none },
    CmpItemAbbrMatchFuzzy  = "CmpItemAbbrMatch",
    CmpItemKindCodeium     = { fg = c.syn.string, bg = c.none },
    CmpItemKindCopilot     = { fg = c.syn.string, bg = c.none },
    CmpItemKindSupermaven  = { fg = c.syn.string, bg = c.none },
    CmpItemKindDefault     = { fg = c.ui.fg_dim, bg = c.none },
    CmpItemKindTabNine     = { fg = c.syn.string, bg = c.none },
    CmpItemMenu            = { fg = c.ui.fg_dim, bg = c.none },
  }
  require("hokusai.groups.kinds").kinds(ret, "CmpItemKind%s")
  return ret
end

return M

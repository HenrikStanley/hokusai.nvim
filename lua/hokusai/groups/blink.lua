local M = {}

M.url = "https://github.com/Saghen/blink.cmp"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local bg = opts.transparent and c.none or c.ui.pmenu.bg
  -- stylua: ignore
  local ret = {
    BlinkCmpMenu                = "Pmenu",
    BlinkCmpMenuSelection       = "PmenuSel",
    BlinkCmpMenuBorder          = { fg = c.ui.bg_search, bg = bg },
    BlinkCmpScrollBarThumb      = "PmenuThumb",
    BlinkCmpScrollBarGutter     = "PmenuSbar",
    BlinkCmpLabel               = { fg = c.ui.pmenu.fg, bg = c.none },
    BlinkCmpLabelMatch          = { fg = c.syn.fun, bg = c.none },
    BlinkCmpLabelDetail         = { fg = c.syn.comment, bg = c.none },
    BlinkCmpLabelDescription    = { fg = c.syn.comment, bg = c.none },
    BlinkCmpLabelDeprecated     = { fg = c.syn.comment, bg = c.none, strikethrough = true },
    BlinkCmpGhostText           = { fg = c.syn.comment },
    BlinkCmpSource              = { fg = c.syn.comment },
    BlinkCmpDoc                 = "NormalFloat",
    BlinkCmpDocBorder           = "FloatBorder",
    BlinkCmpDocCursorLine       = "Visual",
    BlinkCmpSignatureHelp       = "NormalFloat",
    BlinkCmpSignatureHelpBorder = "FloatBorder",
    BlinkCmpSignatureHelpActiveParameter = "LspSignatureActiveParameter",
    BlinkCmpKind                = { fg = c.ui.fg_dim, bg = c.none },
    BlinkCmpKindDefault         = { fg = c.ui.fg_dim, bg = c.none },
    BlinkCmpKindCodeium         = { fg = c.syn.string, bg = c.none },
    BlinkCmpKindCopilot         = { fg = c.syn.string, bg = c.none },
    BlinkCmpKindSupermaven      = { fg = c.syn.string, bg = c.none },
    BlinkCmpKindTabNine         = { fg = c.syn.string, bg = c.none },
  }
  require("hokusai.groups.kinds").kinds(ret, "BlinkCmpKind%s")
  return ret
end

return M

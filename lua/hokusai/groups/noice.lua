local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  local ret = {
    NoiceCmdlineIconInput          = { fg = c.accent.yellow },
    NoiceCmdlineIconLua            = { fg = c.accent.cyan },
    NoiceCmdlinePopupBorderInput   = { fg = c.accent.yellow },
    NoiceCmdlinePopupBorderLua     = { fg = c.accent.cyan },
    NoiceCmdlinePopupTitleInput    = { fg = c.accent.yellow },
    NoiceCmdlinePopupTitleLua      = { fg = c.accent.cyan },
    NoiceCompletionItemKindDefault = { fg = c.ui.fg_dim, bg = c.none },
  }
  require("hokusai.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
  return ret
end

return M

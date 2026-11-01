local M = {}

M.url = "https://github.com/echasnovski/mini.icons"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniIconsAzure  = { fg = c.syn.special1 },
    MiniIconsBlue   = { fg = c.syn.fun },
    MiniIconsCyan   = { fg = c.syn.type },
    MiniIconsGreen  = { fg = c.syn.string },
    MiniIconsGrey   = { fg = c.ui.fg },
    MiniIconsOrange = { fg = c.syn.constant },
    MiniIconsPurple = { fg = c.syn.keyword },
    MiniIconsRed    = { fg = c.syn.special3 },
    MiniIconsYellow = { fg = c.syn.identifier },
  }
end

return M

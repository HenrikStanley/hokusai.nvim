local M = {}

M.url = "https://github.com/goolord/alpha-nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    AlphaShortcut    = { fg = c.accent.orange },
    AlphaHeader      = { fg = c.accent.blue },
    AlphaHeaderLabel = { fg = c.accent.orange },
    AlphaFooter      = { fg = c.accent.cyan },
    AlphaButtons     = { fg = c.accent.cyan },
  }
end

return M

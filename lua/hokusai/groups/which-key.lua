local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey          = { fg = c.accent.cyan },
    WhichKeyGroup     = { fg = c.accent.blue },
    WhichKeyDesc      = { fg = c.accent.violet },
    WhichKeySeparator = { fg = c.syn.comment },
    WhichKeyNormal     = { bg = c.bg_sidebar },
    WhichKeyValue     = { fg = c.ui.special },
  }
end

return M

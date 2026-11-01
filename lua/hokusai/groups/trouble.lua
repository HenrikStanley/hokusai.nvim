local M = {}

M.url = "https://github.com/folke/trouble.nvim"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    TroubleText   = { fg = c.ui.fg_dim },
    TroubleCount  = { fg = c.syn.keyword, bg = c.ui.bg_p2 },
    TroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    TroubleIndent = { fg = c.ui.whitespace },
    TroublePos    = { fg = c.ui.special },
  }
end

return M

local M = {}

M.url = "https://github.com/echasnovski/mini.jump"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniJump             = "SpellRare",
    MiniJump2dDim        = "Comment",
    MiniJump2dSpot       = { fg = c.syn.constant, bold = true, nocombine = true },
    MiniJump2dSpotAhead  = { fg = c.diag.hint, bg = c.ui.bg_dim, nocombine = true },
    MiniJump2dSpotUnique = { fg = c.syn.special1, bold = true, nocombine = true },
  }
end

return M

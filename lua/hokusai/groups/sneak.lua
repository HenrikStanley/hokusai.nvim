local M = {}

M.url = "https://github.com/justinmk/vim-sneak"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    Sneak      = { fg = c.ui.bg_m3, bg = c.accent.violet },
    SneakScope = { bg = c.ui.bg_visual },
  }
end

return M

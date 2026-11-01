local M = {}

M.url = "https://github.com/RRethy/vim-illuminate"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    IlluminatedWordRead  = { bg = c.ui.bg_p2 },
    IlluminatedWordText  = { bg = c.ui.bg_p2 },
    IlluminatedWordWrite = { bg = c.ui.bg_p2 },
    illuminatedCurWord   = { bg = c.ui.bg_p2 },
    illuminatedWord      = { bg = c.ui.bg_p2 },
  }
end

return M

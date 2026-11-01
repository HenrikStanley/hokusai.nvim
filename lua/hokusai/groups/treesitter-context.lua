local M = {}

M.url = "https://github.com/nvim-treesitter/nvim-treesitter-context"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    TreesitterContext           = "Folded",
    TreesitterContextLineNumber = { fg = c.ui.special, bg = c.ui.bg_p1 },
  }
end

return M

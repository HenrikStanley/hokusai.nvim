local M = {}

M.url = "https://github.com/SmiteshP/nvim-navic"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    NavicSeparator = { fg = c.ui.fg, bg = c.none },
    NavicText      = { fg = c.ui.fg, bg = c.none },
  }
  require("hokusai.groups.kinds").kinds(ret, "NavicIcons%s")
  return ret
end

return M

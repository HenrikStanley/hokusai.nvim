local Util = require("hokusai.util")

local M = {}

M.url = "https://github.com/phaazon/hop.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    HopNextKey = { fg = c.accent.pink, bold = true },
    HopNextKey1 = { fg = c.accent.teal, bold = true },
    HopNextKey2 = { fg = Util.blend_bg(c.accent.teal, 0.6) },
    HopUnmatched = { fg = c.ui.nontext },
  }
end

return M

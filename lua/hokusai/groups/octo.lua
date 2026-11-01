local Util = require("hokusai.util")

local M = {}

M.url = "https://github.com/pwntester/octo.nvim"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    OctoDetailsLabel          = { fg = c.accent.cyan, bold = true },
    OctoDetailsValue          = "@variable.member",
    OctoDirty                 = { fg = c.accent.orange, bold = true },
    OctoIssueTitle            = { fg = c.accent.violet, bold = true },
    OctoStateChangesRequested = "DiagnosticVirtualTextWarn",
    OctoStateClosed           = "DiagnosticVirtualTextError",
    OctoStateMerged           = { bg = Util.blend_bg(c.accent.violet, 0.1), fg = c.accent.violet },
    OctoStateOpen             = "DiagnosticVirtualTextHint",
    OctoStatePending          = "DiagnosticVirtualTextWarn",
    OctoStatusColumn          = { fg = c.accent.cyan },

  }
end

return M

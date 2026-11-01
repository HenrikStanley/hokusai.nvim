local M = {}

M.url = "https://github.com/stevearc/aerial.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    AerialNormal = { fg = c.ui.fg, bg = c.none },
    AerialGuide  = { fg = c.ui.nontext },
    AerialLine   = "LspInlayHint",
  }
  require("hokusai.groups.kinds").kinds(ret, "Aerial%sIcon")
  return ret
end

return M

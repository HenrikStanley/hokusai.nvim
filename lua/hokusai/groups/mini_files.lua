local M = {}

M.url = "https://github.com/echasnovski/mini.files"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniFilesBorder         = "FloatBorder",
    MiniFilesBorderModified = "DiagnosticFloatingWarn",
    MiniFilesCursorLine     = "CursorLine",
    MiniFilesDirectory      = "Directory",
    MiniFilesFile           = { fg = c.ui.fg },
    MiniFilesNormal         = "NormalFloat",
    MiniFilesTitle          = { fg = c.ui.special, bg = c.bg_float, bold = true },
    MiniFilesTitleFocused   = { fg = c.ui.fg, bg = c.bg_float, bold = true },
  }
end

return M

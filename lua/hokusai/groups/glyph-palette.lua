local M = {}

M.url = "https://github.com/lambdalisue/glyph-palette.vim"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    GlyphPalette1 = { fg = c.diag.error },
    GlyphPalette2 = { fg = c.accent.green },
    GlyphPalette3 = { fg = c.accent.yellow },
    GlyphPalette4 = { fg = c.accent.blue },
    GlyphPalette6 = { fg = c.accent.aqua },
    GlyphPalette7 = { fg = c.ui.fg },
    GlyphPalette9 = { fg = c.accent.red },
  }
end

return M

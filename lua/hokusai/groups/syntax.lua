local M = {}

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local syn = c.syn
  local minimal = opts.minimal

  ---@param hl hokusai.Highlight
  ---@param style? vim.api.keyset.highlight
  local function styled(hl, style)
    hl.style = style
    return hl
  end

  -- stylua: ignore
  return {
    Comment        = styled({ fg = syn.comment }, opts.styles.comments), -- any comment
    Constant       = { fg = minimal and c.ui.fg or syn.constant }, -- (preferred) any constant
    String         = { fg = syn.string }, --   a string constant: "this is a string"
    Character      = "String", --  a character constant: 'c', '\n'
    Number         = { fg = syn.number }, --   a number constant: 234, 0xff
    Boolean        = { fg = minimal and c.ui.fg or syn.constant, bold = not minimal }, --  a boolean constant: TRUE, false
    Float          = "Number", --    a floating point constant: 2.3e10

    Identifier     = styled({ fg = minimal and c.ui.fg or syn.identifier }, opts.styles.variables), -- (preferred) any variable name
    Function       = styled({ fg = syn.fun }, opts.styles.functions), -- function name (also: methods for classes)

    Statement      = { fg = minimal and syn.operator or syn.statement }, -- (preferred) any statement
    Operator       = { fg = minimal and syn.special1 or syn.operator }, -- "sizeof", "+", "*", etc.
    Keyword        = styled({ fg = minimal and syn.operator or syn.keyword }, opts.styles.keywords), --  any other keyword
    Exception      = { fg = syn.special2 }, --  try, catch, throw

    PreProc        = { fg = minimal and syn.operator or syn.preproc }, -- (preferred) generic Preprocessor

    Type           = styled({ fg = syn.type }, opts.styles.types), -- (preferred) int, long, char, etc.

    Special        = { fg = syn.special1 }, -- (preferred) any special symbol
    Delimiter      = { fg = minimal and syn.operator or syn.punct }, --  character that needs attention
    Debug          = { fg = syn.special3 }, --    debugging statements

    Underlined     = { fg = syn.special1, underline = true }, -- (preferred) text that stands out, HTML links
    Bold           = { bold = true }, -- (preferred) any bold text
    Italic         = { italic = true }, -- (preferred) any italic text
    Ignore         = "NonText", -- (preferred) left blank, hidden

    Error          = { fg = c.diag.error }, -- (preferred) any erroneous construct
    Todo           = { fg = c.ui.fg_reverse, bg = c.diag.info, bold = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    dosIniLabel    = "@property",
    htmlH1         = { fg = syn.keyword, bold = true },
    htmlH2         = { fg = syn.fun, bold = true },

    markdownCode      = { fg = syn.string },
    markdownCodeBlock = { fg = syn.string },
    markdownEscape    = { fg = c.none },
  }
end

return M

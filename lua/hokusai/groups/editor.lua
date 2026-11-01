local Util = require("hokusai.util")

local M = {}

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local ui = c.ui
  local transparent = opts.transparent
  local bg = transparent and c.none or ui.bg
  local bg_gutter = transparent and c.none or ui.bg_gutter

  -- stylua: ignore
  return {
    ColorColumn                 = { bg = ui.bg_p1 }, -- used for the columns set with 'colorcolumn'
    Conceal                     = { fg = ui.special, bold = true }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    CurSearch                   = { fg = ui.fg, bg = ui.bg_search, bold = true }, -- search pattern under the cursor
    Cursor                      = { fg = ui.cursor_fg, bg = ui.cursor_bg }, -- character under the cursor
    lCursor                     = "Cursor", -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM                    = "Cursor", -- like Cursor, but used when in IME mode |CursorIM|
    TermCursor                  = "Cursor",
    CursorColumn                = "CursorLine", -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine                  = { bg = ui.bg_p2 }, -- Screen-line at the cursor, when 'cursorline' is set.
    Directory                   = { fg = c.syn.fun }, -- directory names (and other special names in listings)
    DiffAdd                     = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange                  = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete                  = { fg = c.vcs.removed, bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText                    = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer                 = { fg = ui.bg }, -- filler lines (~) after the end of the buffer.
    ErrorMsg                    = { fg = c.diag.error }, -- error messages on the command line
    WinSeparator                = { fg = c.border, bg = opts.dim_inactive and not transparent and ui.bg_dim or c.none }, -- the column separating vertically split windows
    VertSplit                   = "WinSeparator",
    Folded                      = { fg = ui.special, bg = ui.bg_p1 }, -- line used for closed folds
    FoldColumn                  = { fg = ui.nontext, bg = bg_gutter }, -- 'foldcolumn'
    SignColumn                  = { fg = ui.special, bg = bg_gutter }, -- column where |signs| are displayed
    SignColumnSB                = { fg = ui.special, bg = c.bg_sidebar }, -- column where |signs| are displayed in sidebars
    IncSearch                   = { fg = ui.fg_reverse, bg = c.diag.warning }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute                  = { fg = ui.fg, bg = c.vcs.removed }, -- |:substitute| replacement text highlighting
    LineNr                      = { fg = ui.linenr, bg = bg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove                 = "LineNr",
    LineNrBelow                 = "LineNr",
    CursorLineNr                = { fg = ui.linenr_active, bg = bg_gutter, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen                  = { fg = c.diag.warning, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg                     = { fg = c.diag.warning, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea                     = vim.o.cmdheight == 0 and "StatusLine" or { fg = ui.fg_dim }, -- Area for messages and cmdline
    MsgSeparator                = { fg = ui.bg_m3, bg = vim.o.cmdheight == 0 and ui.bg or ui.bg_m3 }, -- Separator for scrolled messages
    MoreMsg                     = { fg = c.diag.info }, -- |more-prompt|
    NonText                     = { fg = ui.nontext }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text
    Normal                      = { fg = ui.fg, bg = bg }, -- normal text
    NormalNC                    = opts.dim_inactive and { fg = ui.fg_dim, bg = transparent and c.none or ui.bg_dim } or { fg = ui.fg, bg = bg }, -- normal text in non-current windows
    NormalSB                    = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
    NormalFloat                 = { fg = c.fg_float, bg = c.bg_float }, -- Normal text in floating windows.
    FloatBorder                 = { fg = c.border_highlight, bg = c.bg_float },
    FloatTitle                  = { fg = ui.special, bg = c.bg_float, bold = true },
    FloatFooter                 = { fg = ui.nontext, bg = c.bg_float },
    Pmenu                       = { fg = ui.pmenu.fg, bg = transparent and c.none or ui.pmenu.bg }, -- Popup menu: normal item.
    PmenuSel                    = { fg = ui.pmenu.fg_sel, bg = ui.pmenu.bg_sel }, -- Popup menu: selected item.
    PmenuKind                   = { fg = ui.fg_dim, bg = transparent and c.none or ui.pmenu.bg }, -- Popup menu: "kind" of a normal item.
    PmenuKindSel                = { fg = ui.fg_dim, bg = ui.pmenu.bg_sel }, -- Popup menu: "kind" of a selected item.
    PmenuExtra                  = { fg = ui.special, bg = transparent and c.none or ui.pmenu.bg }, -- Popup menu: "extra text" of a normal item.
    PmenuExtraSel               = { fg = ui.special, bg = ui.pmenu.bg_sel }, -- Popup menu: "extra text" of a selected item.
    PmenuMatch                  = { fg = c.syn.fun, bg = transparent and c.none or ui.pmenu.bg }, -- Popup menu: Matched text in normal item.
    PmenuMatchSel               = { fg = c.syn.fun, bg = ui.pmenu.bg_sel }, -- Popup menu: Matched text in selected item.
    PmenuSbar                   = { bg = transparent and c.none or ui.pmenu.bg_sbar }, -- Popup menu: scrollbar.
    PmenuThumb                  = { bg = ui.pmenu.bg_thumb }, -- Popup menu: Thumb of the scrollbar.
    PmenuBorder                 = "FloatBorder",
    Question                    = "MoreMsg", -- |hit-enter| prompt and yes/no questions
    QuickFixLine                = { bg = transparent and c.none or ui.bg_p1 }, -- Current |quickfix| item in the quickfix window.
    Search                      = { fg = ui.fg, bg = ui.bg_search }, -- Last search pattern highlighting (see 'hlsearch').
    SpecialKey                  = { fg = ui.special }, -- Unprintable characters: text displayed differently from what it really is.
    SpellBad                    = { sp = c.diag.error, undercurl = true }, -- Word that is not recognized by the spellchecker.
    SpellCap                    = { sp = c.diag.warning, undercurl = true }, -- Word that should start with a capital.
    SpellLocal                  = { sp = c.diag.warning, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region.
    SpellRare                   = { sp = c.diag.warning, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.
    StatusLine                  = { fg = ui.fg_dim, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC                = { fg = ui.nontext, bg = c.bg_statusline }, -- status lines of not-current windows
    TabLine                     = { fg = ui.special, bg = c.bg_statusline }, -- tab pages line, not active tab page label
    TabLineFill                 = { bg = bg }, -- tab pages line, where there are no labels
    TabLineSel                  = { fg = ui.fg_dim, bg = transparent and c.none or ui.bg_p1, bold = true }, -- tab pages line, active tab page label
    Title                       = { fg = c.syn.fun, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual                      = { bg = ui.bg_visual }, -- Visual mode selection
    VisualNOS                   = "Visual", -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg                  = { fg = c.diag.warning }, -- warning messages
    Whitespace                  = { fg = ui.whitespace }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu                    = "Pmenu", -- current match in 'wildmenu' completion
    WinBar                      = { fg = ui.fg_dim, bg = c.none }, -- window bar
    WinBarNC                    = { fg = ui.fg_dim, bg = opts.dim_inactive and not transparent and ui.bg_dim or c.none }, -- window bar in inactive windows

    debugPC                     = { bg = c.diff.delete }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint             = { fg = c.syn.special1, bg = bg_gutter }, -- used for breakpoint colors in terminal-debug

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own.
    LspReferenceText            = { bg = ui.bg_reference }, -- used for highlighting "text" references
    LspReferenceRead            = "LspReferenceText", -- used for highlighting "read" references
    LspReferenceWrite           = { bg = ui.bg_reference, underline = true }, -- used for highlighting "write" references
    LspReferenceTarget          = "LspReferenceText",
    LspSignatureActiveParameter = { fg = c.diag.warning },
    LspCodeLens                 = { fg = c.syn.comment },
    LspCodeLensSeparator        = { fg = ui.nontext },
    LspInlayHint                = { fg = ui.special, bg = transparent and c.none or Util.blend_bg(ui.bg_p1, 0.6) },
    LspInfoBorder               = "FloatBorder",
    ComplHint                   = { fg = ui.nontext },

    -- diagnostics
    DiagnosticError             = { fg = c.diag.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn              = { fg = c.diag.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo              = { fg = c.diag.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint              = { fg = c.diag.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticOk                = { fg = c.diag.ok },
    DiagnosticUnnecessary       = { fg = ui.nontext }, -- Used for unused code
    DiagnosticDeprecated        = { fg = c.syn.deprecated, strikethrough = true },
    DiagnosticFloatingError     = { fg = c.diag.error },
    DiagnosticFloatingWarn      = { fg = c.diag.warning },
    DiagnosticFloatingInfo      = { fg = c.diag.info },
    DiagnosticFloatingHint      = { fg = c.diag.hint },
    DiagnosticFloatingOk        = { fg = c.diag.ok },
    DiagnosticSignError         = { fg = c.diag.error, bg = bg_gutter },
    DiagnosticSignWarn          = { fg = c.diag.warning, bg = bg_gutter },
    DiagnosticSignInfo          = { fg = c.diag.info, bg = bg_gutter },
    DiagnosticSignHint          = { fg = c.diag.hint, bg = bg_gutter },
    DiagnosticVirtualTextError  = "DiagnosticError", -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn   = "DiagnosticWarn", -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo   = "DiagnosticInfo", -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint   = "DiagnosticHint", -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError    = { undercurl = true, sp = c.diag.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn     = { undercurl = true, sp = c.diag.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo     = { undercurl = true, sp = c.diag.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint     = { undercurl = true, sp = c.diag.hint }, -- Used to underline "Hint" diagnostics

    -- Health
    healthError                 = { fg = c.diag.error },
    healthSuccess               = { fg = c.diag.ok },
    healthWarning               = { fg = c.diag.warning },

    -- diff
    diffAdded                   = { fg = c.vcs.added },
    diffRemoved                 = { fg = c.vcs.removed },
    diffDeleted                 = { fg = c.vcs.removed },
    diffChanged                 = { fg = c.vcs.changed },
    diffOldFile                 = { fg = c.vcs.removed },
    diffNewFile                 = { fg = c.vcs.added },
    diffFile                    = { fg = c.syn.fun },
    diffLine                    = { fg = c.syn.comment },
    diffIndexLine               = { fg = c.syn.keyword },

    -- help / quickfix
    helpCommand                 = { fg = c.syn.string, bg = ui.bg_p1 },
    helpExample                 = { fg = c.syn.comment },
    qfFileName                  = "Directory",
    qfLineNr                    = "LineNr",
  }
end

return M

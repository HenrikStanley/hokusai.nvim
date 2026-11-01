---@class hokusai.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias hokusai.Highlights table<string,hokusai.Highlight|string>

---@alias hokusai.HighlightsFn fun(colors: ColorScheme, opts:hokusai.Config):hokusai.Highlights

---@class hokusai.Cache
---@field groups hokusai.Highlights
---@field inputs table

---@alias hokusai.VariantFn fun(palette: hokusai.Palette, saturated: hokusai.Palette): hokusai.Variant

---@class hokusai.Variant
---@field meta hokusai.VariantMeta
---@field ui hokusai.UiColors
---@field syn hokusai.SyntaxColors
---@field diag hokusai.DiagnosticColors
---@field diff hokusai.DiffColors
---@field vcs hokusai.VcsColors
---@field accent hokusai.AccentColors
---@field term string[] 16 ANSI colors + 2 extended colors

---@class hokusai.VariantMeta
---@field name string
---@field flavor "kanagawa"|"kanso"
---@field background "dark"|"light"
---@field ui "dark"|"normal" default style for sidebars and floats

---@class hokusai.UiColors
---@field fg string Default foreground
---@field fg_dim string Dimmed foreground
---@field fg_reverse string Foreground on bright backgrounds
---@field bg_dim string Dimmed background (NormalNC)
---@field bg_gutter string {Sign,Fold}Column, LineNr background
---@field bg_m3 string Darkest background
---@field bg_m2 string
---@field bg_m1 string
---@field bg string Default background
---@field bg_p1 string Lighter background: ColorColumn, Folded
---@field bg_p2 string Lighter background: CursorLine, selections
---@field special string SpecialKey, Conceal, titles
---@field nontext string NonText
---@field whitespace string Whitespace
---@field indent string Indent guides
---@field indent_active string Active indent scope
---@field border string Window separators
---@field bg_search string
---@field bg_visual string
---@field bg_reference string LSP references
---@field bg_statusline string
---@field linenr string
---@field linenr_active string
---@field cursor_fg string
---@field cursor_bg string
---@field pmenu hokusai.MenuColors
---@field float hokusai.FloatColors
---@field statusline hokusai.StatuslineColors

---@class hokusai.MenuColors
---@field fg string
---@field fg_sel string
---@field bg string
---@field bg_sel string
---@field bg_sbar string
---@field bg_thumb string

---@class hokusai.FloatColors
---@field fg string
---@field bg string
---@field fg_border string
---@field bg_border string

---@class hokusai.StatuslineColors
---@field a {fg:string, bg:string} mode section in normal mode
---@field b {fg:string, bg:string} second section in normal mode
---@field c {fg:string, bg:string} middle section
---@field mode_b string background of the second section in other modes
---@field inactive string background of inactive statuslines

---@class hokusai.SyntaxColors
---@field string string
---@field variable string
---@field number string
---@field constant string
---@field identifier string
---@field parameter string
---@field fun string
---@field statement string
---@field keyword string
---@field operator string
---@field preproc string
---@field type string
---@field regex string
---@field deprecated string
---@field comment string
---@field punct string
---@field special1 string
---@field special2 string
---@field special3 string

---@class hokusai.DiagnosticColors
---@field ok string
---@field error string
---@field warning string
---@field info string
---@field hint string

---@class hokusai.DiffColors
---@field add string
---@field delete string
---@field change string
---@field text string

---@class hokusai.VcsColors
---@field added string
---@field removed string
---@field changed string
---@field untracked string

---@class hokusai.AccentColors
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field aqua string
---@field teal string
---@field cyan string
---@field blue string
---@field violet string
---@field pink string

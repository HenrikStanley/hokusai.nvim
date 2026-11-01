local Util = require("hokusai.util")

local M = {}

M.url = "https://github.com/folke/snacks.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    SnacksNotifierDebug       = { fg = c.fg_float, bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierBorderDebug = { fg = Util.blend_bg(c.syn.comment, 0.4), bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierIconDebug   = { fg = c.syn.comment },
    SnacksNotifierTitleDebug  = { fg = c.syn.comment },
    SnacksNotifierError       = { fg = c.fg_float, bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierBorderError = { fg = Util.blend_bg(c.diag.error, 0.4), bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierIconError   = { fg = c.diag.error },
    SnacksNotifierTitleError  = { fg = c.diag.error },
    SnacksNotifierInfo        = { fg = c.fg_float, bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierBorderInfo  = { fg = Util.blend_bg(c.diag.info, 0.4), bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierIconInfo    = { fg = c.diag.info },
    SnacksNotifierTitleInfo   = { fg = c.diag.info },
    SnacksNotifierTrace       = { fg = c.fg_float, bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierBorderTrace = { fg = Util.blend_bg(c.accent.violet, 0.4), bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierIconTrace   = { fg = c.accent.violet },
    SnacksNotifierTitleTrace  = { fg = c.accent.violet },
    SnacksNotifierWarn        = { fg = c.fg_float, bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierBorderWarn  = { fg = Util.blend_bg(c.diag.warning, 0.4), bg = opts.transparent and c.none or c.bg_float },
    SnacksNotifierIconWarn    = { fg = c.diag.warning },
    SnacksNotifierTitleWarn   = { fg = c.diag.warning },
    -- Dashboard
    SnacksDashboardDesc       = { fg = c.accent.cyan },
    SnacksDashboardFooter     = { fg = c.accent.cyan },
    SnacksDashboardHeader     = { fg = c.accent.blue },
    SnacksDashboardIcon       = { fg = c.accent.cyan },
    SnacksDashboardKey        = { fg = c.accent.orange },
    SnacksDashboardSpecial    = { fg = c.accent.violet },
    SnacksDashboardDir        = { fg = c.ui.nontext },
    -- Profiler
    SnacksProfilerIconInfo    = { bg = Util.blend_bg(c.accent.cyan, 0.3), fg = c.accent.cyan },
    SnacksProfilerBadgeInfo   = { bg = Util.blend_bg(c.accent.cyan, 0.1), fg = c.accent.cyan },
    SnacksFooterKey           = "SnacksProfilerIconInfo",
    SnacksFooterDesc          = "SnacksProfilerBadgeInfo",
    SnacksProfilerIconTrace   = { bg = Util.blend_bg(c.ui.bg_visual, 0.3), fg = c.ui.nontext },
    SnacksProfilerBadgeTrace  = { bg = Util.blend_bg(c.ui.bg_visual, 0.1), fg = c.ui.nontext },
    SnacksIndent              = { fg = c.ui.indent, nocombine = true },
    SnacksIndentChunk         = { fg = c.ui.indent_active, nocombine = true },
    SnacksIndentScope         = { fg = c.ui.indent_active, nocombine = true },
    SnacksZenIcon             = { fg = c.accent.violet },
    SnacksInputIcon           = { fg = c.accent.cyan },
    SnacksInputBorder         = { fg = c.accent.yellow },
    SnacksInputTitle          = { fg = c.accent.yellow },
    -- Picker
    SnacksPickerInputBorder   = { fg = c.accent.orange, bg = c.bg_float },
    SnacksPickerInputTitle    = { fg = c.accent.orange, bg = c.bg_float },
    SnacksPickerBoxTitle      = { fg = c.accent.orange, bg = c.bg_float },
    SnacksPickerSelected      = { fg = c.accent.pink },
    SnacksPickerListCursorLine = "CursorLine",
    SnacksPickerToggle        = "SnacksProfilerBadgeInfo",
    SnacksPickerPickWinCurrent= { fg = c.ui.bg_m3, bg = c.accent.pink, bold = true },
    SnacksPickerPickWin       = { fg = c.ui.fg, bg = c.ui.bg_search, bold = true },
    SnacksGhLabel             = { fg = c.accent.cyan, bold = true },
    SnacksDiffLabel           = { fg = c.accent.cyan, bold = true },
    SnacksGhDiffHeader        = { bg = Util.blend_bg(c.accent.cyan, 0.1), fg = c.accent.cyan }
  }
  for i, color in ipairs(c.rainbow) do
    ret["SnacksIndent" .. i] = { fg = color, nocombine = true }
  end
  return ret
end

return M

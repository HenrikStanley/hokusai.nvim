local Util = require("hokusai.util")

local M = {}

M.url = "https://github.com/romgrk/barbar.nvim"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    BufferAlternate        = { bg = c.ui.bg_p2, fg = c.ui.fg },
    BufferAlternateADDED   = { bg = c.ui.bg_p2, fg = c.vcs.added },
    BufferAlternateCHANGED = { bg = c.ui.bg_p2, fg = c.vcs.changed },
    BufferAlternateDELETED = { bg = c.ui.bg_p2, fg = c.vcs.removed },
    BufferAlternateERROR   = { bg = c.ui.bg_p2, fg = c.diag.error },
    BufferAlternateHINT    = { bg = c.ui.bg_p2, fg = c.diag.hint },
    BufferAlternateINFO    = { bg = c.ui.bg_p2, fg = c.diag.info },
    BufferAlternateIndex   = { bg = c.ui.bg_p2, fg = c.diag.info },
    BufferAlternateMod     = { bg = c.ui.bg_p2, fg = c.diag.warning },
    BufferAlternateSign    = { bg = c.ui.bg_p2, fg = c.diag.info },
    BufferAlternateTarget  = { bg = c.ui.bg_p2, fg = c.accent.red },
    BufferAlternateWARN    = { bg = c.ui.bg_p2, fg = c.diag.warning },
    BufferCurrent          = { bg = c.ui.bg, fg = c.ui.fg },
    BufferCurrentADDED     = { bg = c.ui.bg, fg = c.vcs.added },
    BufferCurrentCHANGED   = { bg = c.ui.bg, fg = c.vcs.changed },
    BufferCurrentDELETED   = { bg = c.ui.bg, fg = c.vcs.removed },
    BufferCurrentERROR     = { bg = c.ui.bg, fg = c.diag.error },
    BufferCurrentHINT      = { bg = c.ui.bg, fg = c.diag.hint },
    BufferCurrentINFO      = { bg = c.ui.bg, fg = c.diag.info },
    BufferCurrentIndex     = { bg = c.ui.bg, fg = c.diag.info },
    BufferCurrentMod       = { bg = c.ui.bg, fg = c.diag.warning },
    BufferCurrentSign      = { bg = c.ui.bg, fg = c.ui.bg },
    BufferCurrentTarget    = { bg = c.ui.bg, fg = c.accent.red },
    BufferCurrentWARN      = { bg = c.ui.bg, fg = c.diag.warning },
    BufferInactive         = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = Util.blend_bg(c.ui.special, 0.8) },
    BufferInactiveADDED    = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = Util.blend_bg(c.vcs.added, 0.8) },
    BufferInactiveCHANGED  = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = Util.blend_bg(c.vcs.changed, 0.8) },
    BufferInactiveDELETED  = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = Util.blend_bg(c.vcs.removed, 0.8) },
    BufferInactiveERROR    = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = Util.blend_bg(c.diag.error, 0.8) },
    BufferInactiveHINT     = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = Util.blend_bg(c.diag.hint, 0.8) },
    BufferInactiveINFO     = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = Util.blend_bg(c.diag.info, 0.8) },
    BufferInactiveIndex    = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = c.ui.special },
    BufferInactiveMod      = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = Util.blend_bg(c.diag.warning, 0.8) },
    BufferInactiveSign     = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = c.ui.bg },
    BufferInactiveTarget   = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = c.accent.red },
    BufferInactiveWARN     = { bg = Util.blend_bg(c.ui.bg_p2, 0.4), fg = Util.blend_bg(c.diag.warning, 0.8) },
    BufferOffset           = { bg = c.bg_statusline, fg = c.ui.special },
    BufferTabpageFill      = { bg = Util.blend_bg(c.ui.bg_p2, 0.8), fg = c.ui.special },
    BufferTabpages         = { bg = c.bg_statusline, fg = c.none },
    BufferVisible          = { bg = c.bg_statusline, fg = c.ui.fg },
    BufferVisibleADDED     = { bg = c.bg_statusline, fg = c.vcs.added },
    BufferVisibleCHANGED   = { bg = c.bg_statusline, fg = c.vcs.changed },
    BufferVisibleDELETED   = { bg = c.bg_statusline, fg = c.vcs.removed },
    BufferVisibleERROR     = { bg = c.bg_statusline, fg = c.diag.error },
    BufferVisibleHINT      = { bg = c.bg_statusline, fg = c.diag.hint },
    BufferVisibleINFO      = { bg = c.bg_statusline, fg = c.diag.info },
    BufferVisibleIndex     = { bg = c.bg_statusline, fg = c.diag.info },
    BufferVisibleMod       = { bg = c.bg_statusline, fg = c.diag.warning },
    BufferVisibleSign      = { bg = c.bg_statusline, fg = c.diag.info },
    BufferVisibleTarget    = { bg = c.bg_statusline, fg = c.accent.red },
    BufferVisibleWARN      = { bg = c.bg_statusline, fg = c.diag.warning },
  }
end

return M

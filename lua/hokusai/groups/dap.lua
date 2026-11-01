local Util = require("hokusai.util")

local M = {}

M.url = "https://github.com/mfussenegger/nvim-dap"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    DapStoppedLine               = { bg = Util.blend_bg(c.diag.warning, 0.1) },
    DapBreakpoint                = { fg = c.diag.error },
    DapBreakpointCondition       = { fg = c.diag.warning },
    DapBreakpointRejected        = { fg = c.syn.comment },
    DapLogPoint                  = { fg = c.diag.info },
    DapStopped                   = { fg = c.diag.warning },

    -- nvim-dap-ui
    DapUIScope                   = "Special",
    DapUIType                    = "Type",
    DapUIModifiedValue           = { fg = c.syn.special1, bold = true },
    DapUIDecoration              = { fg = c.border_highlight },
    DapUIThread                  = { fg = c.syn.identifier },
    DapUIStoppedThread           = { fg = c.syn.special1 },
    DapUISource                  = { fg = c.syn.special2 },
    DapUILineNumber              = { fg = c.syn.special1 },
    DapUIFloatBorder             = { fg = c.border_highlight },
    DapUIWatchesEmpty            = { fg = c.diag.error },
    DapUIWatchesValue            = { fg = c.syn.identifier },
    DapUIWatchesError            = { fg = c.diag.error },
    DapUIBreakpointsPath         = "Directory",
    DapUIBreakpointsInfo         = { fg = c.diag.info },
    DapUIBreakpointsCurrentLine  = { fg = c.syn.identifier, bold = true },
    DapUIBreakpointsDisabledLine = "Comment",
    DapUIStepOver                = { fg = c.syn.special1 },
    DapUIStepInto                = { fg = c.syn.special1 },
    DapUIStepBack                = { fg = c.syn.special1 },
    DapUIStepOut                 = { fg = c.syn.special1 },
    DapUIStop                    = { fg = c.diag.error },
    DapUIPlayPause               = { fg = c.syn.string },
    DapUIRestart                 = { fg = c.syn.string },
    DapUIUnavailable             = { fg = c.syn.comment },
  }
end

return M

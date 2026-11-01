local M = {}

M.url = "https://github.com/nvimdev/dashboard-nvim"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    -- General
    DashboardHeader           = { fg = c.vcs.removed },
    DashboardFooter           = { fg = c.syn.comment },
    DashboardCenter           = { fg = c.syn.identifier },
    -- Hyper theme
    DashboardProjectTitle     = { fg = c.syn.fun },
    DashboardProjectTitleIcon = { fg = c.syn.constant },
    DashboardProjectIcon      = { fg = c.syn.identifier },
    DashboardMruTitle         = { fg = c.syn.fun },
    DashboardMruIcon          = { fg = c.syn.keyword },
    DashboardFiles            = { fg = c.ui.fg },
    DashboardShortCutIcon     = { fg = c.syn.keyword },
    -- Doom theme
    DashboardDesc             = { fg = c.syn.identifier },
    DashboardKey              = { fg = c.syn.special1 },
    DashboardIcon             = { fg = c.ui.special },
    DashboardShortCut         = { fg = c.syn.special1 },
  }
end

return M

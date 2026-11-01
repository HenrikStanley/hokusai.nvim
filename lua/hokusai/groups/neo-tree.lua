local Util = require("hokusai.util")

local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local transparent = opts.styles.sidebars == "transparent"
  local inactive = transparent and c.none
    or Util.blend(c.bg_sidebar, 0.8, c.background == "light" and c.ui.fg or "#000000")
  -- stylua: ignore
  return {
    NeoTreeNormal               = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NeoTreeNormalNC             = "NeoTreeNormal",
    NeoTreeFileName             = { fg = c.fg_sidebar },
    NeoTreeRootName             = { fg = c.syn.identifier, bold = true },
    NeoTreeModified             = { fg = c.vcs.changed },
    NeoTreeTitleBar             = { fg = c.ui.fg_reverse, bg = c.syn.fun, bold = true },
    NeoTreeDimText              = { fg = c.ui.nontext },
    NeoTreeIndentMarker         = "NonText",
    NeoTreeGitModified          = { fg = c.vcs.changed },
    NeoTreeGitAdded             = { fg = c.vcs.added },
    NeoTreeGitDeleted           = { fg = c.vcs.removed },
    NeoTreeGitStaged            = { fg = c.vcs.added },
    NeoTreeGitConflict          = { fg = c.diag.error },
    NeoTreeGitUntracked         = { fg = c.vcs.untracked },
    NeoTreeGitUnstaged          = { fg = c.vcs.changed },
    NeoTreeTabActive            = { fg = c.ui.fg_dim, bg = transparent and c.none or c.ui.bg_p1, bold = true },
    NeoTreeTabInactive          = { fg = c.ui.special, bg = inactive },
    NeoTreeTabSeparatorActive   = { fg = c.ui.fg_dim, bg = transparent and c.none or c.ui.bg_p1 },
    NeoTreeTabSeparatorInactive = { fg = c.ui.special, bg = inactive },
  }
end

return M

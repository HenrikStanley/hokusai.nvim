local M = {}

M.url = "https://github.com/kyazdani42/nvim-tree.lua"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NvimTreeNormal       = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NvimTreeNormalNC     = "NvimTreeNormal",
    NvimTreeWinSeparator = { fg = opts.styles.sidebars == "transparent" and c.border or c.bg_sidebar, bg = c.bg_sidebar },
    NvimTreeRootFolder   = { fg = c.syn.identifier, bold = true },
    NvimTreeFolderName   = "Directory",
    NvimTreeFolderIcon   = { fg = c.syn.fun, bg = c.none },
    NvimTreeIndentMarker = { fg = c.ui.nontext },
    NvimTreeGitDirty     = { fg = c.vcs.changed },
    NvimTreeGitNew       = { fg = c.vcs.added },
    NvimTreeGitDeleted   = { fg = c.vcs.removed },
    NvimTreeGitStaged    = { fg = c.vcs.added },
    NvimTreeSpecialFile  = { fg = c.syn.special1 },
    NvimTreeImageFile    = { fg = c.syn.special2 },
    NvimTreeSymlink      = "Type",
    NvimTreeExecFile     = { fg = c.syn.string, bold = true },
    NvimTreeOpenedFile   = { fg = c.syn.special1, italic = true },
    NvimTreeWindowPicker = { fg = c.syn.special1, bg = c.ui.bg_m1, bold = true },
  }
end

return M

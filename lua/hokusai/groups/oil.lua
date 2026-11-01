local M = {}

M.url = "https://github.com/stevearc/oil.nvim"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    OilEmpty                  = { fg = c.ui.nontext },
    OilHidden                 = { fg = c.syn.comment },
    OilDir                    = "Directory",
    OilDirIcon                = "Directory",
    OilDirHidden              = { fg = c.syn.comment, italic = true },
    OilFile                   = { fg = c.ui.fg },
    OilFileHidden             = "OilHidden",
    OilSocket                 = { fg = c.syn.keyword },
    OilSocketHidden           = "OilHidden",
    OilLink                   = { fg = c.syn.type },
    OilLinkHidden             = "OilHidden",
    OilLinkTarget             = { fg = c.syn.comment, italic = true },
    OilLinkTargetHidden       = "OilHidden",
    OilOrphanLink             = { fg = c.diag.error },
    OilOrphanLinkHidden       = "OilHidden",
    OilOrphanLinkTarget       = { fg = c.diag.error, italic = true },
    OilOrphanLinkTargetHidden = "OilOrphanLinkTarget",

    -- actions in the preview / confirmation window
    OilCreate                 = { fg = c.vcs.added, bold = true },
    OilDelete                 = { fg = c.vcs.removed, bold = true },
    OilMove                   = { fg = c.vcs.changed, bold = true },
    OilCopy                   = { fg = c.diag.hint, bold = true },
    OilChange                 = { fg = c.syn.special1, bold = true },
    OilRestore                = "OilCreate",
    OilPurge                  = "OilDelete",
    OilTrash                  = "OilDelete",
    OilTrashSourcePath        = { fg = c.syn.comment, italic = true },
  }
end

return M

local M = {}

M.url = "https://github.com/lewis6991/gitsigns.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local bg = opts.transparent and c.none or c.ui.bg_gutter
  -- stylua: ignore
  return {
    GitSignsAdd          = { fg = c.vcs.added, bg = bg },
    GitSignsChange       = { fg = c.vcs.changed, bg = bg },
    GitSignsDelete       = { fg = c.vcs.removed, bg = bg },
    GitSignsChangedelete = { fg = c.vcs.removed, bg = bg },
    GitSignsTopdelete    = { fg = c.vcs.removed, bg = bg },
    GitSignsUntracked    = { fg = c.vcs.untracked, bg = bg },
    GitSignsDeleteLn     = { bg = c.diff.delete },
    GitSignsCurrentLineBlame = { fg = c.syn.comment },
  }
end

return M

local M = {}

M.url = "https://github.com/airblade/vim-gitgutter"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local bg = opts.transparent and c.none or c.ui.bg_gutter
  -- stylua: ignore
  return {
    GitGutterAdd          = { fg = c.vcs.added, bg = bg },
    GitGutterChange       = { fg = c.vcs.changed, bg = bg },
    GitGutterDelete       = { fg = c.vcs.removed, bg = bg },
    GitGutterAddLineNr    = { fg = c.vcs.added },
    GitGutterChangeLineNr = { fg = c.vcs.changed },
    GitGutterDeleteLineNr = { fg = c.vcs.removed },
  }
end

return M

local M = {}

M.url = "https://github.com/echasnovski/mini.diff"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local bg = opts.transparent and c.none or c.ui.bg_gutter
  -- stylua: ignore
  return {
    MiniDiffOverAdd     = "DiffAdd",
    MiniDiffOverChange  = "DiffText",
    MiniDiffOverContext = "DiffChange",
    MiniDiffOverDelete  = "DiffDelete",
    MiniDiffSignAdd     = { fg = c.vcs.added, bg = bg },
    MiniDiffSignChange  = { fg = c.vcs.changed, bg = bg },
    MiniDiffSignDelete  = { fg = c.vcs.removed, bg = bg },
  }
end

return M

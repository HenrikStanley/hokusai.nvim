local M = {}

M.url = "https://github.com/echasnovski/mini.starter"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniStarterCurrent    = { nocombine = true },
    MiniStarterFooter     = { fg = c.syn.deprecated },
    MiniStarterHeader     = "Title",
    MiniStarterInactive   = { fg = c.syn.comment, style = opts.styles.comments },
    MiniStarterItem       = "Normal",
    MiniStarterItemBullet = "Delimiter",
    MiniStarterItemPrefix = { fg = c.diag.warning },
    MiniStarterQuery      = { fg = c.diag.info },
    MiniStarterSection    = { fg = c.diag.ok },
  }
end

return M

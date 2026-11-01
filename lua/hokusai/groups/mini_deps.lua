local M = {}

M.url = "https://github.com/echasnovski/mini.deps"

---@type hokusai.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniDepsChangeAdded   = "diffAdded",
    MiniDepsChangeRemoved = "diffRemoved",
    MiniDepsHint          = "DiagnosticHint",
    MiniDepsInfo          = "DiagnosticInfo",
    MiniDepsMsgBreaking   = "DiagnosticWarn",
    MiniDepsPlaceholder   = "Comment",
    MiniDepsTitle         = "Title",
    MiniDepsTitleError    = { fg = c.ui.bg_m3, bg = c.vcs.removed },
    MiniDepsTitleSame     = "Comment",
    MiniDepsTitleUpdate   = { fg = c.ui.bg_m3, bg = c.vcs.added },
  }
end

return M

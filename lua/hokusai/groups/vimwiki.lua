local M = {}

M.url = "https://github.com/vimwiki/vimwiki"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    VimwikiLink = { fg = c.accent.blue, bg = c.none },
    VimwikiHeaderChar = { fg = c.accent.yellow, bg = c.none },
    VimwikiHR = { fg = c.accent.yellow, bg = c.none },
    VimwikiList = { fg = c.accent.orange, bg = c.none },
    VimwikiTag = { fg = c.accent.green, bg = c.none },
    VimwikiMarkers = { fg = c.accent.blue, bg = c.none },
  }
  for i, color in ipairs(c.rainbow) do
    ret["VimwikiHeader" .. i] = { fg = color, bg = c.none, bold = true }
  end
  return ret
end

return M

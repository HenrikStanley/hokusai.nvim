local Util = require("hokusai.util")

local M = {}

M.url = "https://github.com/rcarriga/nvim-notify"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local bg = opts.transparent and c.none or c.bg_float
  local levels = {
    ERROR = c.diag.error,
    WARN = c.diag.warning,
    INFO = c.diag.info,
    DEBUG = c.syn.comment,
    TRACE = c.syn.keyword,
  }
  local ret = {
    NotifyBackground = { fg = c.fg_float, bg = bg },
  }
  for level, color in pairs(levels) do
    ret["Notify" .. level .. "Body"] = { fg = c.fg_float, bg = bg }
    ret["Notify" .. level .. "Border"] =
      { fg = Util.blend(color, 0.4, c.bg_float == c.none and c.ui.bg or c.bg_float), bg = bg }
    ret["Notify" .. level .. "Icon"] = { fg = color }
    ret["Notify" .. level .. "Title"] = { fg = color }
  end
  return ret
end

return M

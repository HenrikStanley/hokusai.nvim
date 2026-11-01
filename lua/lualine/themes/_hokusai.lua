local M = {}

---@param style? string
function M.get(style)
  style = style or (vim.g.colors_name or ""):match("^hokusai%-(%w+)$")
  local colors, config = require("hokusai.colors").setup({ style = style })
  local sl = colors.ui.statusline
  local bg = colors.ui.bg

  ---@param color string
  local function mode(color)
    return {
      a = { bg = color, fg = bg },
      b = { bg = sl.mode_b, fg = color },
    }
  end

  local hl = {
    normal = {
      a = { bg = sl.a.bg, fg = sl.a.fg },
      b = { bg = sl.b.bg, fg = sl.b.fg },
      c = { bg = config.transparent and colors.none or sl.c.bg, fg = sl.c.fg },
    },
    insert = mode(colors.diag.ok),
    command = mode(colors.syn.operator),
    visual = mode(colors.syn.keyword),
    replace = mode(colors.syn.constant),
    terminal = mode(colors.syn.type),
    inactive = {
      a = { bg = sl.inactive, fg = colors.ui.fg_dim },
      b = { bg = sl.inactive, fg = colors.ui.fg_dim, gui = "bold" },
      c = { bg = config.transparent and colors.none or sl.inactive, fg = colors.ui.fg_dim },
    },
  }

  if config.lualine_bold then
    for _, m in pairs(hl) do
      m.a.gui = "bold"
    end
  end
  return hl
end

return M

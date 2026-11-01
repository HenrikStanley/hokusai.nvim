local style = (vim.g.colors_name or ""):match("^hokusai%-(%w+)$")
local colors = require("hokusai.colors").setup({ style = style })
local ui = colors.ui
local sl = ui.statusline

local hokusai = {}

hokusai.normal = {
  left = { { sl.a.fg, sl.a.bg }, { sl.b.fg, sl.b.bg } },
  middle = { { sl.c.fg, sl.c.bg } },
  right = { { sl.a.fg, sl.a.bg }, { sl.b.fg, sl.b.bg } },
  error = { { ui.bg, colors.diag.error } },
  warning = { { ui.bg, colors.diag.warning } },
}

hokusai.insert = {
  left = { { ui.bg, colors.diag.ok }, { colors.diag.ok, sl.mode_b } },
}

hokusai.visual = {
  left = { { ui.bg, colors.syn.keyword }, { colors.syn.keyword, sl.mode_b } },
}

hokusai.replace = {
  left = { { ui.bg, colors.syn.constant }, { colors.syn.constant, sl.mode_b } },
}

hokusai.inactive = {
  left = { { ui.fg_dim, sl.inactive }, { ui.nontext, sl.inactive } },
  middle = { { ui.nontext, sl.inactive } },
  right = { { ui.nontext, sl.inactive }, { ui.nontext, sl.inactive } },
}

hokusai.tabline = {
  left = { { ui.special, ui.bg_p2 }, { ui.nontext, ui.bg } },
  middle = { { ui.nontext, colors.bg_statusline } },
  right = { { ui.nontext, colors.bg_statusline }, { ui.nontext, ui.bg } },
  tabsel = { { colors.syn.fun, ui.bg_p1 }, { ui.nontext, ui.bg } },
}

return hokusai

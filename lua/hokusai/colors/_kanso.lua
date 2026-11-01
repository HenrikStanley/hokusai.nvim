-- Shared definition for the dark Kansō variants (zen, ink, mist).
-- They only differ in their background shades.

---@class hokusai.KansoShades
---@field bg string
---@field bg_dim string
---@field bg_p1 string
---@field bg_p2 string
---@field visual string
---@field indent string
---@field indent_active string
---@field whitespace string
---@field border string
---@field linenr string

---@param name string
---@param p hokusai.Palette
---@param s hokusai.Palette
---@param shades hokusai.KansoShades
---@return hokusai.Variant
return function(name, p, s, shades)
  local syn = {
    string = s.kansoGreen3,
    variable = "NONE",
    number = s.kansoPink,
    constant = s.kansoOrange,
    identifier = s.kansoViolet2,
    parameter = p.kansoGray3,
    fun = s.kansoBlue3,
    statement = s.kansoViolet2,
    keyword = s.kansoViolet2,
    operator = p.kansoGray3,
    preproc = p.kansoGray3,
    type = s.kansoAqua,
    regex = s.kansoRed3,
    deprecated = p.kansoGray,
    punct = p.kansoGray3,
    comment = p.kansoGray4,
    special1 = s.kansoYellow3,
    special2 = s.kansoViolet2,
    special3 = s.kansoViolet2,
  }

  local bg = shades.bg

  return {
    meta = { name = name, flavor = "kanso", background = "dark", ui = "normal" },
    ui = {
      fg = p.kansoFg,
      fg_dim = p.kansoGray2,
      fg_reverse = p.waveBlue1,

      bg_dim = shades.bg_dim,
      bg_gutter = "NONE",

      bg_m3 = bg,
      bg_m2 = bg,
      bg_m1 = bg,
      bg = bg,
      bg_p1 = shades.bg_p1,
      bg_p2 = shades.bg_p2,

      special = p.kansoGray5,
      nontext = p.kansoGray5,
      whitespace = shades.whitespace,
      indent = shades.indent,
      indent_active = shades.indent_active,
      border = shades.border,

      bg_visual = shades.visual,
      bg_search = p.waveBlue2,
      bg_reference = shades.bg_p2,
      bg_statusline = bg,

      linenr = shades.linenr,
      linenr_active = p.kansoFg2,
      cursor_fg = bg,
      cursor_bg = p.kansoFg2,

      pmenu = {
        fg = p.kansoFg2,
        fg_sel = "NONE",
        bg = bg,
        bg_sel = shades.visual,
        bg_thumb = shades.visual,
        bg_sbar = bg,
      },
      float = {
        fg = p.kansoGray2,
        bg = bg,
        fg_border = shades.border,
        bg_border = bg,
      },
      statusline = {
        a = { fg = bg, bg = p.kansoFg },
        b = { fg = p.kansoFg, bg = shades.bg_p1 },
        c = { fg = p.kansoFg, bg = bg },
        mode_b = shades.bg_p1,
        inactive = bg,
      },
    },
    syn = syn,
    diag = {
      error = p.kansoRed,
      ok = p.kansoGreen,
      warning = p.kansoYellow,
      info = p.kansoBlue2,
      hint = p.kansoGreen4,
    },
    diff = {
      add = p.winterGreen,
      delete = p.winterRed,
      change = p.winterBlue,
      text = p.winterYellow,
    },
    vcs = {
      added = p.autumnGreen,
      removed = p.autumnRed,
      changed = p.autumnYellow,
      untracked = p.kansoGray4,
    },
    accent = {
      red = p.kansoRed3,
      orange = p.kansoOrange,
      yellow = p.kansoYellow3,
      green = p.kansoGreen2,
      aqua = p.kansoAqua,
      teal = p.kansoGreen4,
      cyan = p.kansoBlue,
      blue = p.kansoBlue3,
      violet = p.kansoViolet,
      pink = p.kansoPink,
    },
    term = {
      bg, -- black
      p.kansoRed3, -- red
      p.kansoGreen3, -- green
      p.kansoYellow3, -- yellow
      p.kansoBlue3, -- blue
      p.kansoPink, -- magenta
      p.kansoFg, -- cyan
      p.kansoGray2, -- white
      p.kansoGray3, -- bright black
      p.kansoRed2, -- bright red
      p.kansoGreen2, -- bright green
      p.kansoYellow2, -- bright yellow
      p.kansoBlue, -- bright blue
      p.kansoViolet, -- bright magenta
      p.kansoGreen5, -- bright cyan
      p.kansoFg, -- bright white
      p.kansoOrange, -- extended color 1
      p.kansoOrange2, -- extended color 2
    },
  }
end

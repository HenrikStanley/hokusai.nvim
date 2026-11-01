-- Kanagawa Lotus: the default light variant.

---@type hokusai.VariantFn
return function(p, s)
  local syn = {
    string = s.lotusGreen,
    variable = "NONE",
    number = s.lotusPink,
    constant = s.lotusOrange,
    identifier = s.lotusYellow,
    parameter = s.lotusBlue5,
    fun = s.lotusBlue4,
    statement = s.lotusViolet4,
    keyword = s.lotusViolet4,
    operator = s.lotusYellow2,
    preproc = s.lotusRed,
    type = s.lotusAqua,
    regex = s.lotusYellow2,
    deprecated = p.lotusGray3,
    comment = p.lotusGray3,
    punct = p.lotusTeal1,
    special1 = s.lotusTeal2,
    special2 = s.lotusRed,
    special3 = s.lotusRed,
  }

  local diag = {
    error = p.lotusRed3,
    ok = p.lotusGreen,
    warning = p.lotusOrange2,
    info = p.lotusTeal3,
    hint = p.lotusAqua2,
  }

  local diff = {
    add = p.lotusGreen3,
    delete = p.lotusRed4,
    change = p.lotusCyan,
    text = p.lotusYellow4,
  }

  return {
    meta = { name = "lotus", flavor = "kanagawa", background = "light", ui = "dark" },
    ui = {
      fg = p.lotusInk1,
      fg_dim = p.lotusInk2,
      fg_reverse = p.lotusGray,

      bg_dim = p.lotusWhite1,
      bg_gutter = p.lotusWhite4,

      bg_m3 = p.lotusWhite0,
      bg_m2 = p.lotusWhite1,
      bg_m1 = p.lotusWhite2,
      bg = p.lotusWhite3,
      bg_p1 = p.lotusWhite4,
      bg_p2 = p.lotusWhite5,

      nontext = p.lotusViolet1,
      whitespace = p.lotusViolet1,
      special = p.lotusViolet2,
      indent = p.lotusViolet1,
      indent_active = p.lotusViolet2,
      border = p.lotusWhite0,

      bg_visual = p.lotusViolet3,
      bg_search = p.lotusBlue2,
      bg_reference = diff.text,
      bg_statusline = p.lotusWhite0,

      linenr = p.lotusViolet1,
      linenr_active = diag.warning,
      cursor_fg = p.lotusWhite3,
      cursor_bg = p.lotusInk1,

      pmenu = {
        fg = p.lotusInk2,
        fg_sel = "NONE",
        bg = p.lotusBlue1,
        bg_sel = p.lotusBlue3,
        bg_sbar = p.lotusBlue1,
        bg_thumb = p.lotusBlue2,
      },
      float = {
        fg = p.lotusInk2,
        bg = p.lotusWhite0,
        fg_border = p.lotusGray2,
        bg_border = p.lotusWhite0,
      },
      statusline = {
        a = { fg = p.lotusWhite0, bg = syn.fun },
        b = { fg = syn.fun, bg = diff.change },
        c = { fg = p.lotusInk1, bg = p.lotusWhite4 },
        mode_b = p.lotusWhite3,
        inactive = p.lotusWhite0,
      },
    },
    syn = syn,
    diag = diag,
    diff = diff,
    vcs = {
      added = p.lotusGreen2,
      removed = p.lotusRed2,
      changed = p.lotusYellow3,
      untracked = p.lotusGray3,
    },
    accent = {
      red = p.lotusRed,
      orange = p.lotusOrange,
      yellow = p.lotusYellow3,
      green = p.lotusGreen,
      aqua = p.lotusAqua,
      teal = p.lotusTeal1,
      cyan = p.lotusTeal2,
      blue = p.lotusBlue4,
      violet = p.lotusViolet4,
      pink = p.lotusPink,
    },
    term = {
      p.sumiInk3, -- black
      p.lotusRed, -- red
      p.lotusGreen, -- green
      p.lotusYellow, -- yellow
      p.lotusBlue4, -- blue
      p.lotusPink, -- magenta
      p.lotusAqua, -- cyan
      p.lotusInk1, -- white
      p.lotusGray3, -- bright black
      p.lotusRed2, -- bright red
      p.lotusGreen2, -- bright green
      p.lotusYellow2, -- bright yellow
      p.lotusTeal2, -- bright blue
      p.lotusViolet4, -- bright magenta
      p.lotusAqua2, -- bright cyan
      p.lotusInk2, -- bright white
      p.lotusOrange2, -- extended color 1
      p.lotusRed3, -- extended color 2
    },
  }
end

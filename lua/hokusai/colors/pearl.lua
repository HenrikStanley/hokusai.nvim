-- Kansō Pearl: neutral light variant.

---@type hokusai.VariantFn
return function(p, s)
  local syn = {
    string = s.pearlGreen,
    variable = "NONE",
    number = s.pearlPink,
    constant = s.pearlOrange,
    identifier = s.pearlViolet4,
    parameter = s.pearlBlue5,
    fun = s.pearlBlue4,
    statement = s.pearlViolet4,
    keyword = s.pearlViolet4,
    operator = p.pearlGray3,
    preproc = p.pearlGray2,
    type = s.pearlAqua,
    regex = s.pearlYellow2,
    deprecated = p.pearlGray3,
    comment = p.pearlGray3,
    punct = p.pearlGray3,
    special1 = s.pearlYellow2,
    special2 = s.pearlViolet4,
    special3 = s.pearlViolet4,
  }

  local bg = p.pearlWhite0

  return {
    meta = { name = "pearl", flavor = "kanso", background = "light", ui = "normal" },
    ui = {
      fg = p.pearlBlack0,
      fg_dim = p.pearlBlack1,
      fg_reverse = p.pearlGray,

      bg_dim = p.pearlWhite1,
      bg_gutter = "NONE",

      bg_m3 = bg,
      bg_m2 = bg,
      bg_m1 = bg,
      bg = bg,
      bg_p1 = p.pearlWhite1,
      bg_p2 = p.pearlWhite1,

      nontext = p.pearlViolet1,
      whitespace = p.pearlWhite3,
      special = p.pearlViolet2,
      indent = p.pearlWhite2,
      indent_active = p.pearlWhite3,
      border = p.pearlWhite2,

      bg_visual = p.pearlWhite2,
      bg_search = p.pearlBlue2,
      bg_reference = p.pearlWhite1,
      bg_statusline = bg,

      linenr = p.pearlGray4,
      linenr_active = p.inkBg2,
      cursor_fg = bg,
      cursor_bg = p.pearlBlack0,

      pmenu = {
        fg = p.pearlBlack2,
        fg_sel = "NONE",
        bg = bg,
        bg_sel = p.pearlWhite2,
        bg_thumb = p.pearlWhite2,
        bg_sbar = bg,
      },
      float = {
        fg = p.pearlBlack2,
        bg = bg,
        fg_border = p.pearlWhite2,
        bg_border = bg,
      },
      statusline = {
        a = { fg = bg, bg = p.pearlBlack0 },
        b = { fg = p.pearlBlack0, bg = p.pearlWhite1 },
        c = { fg = p.pearlBlack0, bg = bg },
        mode_b = p.pearlWhite1,
        inactive = bg,
      },
    },
    syn = syn,
    diag = {
      error = p.pearlRed3,
      ok = p.pearlGreen,
      warning = p.pearlOrange2,
      info = p.pearlTeal3,
      hint = p.pearlAqua2,
    },
    diff = {
      add = p.pearlGreen3,
      delete = p.pearlRed4,
      change = p.pearlCyan,
      text = p.pearlYellow4,
    },
    vcs = {
      added = p.pearlGreen2,
      removed = p.pearlRed2,
      changed = p.pearlYellow3,
      untracked = p.pearlGray4,
    },
    accent = {
      red = p.pearlRed,
      orange = p.pearlOrange,
      yellow = p.pearlYellow3,
      green = p.pearlGreen,
      aqua = p.pearlAqua,
      teal = p.pearlTeal1,
      cyan = p.pearlTeal2,
      blue = p.pearlBlue4,
      violet = p.pearlViolet4,
      pink = p.pearlPink,
    },
    term = {
      p.inkBg2, -- black
      p.pearlRed, -- red
      p.pearlGreen, -- green
      p.pearlYellow, -- yellow
      p.pearlBlue4, -- blue
      p.pearlPink, -- magenta
      p.pearlAqua, -- cyan
      p.pearlBlack0, -- white
      p.pearlGray3, -- bright black
      p.pearlRed2, -- bright red
      p.pearlGreen2, -- bright green
      p.pearlYellow2, -- bright yellow
      p.pearlTeal2, -- bright blue
      p.pearlViolet4, -- bright magenta
      p.pearlAqua2, -- bright cyan
      p.pearlBlack2, -- bright white
      p.pearlOrange2, -- extended color 1
      p.pearlRed3, -- extended color 2
    },
  }
end

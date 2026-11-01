-- Kanagawa Dragon: a darker, muted dark variant.

---@type hokusai.VariantFn
return function(p, s)
  local syn = {
    string = s.dragonGreen2,
    variable = "NONE",
    number = s.dragonPink,
    constant = s.dragonOrange,
    identifier = s.dragonYellow,
    parameter = p.dragonGray,
    fun = s.dragonBlue2,
    statement = s.dragonViolet,
    keyword = s.dragonViolet,
    operator = s.dragonRed,
    preproc = s.dragonRed,
    type = s.dragonAqua,
    regex = s.dragonRed,
    deprecated = p.katanaGray,
    punct = p.dragonGray2,
    comment = p.dragonAsh,
    special1 = s.dragonTeal,
    special2 = s.dragonRed,
    special3 = s.dragonRed,
  }

  local diag = {
    error = p.samuraiRed,
    ok = p.springGreen,
    warning = p.roninYellow,
    info = p.dragonBlue,
    hint = p.waveAqua1,
  }

  local diff = {
    add = p.winterGreen,
    delete = p.winterRed,
    change = p.winterBlue,
    text = p.winterYellow,
  }

  return {
    meta = { name = "dragon", flavor = "kanagawa", background = "dark", ui = "dark" },
    ui = {
      fg = p.dragonWhite,
      fg_dim = p.oldWhite,
      fg_reverse = p.waveBlue1,

      bg_dim = p.dragonBlack1,
      bg_gutter = p.dragonBlack4,

      bg_m3 = p.dragonBlack0,
      bg_m2 = p.dragonBlack1,
      bg_m1 = p.dragonBlack2,
      bg = p.dragonBlack3,
      bg_p1 = p.dragonBlack4,
      bg_p2 = p.dragonBlack5,

      special = p.dragonGray3,
      whitespace = p.dragonBlack6,
      nontext = p.dragonBlack6,
      indent = p.dragonBlack6,
      indent_active = p.dragonGray3,
      border = p.dragonBlack0,

      bg_visual = p.waveBlue1,
      bg_search = p.waveBlue2,
      bg_reference = diff.text,
      bg_statusline = p.dragonBlack0,

      linenr = p.dragonBlack6,
      linenr_active = diag.warning,
      cursor_fg = p.dragonBlack3,
      cursor_bg = p.dragonWhite,

      pmenu = {
        fg = p.fujiWhite,
        fg_sel = "NONE",
        bg = p.waveBlue1,
        bg_sel = p.waveBlue2,
        bg_thumb = p.waveBlue2,
        bg_sbar = p.waveBlue1,
      },
      float = {
        fg = p.oldWhite,
        bg = p.dragonBlack0,
        fg_border = p.sumiInk6,
        bg_border = p.dragonBlack0,
      },
      statusline = {
        a = { fg = p.dragonBlack0, bg = syn.fun },
        b = { fg = syn.fun, bg = diff.change },
        c = { fg = p.dragonWhite, bg = p.dragonBlack4 },
        mode_b = p.dragonBlack3,
        inactive = p.dragonBlack0,
      },
    },
    syn = syn,
    diag = diag,
    diff = diff,
    vcs = {
      added = p.autumnGreen,
      removed = p.autumnRed,
      changed = p.autumnYellow,
      untracked = p.dragonAsh,
    },
    accent = {
      red = p.dragonRed,
      orange = p.dragonOrange,
      yellow = p.dragonYellow,
      green = p.dragonGreen,
      aqua = p.dragonAqua,
      teal = p.waveAqua1,
      cyan = p.dragonTeal,
      blue = p.dragonBlue2,
      violet = p.dragonViolet,
      pink = p.dragonPink,
    },
    term = {
      p.dragonBlack0, -- black
      p.dragonRed, -- red
      p.dragonGreen2, -- green
      p.dragonYellow, -- yellow
      p.dragonBlue2, -- blue
      p.dragonPink, -- magenta
      p.dragonAqua, -- cyan
      p.oldWhite, -- white
      p.dragonGray, -- bright black
      p.waveRed, -- bright red
      p.dragonGreen, -- bright green
      p.carpYellow, -- bright yellow
      p.springBlue, -- bright blue
      p.springViolet1, -- bright magenta
      p.waveAqua2, -- bright cyan
      p.dragonWhite, -- bright white
      p.dragonOrange, -- extended color 1
      p.dragonOrange2, -- extended color 2
    },
  }
end

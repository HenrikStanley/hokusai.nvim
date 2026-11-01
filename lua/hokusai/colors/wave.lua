-- Kanagawa Wave: the default dark variant.

---@type hokusai.VariantFn
return function(p, s)
  local syn = {
    string = s.springGreen,
    variable = "NONE",
    number = s.sakuraPink,
    constant = s.surimiOrange,
    identifier = s.carpYellow,
    parameter = p.oniViolet2,
    fun = s.crystalBlue,
    statement = s.oniViolet,
    keyword = s.oniViolet,
    operator = s.boatYellow2,
    preproc = s.waveRed,
    type = s.waveAqua2,
    regex = s.boatYellow2,
    deprecated = p.katanaGray,
    comment = p.fujiGray,
    punct = p.springViolet2,
    special1 = s.springBlue,
    special2 = s.waveRed,
    special3 = s.peachRed,
  }

  local diag = {
    ok = p.springGreen,
    error = p.samuraiRed,
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
    meta = { name = "wave", flavor = "kanagawa", background = "dark", ui = "dark" },
    ui = {
      fg = p.fujiWhite,
      fg_dim = p.oldWhite,
      fg_reverse = p.waveBlue1,

      bg_dim = p.sumiInk1,
      bg_gutter = p.sumiInk4,

      bg_m3 = p.sumiInk0,
      bg_m2 = p.sumiInk1,
      bg_m1 = p.sumiInk2,
      bg = p.sumiInk3,
      bg_p1 = p.sumiInk4,
      bg_p2 = p.sumiInk5,

      special = p.springViolet1,
      nontext = p.sumiInk6,
      whitespace = p.sumiInk6,
      indent = p.sumiInk6,
      indent_active = p.springViolet1,
      border = p.sumiInk0,

      bg_search = p.waveBlue2,
      bg_visual = p.waveBlue1,
      bg_reference = diff.text,
      bg_statusline = p.sumiInk0,

      linenr = p.sumiInk6,
      linenr_active = diag.warning,
      cursor_fg = p.sumiInk3,
      cursor_bg = p.fujiWhite,

      pmenu = {
        fg = p.fujiWhite,
        fg_sel = "NONE",
        bg = p.waveBlue1,
        bg_sel = p.waveBlue2,
        bg_sbar = p.waveBlue1,
        bg_thumb = p.waveBlue2,
      },
      float = {
        fg = p.oldWhite,
        bg = p.sumiInk0,
        fg_border = p.sumiInk6,
        bg_border = p.sumiInk0,
      },
      statusline = {
        a = { fg = p.sumiInk0, bg = syn.fun },
        b = { fg = syn.fun, bg = diff.change },
        c = { fg = p.fujiWhite, bg = p.sumiInk4 },
        mode_b = p.sumiInk3,
        inactive = p.sumiInk0,
      },
    },
    syn = syn,
    diag = diag,
    diff = diff,
    vcs = {
      added = p.autumnGreen,
      removed = p.autumnRed,
      changed = p.autumnYellow,
      untracked = p.fujiGray,
    },
    accent = {
      red = p.waveRed,
      orange = p.surimiOrange,
      yellow = p.carpYellow,
      green = p.springGreen,
      aqua = p.waveAqua2,
      teal = p.waveAqua1,
      cyan = p.springBlue,
      blue = p.crystalBlue,
      violet = p.oniViolet,
      pink = p.sakuraPink,
    },
    term = {
      p.sumiInk0, -- black
      p.autumnRed, -- red
      p.autumnGreen, -- green
      p.boatYellow2, -- yellow
      p.crystalBlue, -- blue
      p.oniViolet, -- magenta
      p.waveAqua1, -- cyan
      p.oldWhite, -- white
      p.fujiGray, -- bright black
      p.samuraiRed, -- bright red
      p.springGreen, -- bright green
      p.carpYellow, -- bright yellow
      p.springBlue, -- bright blue
      p.springViolet1, -- bright magenta
      p.waveAqua2, -- bright cyan
      p.fujiWhite, -- bright white
      p.surimiOrange, -- extended color 1
      p.peachRed, -- extended color 2
    },
  }
end

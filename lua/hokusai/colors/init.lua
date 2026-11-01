local Util = require("hokusai.util")

local M = {}

-- Ordered list of all variants
M.variants = { "wave", "dragon", "lotus", "zen", "ink", "mist", "pearl" }

---@param style string
function M.exists(style)
  return vim.list_contains(M.variants, style)
end

---@param style string
---@return "dark"|"light"
function M.background(style)
  return (style == "lotus" or style == "pearl") and "light" or "dark"
end

---@param opts hokusai.Config
---@param background "dark"|"light"
---@return "default"|"saturated"
function M.foreground(opts, background)
  local fg = opts.foreground
  if type(fg) == "table" then
    fg = fg[background]
  end
  return fg == "saturated" and "saturated" or "default"
end

--- Returns a view of the palette where every color resolves to its
--- `<name>Saturated` counterpart when one exists.
---@param palette hokusai.Palette
---@return hokusai.Palette
function M.saturated(palette)
  return setmetatable({}, {
    __index = function(_, key)
      return palette[key .. "Saturated"] or palette[key]
    end,
  })
end

---@param opts? hokusai.Config
---@return ColorScheme, hokusai.Config
function M.setup(opts)
  opts = require("hokusai.config").extend(opts)

  local style = opts.style
  if not M.exists(style) then
    Util.warn(("Unknown style `%s`. Falling back to `wave`."):format(tostring(style)))
    style = "wave"
    opts.style = style
  end

  local palette = vim.deepcopy(Util.mod("hokusai.palette"))
  local background = M.background(style)
  local foreground = M.foreground(opts, background)
  local s = foreground == "saturated" and M.saturated(palette) or palette

  ---@type hokusai.VariantFn
  local variant = Util.mod("hokusai.colors." .. style)

  ---@class ColorScheme: hokusai.Variant
  local c = variant(palette, s)

  c.none = "NONE"
  c.palette = palette
  c.style = style
  c.background = background
  c.foreground = foreground

  Util.bg = c.ui.bg
  Util.fg = c.ui.fg

  local ui = c.ui

  -- A darker shade of the background for "dark" sidebars and floats.
  -- Kansō variants use a flat UI where all `bg_m*` are equal to `bg`.
  c.bg_dark = ui.bg_m3 ~= ui.bg and ui.bg_m3
    or (background == "dark" and Util.blend(ui.bg, 0.75, "#000000") or ui.bg_dim)

  ---@param kind "sidebars"|"floats"
  local function bg_for(kind)
    local value = opts.styles[kind]
    if value == "auto" or value == nil then
      value = c.meta.ui
    end
    return value == "transparent" and c.none or value == "dark" and c.bg_dark or ui.bg
  end

  c.bg_sidebar = bg_for("sidebars")
  c.bg_float = bg_for("floats")
  ui.float.bg = c.bg_float
  ui.float.bg_border = c.bg_float

  c.fg_sidebar = ui.fg
  c.fg_float = ui.float.fg
  c.bg_popup = ui.pmenu.bg
  c.bg_statusline = (opts.transparent and ui.bg_statusline == ui.bg) and c.none or ui.bg_statusline
  c.border = ui.border
  c.border_highlight = ui.float.fg_border

  c.rainbow = {
    c.accent.blue,
    c.accent.yellow,
    c.accent.green,
    c.accent.teal,
    c.accent.violet,
    c.accent.pink,
    c.accent.orange,
    c.accent.red,
  }

  local t = c.term
  -- stylua: ignore
  --- @class TerminalColors
  c.terminal = {
    black          = t[1],
    red            = t[2],
    green          = t[3],
    yellow         = t[4],
    blue           = t[5],
    magenta        = t[6],
    cyan           = t[7],
    white          = t[8],
    black_bright   = t[9],
    red_bright     = t[10],
    green_bright   = t[11],
    yellow_bright  = t[12],
    blue_bright    = t[13],
    magenta_bright = t[14],
    cyan_bright    = t[15],
    white_bright   = t[16],
    extended1      = t[17],
    extended2      = t[18],
  }

  opts.on_colors(c)

  return c, opts
end

return M

local Util = require("hokusai.util")

local M = {}

---@type hokusai.HighlightsFn
function M.get(c, opts)
  local syn = c.syn
  local minimal = opts.minimal
  local kanso = c.meta.flavor == "kanso"

  -- keywords that stay colored in minimal mode
  local kw = { fg = minimal and syn.identifier or syn.keyword }

  -- stylua: ignore
  local ret = {
    ["@variable"]                   = { fg = c.ui.fg, style = opts.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"]           = { fg = minimal and c.ui.fg or syn.special2, italic = true }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.parameter"]         = { fg = minimal and syn.operator or syn.parameter }, -- For parameters of a function.
    ["@variable.member"]            = { fg = syn.identifier }, -- For fields.

    ["@string.regexp"]              = { fg = syn.regex }, -- For regexes.
    ["@string.escape"]              = { fg = syn.regex, bold = not kanso }, -- For escape characters within a string.
    ["@string.special.symbol"]      = { fg = syn.identifier },
    ["@string.special.url"]         = { fg = syn.special1, undercurl = true },

    ["@type.builtin"]               = kanso and { fg = syn.type } or nil,
    ["@attribute"]                  = "Constant",
    ["@property"]                   = { fg = syn.identifier },

    ["@function.builtin"]           = kanso and "Function" or nil,
    ["@function.macro"]             = "Macro",

    ["@constructor"]                = { fg = syn.special1 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@constructor.lua"]            = { fg = syn.keyword },
    ["@operator"]                   = "Operator", -- For any operator: `+`, but also `->` and `*` in C.

    ["@keyword"]                    = { fg = minimal and syn.operator or syn.keyword, style = opts.styles.keywords }, -- For keywords that don't fall in previous categories.
    ["@keyword.coroutine"]          = kw,
    ["@keyword.function"]           = kw, -- For keywords used to define a function.
    ["@keyword.conditional"]        = kw,
    ["@keyword.modifier"]           = kw,
    ["@keyword.storage"]            = kw,
    ["@keyword.type"]               = kw,
    ["@keyword.repeat"]             = kw,
    ["@keyword.operator"]           = { fg = minimal and syn.special1 or syn.operator, bold = not kanso }, -- operators that are English words (e.g. `and`, `or`)
    ["@keyword.import"]             = "PreProc",
    ["@keyword.return"]             = { fg = minimal and syn.identifier or syn.special3, style = opts.styles.keywords },
    ["@keyword.exception"]          = { fg = minimal and syn.operator or syn.special3 },
    ["@keyword.luap"]               = "@string.regexp",

    ["@punctuation.delimiter"]      = { fg = minimal and syn.operator or syn.punct }, -- For delimiters ie: `.`
    ["@punctuation.bracket"]        = { fg = minimal and syn.operator or syn.punct }, -- For brackets and parens.
    ["@punctuation.special"]        = { fg = minimal and syn.operator or syn.special1 }, -- For special symbols (e.g. `{}` in string interpolation)

    ["@comment"]                    = "Comment",
    ["@comment.error"]              = { fg = c.ui.fg, bg = c.diag.error, bold = true },
    ["@comment.warning"]            = { fg = c.ui.fg_reverse, bg = c.diag.warning, bold = true },
    ["@comment.todo"]               = { fg = c.ui.fg_reverse, bg = c.diag.info, bold = true },
    ["@comment.note"]               = { fg = c.ui.fg_reverse, bg = c.diag.hint, bold = true },
    ["@comment.hint"]               = "@comment.note",
    ["@comment.info"]               = "@comment.note",

    ["@markup"]                     = "@none",
    ["@markup.strong"]              = { bold = true },
    ["@markup.italic"]              = { italic = true },
    ["@markup.emphasis"]            = { italic = true },
    ["@markup.strikethrough"]       = { strikethrough = true },
    ["@markup.underline"]           = { underline = true },
    ["@markup.heading"]             = "Function",
    ["@markup.quote"]               = "@variable.parameter",
    ["@markup.math"]                = "Constant",
    ["@markup.environment"]         = "Keyword",
    ["@markup.environment.name"]    = "Type",
    ["@markup.link"]                = { fg = syn.special1 },
    ["@markup.link.label"]          = "Special",
    ["@markup.link.label.symbol"]   = "Identifier",
    ["@markup.link.url"]            = "@string.special.url",
    ["@markup.raw"]                 = "String",
    ["@markup.raw.markdown_inline"] = { fg = syn.string, bg = c.ui.bg_p1 },
    ["@markup.list"]                = { fg = syn.special1 },
    ["@markup.list.checked"]        = { fg = c.diag.ok },
    ["@markup.list.unchecked"]      = { fg = syn.fun },
    ["@markup.list.markdown"]       = { fg = syn.constant, bold = true },
    ["@punctuation.special.markdown"] = { fg = syn.constant },

    ["@diff.plus"]                  = { fg = c.vcs.added },
    ["@diff.minus"]                 = { fg = c.vcs.removed },
    ["@diff.delta"]                 = { fg = c.vcs.changed },

    ["@tag.attribute"]              = { fg = syn.identifier },
    ["@tag.delimiter"]              = { fg = syn.punct },

    ["@none"]                       = {},
  }

  for i, color in ipairs(c.rainbow) do
    ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true, bg = Util.blend_bg(color, 0.1) }
  end
  return ret
end

return M

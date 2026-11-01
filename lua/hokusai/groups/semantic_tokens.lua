local M = {}

---@type hokusai.HighlightsFn
function M.get(c)
  local kanso = c.meta.flavor == "kanso"

  -- stylua: ignore
  return {
    ["@lsp.type.boolean"]                      = "@boolean",
    ["@lsp.type.builtinType"]                  = "@type.builtin",
    ["@lsp.type.comment"]                      = "Comment",
    ["@lsp.type.decorator"]                    = "@attribute",
    ["@lsp.type.deriveHelper"]                 = "@attribute",
    ["@lsp.type.enum"]                         = "@type",
    ["@lsp.type.enumMember"]                   = "@constant",
    ["@lsp.type.escapeSequence"]               = "@string.escape",
    ["@lsp.type.formatSpecifier"]              = "@markup.list",
    ["@lsp.type.function"]                     = kanso and "Function" or nil,
    ["@lsp.type.generic"]                      = "@variable",
    ["@lsp.type.interface"]                    = "@type",
    ["@lsp.type.keyword"]                      = "@keyword",
    ["@lsp.type.lifetime"]                     = "Operator",
    ["@lsp.type.macro"]                        = "Macro",
    ["@lsp.type.method"]                       = kanso and "Function" or "@function.method",
    ["@lsp.type.namespace"]                    = "@module",
    ["@lsp.type.namespace.python"]             = "@variable",
    ["@lsp.type.number"]                       = "@number",
    ["@lsp.type.operator"]                     = "@operator",
    ["@lsp.type.parameter"]                    = "@variable.parameter",
    ["@lsp.type.property"]                     = "@property",
    ["@lsp.type.selfKeyword"]                  = "@variable.builtin",
    ["@lsp.type.selfTypeKeyword"]              = "@variable.builtin",
    ["@lsp.type.selfParameter"]                = "@variable.builtin",
    ["@lsp.type.string"]                       = "@string",
    ["@lsp.type.type"]                         = kanso and "Type" or nil,
    ["@lsp.type.typeAlias"]                    = "@type.definition",
    ["@lsp.type.unresolvedReference"]          = { undercurl = true, sp = c.diag.error },
    ["@lsp.type.variable"]                     = {}, -- use treesitter styles for regular variables
    ["@lsp.type.const"]                        = "Constant",
    ["@lsp.type.comparison"]                   = "Operator",
    ["@lsp.type.bitwise"]                      = "Operator",
    ["@lsp.type.punctuation"]                  = "Delimiter",
    ["@lsp.type.builtinConstant"]              = "@constant.builtin",
    ["@lsp.type.magicFunction"]                = "@function.builtin",
    ["@lsp.type.decorator.rust"]               = "PreProc",

    ["@lsp.mod.readonly"]                      = "Constant",
    ["@lsp.mod.typeHint"]                      = "Type",

    ["@lsp.typemod.class.defaultLibrary"]      = "@type.builtin",
    ["@lsp.typemod.enum.defaultLibrary"]       = "@type.builtin",
    ["@lsp.typemod.enumMember.defaultLibrary"] = "@constant.builtin",
    ["@lsp.typemod.function.builtin"]          = "@function.builtin",
    ["@lsp.typemod.function.defaultLibrary"]   = "@function.builtin",
    ["@lsp.typemod.function.readonly"]         = kanso and "Function" or { fg = c.syn.fun, bold = true },
    ["@lsp.typemod.keyword.async"]             = "@keyword.coroutine",
    ["@lsp.typemod.keyword.documentation"]     = "Special",
    ["@lsp.typemod.keyword.injected"]          = "@keyword",
    ["@lsp.typemod.macro.defaultLibrary"]      = "@function.builtin",
    ["@lsp.typemod.method.defaultLibrary"]     = "@function.builtin",
    ["@lsp.typemod.operator.controlFlow"]      = "@keyword.exception",
    ["@lsp.typemod.operator.injected"]         = "@operator",
    ["@lsp.typemod.string.injected"]           = "@string",
    ["@lsp.typemod.struct.defaultLibrary"]     = "@type.builtin",
    ["@lsp.typemod.type.defaultLibrary"]       = "@type.builtin",
    ["@lsp.typemod.typeAlias.defaultLibrary"]  = "@type.builtin",
    ["@lsp.typemod.variable.callable"]         = "@function",
    ["@lsp.typemod.variable.defaultLibrary"]   = "Special",
    ["@lsp.typemod.variable.global"]           = "Constant",
    ["@lsp.typemod.variable.injected"]         = "@variable",
    ["@lsp.typemod.variable.static"]           = "Constant",
  }
end

return M

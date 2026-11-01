-- nvim --headless -u NONE -l scripts/fidelity.lua <ref-dir>
-- Compares resolved highlight colors of core groups between hokusai and the
-- original kanagawa.nvim / kanso.nvim themes.
local ref = assert(_G.arg[1], "usage: fidelity.lua <ref-dir>")
vim.opt.rtp:prepend(vim.fn.getcwd())
vim.opt.rtp:append(ref .. "/kanagawa.nvim")
vim.opt.rtp:append(ref .. "/kanso.nvim")

-- stylua: ignore
local groups = {
  "Normal", "NormalFloat", "FloatBorder", "CursorLine", "LineNr", "CursorLineNr", "Visual", "Search",
  "Pmenu", "PmenuSel", "StatusLine", "WinSeparator", "SignColumn", "Folded", "NonText", "Whitespace",
  "Comment", "Constant", "String", "Number", "Boolean", "Identifier", "Function", "Statement", "Keyword",
  "Operator", "PreProc", "Type", "Special", "Delimiter", "Exception", "Todo", "Error",
  "@variable", "@variable.builtin", "@variable.parameter", "@variable.member", "@property",
  "@function", "@function.builtin", "@function.call", "@function.method", "@constructor",
  "@keyword", "@keyword.function", "@keyword.return", "@keyword.operator", "@keyword.import",
  "@keyword.conditional", "@keyword.exception", "@string", "@string.escape", "@string.regexp",
  "@type", "@type.builtin", "@punctuation.bracket", "@punctuation.delimiter", "@tag.attribute",
  "@markup.heading", "@markup.link.url",
  "DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint",
  "DiffAdd", "DiffChange", "DiffDelete", "DiffText", "GitSignsAdd", "GitSignsChange", "GitSignsDelete",
}

local function snapshot()
  local ret = {}
  for _, g in ipairs(groups) do
    local hl = vim.api.nvim_get_hl(0, { name = g, link = false })
    local function hex(v)
      return v and string.format("#%06x", v) or "-"
    end
    ret[g] = hex(hl.fg) .. "/" .. hex(hl.bg)
  end
  return ret
end

local cases = {
  { "kanagawa", "wave" },
  { "kanagawa", "dragon" },
  { "kanagawa", "lotus" },
  { "kanso", "zen" },
  { "kanso", "ink" },
  { "kanso", "mist" },
  { "kanso", "pearl" },
}

local total, diffs = 0, 0
for _, case in ipairs(cases) do
  local mod, style = case[1], case[2]
  local bg = (style == "lotus" or style == "pearl") and "light" or "dark"
  vim.o.background = bg
  vim.cmd("hi clear")
  require(mod).setup({ theme = style, background = { [bg] = style } })
  require(mod).load(style)
  local a = snapshot()

  vim.cmd("hi clear")
  require("hokusai").setup({ style = style, cache = false, plugins = { all = true } })
  require("hokusai").load({ style = style })
  local b = snapshot()

  local out = {}
  for _, g in ipairs(groups) do
    total = total + 1
    if a[g] ~= b[g] then
      diffs = diffs + 1
      out[#out + 1] = ("  %-24s %s  ->  %s"):format(g, a[g], b[g])
    end
  end
  print(("%s/%s: %d differences"):format(mod, style, #out))
  for _, l in ipairs(out) do
    print(l)
  end
end
print(("%d/%d groups identical"):format(total - diffs, total))

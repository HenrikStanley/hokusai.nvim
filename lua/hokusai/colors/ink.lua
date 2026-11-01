-- Kansō Ink: balanced dark variant.

---@type hokusai.VariantFn
return function(p, s)
  return require("hokusai.colors._kanso")("ink", p, s, {
    bg = p.inkBg0,
    bg_dim = p.inkBg1,
    bg_p1 = p.inkBg1,
    bg_p2 = p.inkBg2,
    visual = p.inkBg3,
    indent = p.inkBg2,
    indent_active = p.inkBg3,
    whitespace = p.inkBg4,
    border = p.inkBg2,
    linenr = p.kansoGray5,
  })
end

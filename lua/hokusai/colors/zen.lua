-- Kansō Zen: deep and rich, the darkest variant.

---@type hokusai.VariantFn
return function(p, s)
  return require("hokusai.colors._kanso")("zen", p, s, {
    bg = p.zenBg0,
    bg_dim = p.zenBg1,
    bg_p1 = p.zenBg1,
    bg_p2 = p.zenBg2,
    visual = p.inkBg3,
    indent = p.inkBg2,
    indent_active = p.inkBg3,
    whitespace = p.inkBg3,
    border = p.zenBg2,
    linenr = p.kansoGray5,
  })
end

-- Kansō Mist: soft and muted dark variant.

---@type hokusai.VariantFn
return function(p, s)
  return require("hokusai.colors._kanso")("mist", p, s, {
    bg = p.mistBg0,
    bg_dim = p.mistBg1,
    bg_p1 = p.mistBg2,
    bg_p2 = p.mistBg2,
    visual = p.mistBg2,
    indent = p.mistBg2,
    indent_active = p.mistBg3,
    whitespace = p.mistBg3,
    border = p.mistBg2,
    linenr = p.kansoGray4,
  })
end

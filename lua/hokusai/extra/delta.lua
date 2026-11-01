local util = require("hokusai.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  colors.delta = {
    add = util.blend_bg(colors.vcs.added, 0.35),
    delete = util.blend_bg(colors.vcs.removed, 0.35),
  }
  local delta = util.template(
    [[
[delta]
  minus-style                   = syntax "${diff.delete}"
  minus-non-emph-style          = syntax "${diff.delete}"
  minus-emph-style              = syntax "${delta.delete}"
  minus-empty-line-marker-style = syntax "${diff.delete}"
  line-numbers-minus-style      = "${vcs.removed}"
  plus-style                    = syntax "${diff.add}"
  plus-non-emph-style           = syntax "${diff.add}"
  plus-emph-style               = syntax "${delta.add}"
  plus-empty-line-marker-style  = syntax "${diff.add}"
  line-numbers-plus-style       = "${vcs.added}"
  line-numbers-zero-style       = "${ui.nontext}"
]],
    colors
  )
  return delta
end

return M

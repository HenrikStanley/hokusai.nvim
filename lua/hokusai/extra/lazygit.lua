local util = require("hokusai.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local lazygit = util.template(
    [[
gui:
  nerdFontsVersion: "3"
  theme:
    activeBorderColor:
      - "${accent.orange}"
      - "bold"
    inactiveBorderColor:
      - "${border_highlight}"
    searchingActiveBorderColor:
      - "${accent.orange}"
      - "bold"
    optionsTextColor:
      - "${accent.blue}"
    selectedLineBgColor:
      - "${ui.bg_visual}"
    cherryPickedCommitFgColor:
      - "${accent.blue}"
    cherryPickedCommitBgColor:
      - "${accent.violet}"
    markedBaseCommitFgColor:
      - "${accent.blue}"
    markedBaseCommitBgColor:
      - "${accent.yellow}"
    unstagedChangesColor:
      - "${diag.error}"
    defaultFgColor:
      - "${ui.fg}"
]],
    colors
  )
  return lazygit
end

return M

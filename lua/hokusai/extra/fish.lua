local util = require("hokusai.util")

local M = {}

---@param t table
local function strip_hash(t)
  local ret = {}
  for k, v in pairs(t) do
    if type(v) == "string" then
      ret[k] = v:gsub("^#", "")
    elseif type(v) == "table" then
      ret[k] = strip_hash(v)
    end
  end
  return ret
end

--- @param colors ColorScheme
function M.generate(colors)
  local fish = util.template(
    [[
# Hokusai Color Palette
set -l foreground ${ui.fg}
set -l selection ${ui.bg_visual}
set -l comment ${syn.comment}
set -l command ${syn.fun}
set -l keyword ${syn.keyword}
set -l string ${syn.string}
set -l param ${syn.parameter}
set -l operator ${syn.operator}
set -l special ${syn.special1}
set -l constant ${syn.constant}
set -l error ${diag.error}

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $command
set -g fish_color_keyword $keyword
set -g fish_color_quote $string
set -g fish_color_redirection $operator
set -g fish_color_end $operator
set -g fish_color_option $constant
set -g fish_color_error $error
set -g fish_color_param $param
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $operator
set -g fish_color_escape $special
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $command
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
]],
    strip_hash(colors)
  )

  return fish
end

return M

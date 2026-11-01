local util = require("hokusai.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  colors.search_bg = util.blend_bg(colors.diag.info, 0.1)
  colors.pmenusel = util.blend_bg(colors.ui.bg_p2, 0.8)
  local yazi = util.template(
    [[
[mgr]
# NOTE: can be combined with tmTheme (sublime colorshceme file) for preview code highlight
# syntect_theme = "path/to/tmTheme"

cwd = { fg = "${ui.fg_dim}", italic = true }

# Hovered
hovered         = { bg = "${ui.bg_p2}" }
preview_hovered = { bg = "${ui.bg_p2}" }

# Find
find_keyword  = { fg = "${bg_dark}", bg = "${accent.orange}", bold = true }
find_position = { fg = "${diag.info}", bg = "${search_bg}", bold = true }

# Marker
marker_copied   = { fg = "${accent.green}", bg = "${accent.green}" }
marker_cut      = { fg = "${accent.red}", bg = "${accent.red}" }
marker_marked   = { fg = "${accent.violet}", bg = "${accent.violet}" }
marker_selected = { fg = "${accent.blue}", bg = "${accent.blue}" }

# Count
count_copied   = { fg = "${bg_dark}", bg = "${accent.green}" }
count_cut      = { fg = "${bg_dark}", bg = "${accent.red}" }
count_selected = { fg = "${bg_dark}", bg = "${accent.blue}" }

# Border
border_symbol = "│"
border_style  = { fg = "${border_highlight}" }

# Tab
[tabs]
active   = { fg = "${ui.bg_m3}", bg = "${accent.blue}" }
inactive = { fg = "${accent.blue}", bg = "${ui.bg_p2}" }

[mode]
normal_main = { fg = "${ui.bg_m3}", bg = "${accent.blue}", bold = true }
normal_alt  = { fg = "${accent.blue}", bg = "${ui.bg_p2}" }

select_main = { fg = "${ui.bg_m3}", bg = "${accent.violet}", bold = true }
select_alt  = { fg = "${accent.violet}", bg = "${ui.bg_p2}" }

unset_main  = { fg = "${ui.bg_m3}", bg = "${accent.violet}", bold = true }
unset_alt   = { fg = "${accent.violet}", bg = "${ui.bg_p2}" }

[status]
overall   = { fg = "${ui.fg}", bg = "${bg_dark}" }
sep_left  = { open = "", close = "" }
sep_right = { open = "", close = "" }

# Progress
progress_label  = { fg = "${ui.fg}", bold = true }
progress_normal = { fg = "${ui.bg_search}", bg = "${ui.bg_p2}" }
progress_error  = { fg = "${diag.error}", bg = "${ui.bg_p2}" }

# Permissions
perm_type  = { fg = "${accent.blue}" }
perm_read  = { fg = "${accent.yellow}" }
perm_write = { fg = "${accent.red}" }
perm_exec  = { fg = "${accent.green}" }
perm_sep   = { fg = "${ui.nontext}" }

[pick]
border   = { fg = "${border_highlight}" }
active   = { fg = "${ui.fg}",  bg = "${ui.bg_visual}" }
inactive = { fg = "${ui.fg}" }

# Input
[input]
border   = { fg = "${accent.teal}" }
title    = { fg = "${accent.teal}" }
value    = { fg = "${accent.violet}" }
selected = { bg = "${ui.bg_visual}" }

# Completion
[cmp]
border   = { fg = "${accent.teal}" }
active   = { fg = "${ui.fg}", bg = "${pmenusel}" }
inactive = { fg = "${ui.fg}" }

icon_file    = ""
icon_folder  = ""
icon_command = ""

# Tasks
[tasks]
border  = { fg = "${border_highlight}" }
title   = { fg = "${border_highlight}" }
hovered = { fg = "${ui.fg}", bg = "${ui.bg_visual}" }

# Which
[which]
cols            = 3
mask            = { bg = "${bg_dark}" }
cand            = { fg = "${accent.cyan}" }
rest            = { fg = "${accent.blue}" }
desc            = { fg = "${accent.violet}" }
separator       = " ➜ "
separator_style = { fg = "${syn.comment}" }

# Confirm
[confirm]
border  = { fg = "${accent.teal}" }
title   = { fg = "${border_highlight}" }
content = {}
list    = {}
btn_yes = { bg = "${ui.bg_visual}" }
btn_no  = {}
btn_labels = [ "  [Y]es  ", "  (N)o  " ]

# Spot
[spot]
border  = { fg = "${border_highlight}" }
title   = { fg = "${border_highlight}" }

# Notify
[notify]
title_info  = { fg = "${diag.info}" }
title_warn  = { fg = "${diag.warning}" }
title_error = { fg = "${diag.error}" }

icon_error = ""
icon_warn = ""
icon_info = ""

# Help
[help]
on      = { fg = "${accent.green}" }
run     = { fg = "${accent.violet}" }
desc    = { fg = "${accent.cyan}" }
hovered = { bg = "${ui.bg_p2}" }
footer  = { fg = "${ui.fg}", bg = "${ui.bg}" }

[filetype]

rules = [
	# Images
	{ mime = "image/*", fg = "${accent.yellow}" },

	# Media
	{ mime = "{audio,video}/*", fg = "${accent.violet}" },

	# Archives
	{ mime = "application/*zip", fg = "${accent.red}" },
	{ mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "${accent.red}" },

	# Documents
	{ mime = "application/{pdf,doc,rtf,vnd.*}", fg = "${accent.cyan}" },

	# Empty files
	# { mime = "inode/x-empty", fg = "${accent.red}" },

	# Special files
	{ name = "*", is = "orphan", bg = "${accent.red}" },
	{ name = "*", is = "exec"  , fg = "${accent.green}" },

	# Fallback
	{ name = "*/", fg = "${accent.blue}" },
	{ name = "*", fg = "${ui.fg}" }
]
    ]],
    colors
  )
  return yazi
end

return M

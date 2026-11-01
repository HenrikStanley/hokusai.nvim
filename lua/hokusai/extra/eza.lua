local util = require("hokusai.util")

local M = {}

function M.generate(colors)
  local eza = util.template(
    [[
colourful: true

filekinds:
  normal: { foreground: "${ui.fg}" }
  directory: { foreground: "${accent.blue}" }
  symlink: { foreground: "${accent.cyan}" }
  pipe: { foreground: "${ui.nontext}" }
  block_device: { foreground: "${accent.yellow}" }
  char_device: { foreground: "${accent.yellow}" }
  socket: { foreground: "${ui.nontext}" }
  special: { foreground: "${accent.violet}" }
  executable: { foreground: "${accent.green}" }
  mount_point: { foreground: "${accent.cyan}" }

perms:
  user_read: { foreground: "${accent.cyan}" }
  user_write: { foreground: "${accent.violet}" }
  user_execute_file: { foreground: "${accent.green}" }
  user_execute_other: { foreground: "${accent.green}" }
  group_read: { foreground: "${accent.cyan}" }
  group_write: { foreground: "${accent.orange}" }
  group_execute: { foreground: "${accent.green}" }
  other_read: { foreground: "${accent.cyan}" }
  other_write: { foreground: "${accent.pink}" }
  other_execute: { foreground: "${accent.green}" }
  special_user_file: { foreground: "${accent.pink}" }
  special_other: { foreground: "${diag.error}" }
  attribute: { foreground: "${ui.special}" }

size:
  major: { foreground: "${accent.cyan}" }
  minor: { foreground: "${accent.violet}" }
  number_byte: { foreground: "${ui.fg_dim}" }
  number_kilo: { foreground: "${accent.cyan}" }
  number_mega: { foreground: "${accent.cyan}" }
  number_giga: { foreground: "${accent.orange}" }
  number_huge: { foreground: "${accent.pink}" }
  unit_byte: { foreground: "${ui.fg_dim}" }
  unit_kilo: { foreground: "${accent.cyan}" }
  unit_mega: { foreground: "${accent.cyan}" }
  unit_giga: { foreground: "${accent.orange}" }
  unit_huge: { foreground: "${accent.pink}" }

users:
  user_you: { foreground: "${syn.fun}" }
  user_root: { foreground: "${accent.violet}" }
  user_other: { foreground: "${accent.cyan}" }
  group_yours: { foreground: "${accent.cyan}" }
  group_root: { foreground: "${accent.violet}" }
  group_other: { foreground: "${ui.fg}" }

links:
  normal: { foreground: "${accent.cyan}" }
  multi_link_file: { foreground: "${accent.cyan}" }

git:
  new: { foreground: "${vcs.added}" }
  modified: { foreground: "${vcs.changed}" }
  deleted: { foreground: "${vcs.removed}" }
  renamed: { foreground: "${accent.cyan}" }
  typechange: { foreground: "${accent.cyan}" }
  ignored: { foreground: "${ui.nontext}" }
  conflicted: { foreground: "${accent.orange}" }

git_repo:
  branch_main: { foreground: "${ui.special}" }
  branch_other: { foreground: "${accent.cyan}" }
  git_clean: { foreground: "${ui.nontext}" }
  git_dirty: { foreground: "${accent.violet}" }

security_context:
  colon: { foreground: "${ui.nontext}" }
  user: { foreground: "${ui.special}" }
  role: { foreground: "${accent.cyan}" }
  typ: { foreground: "${syn.type}" }
  range: { foreground: "${accent.violet}" }

file_type:
  image: { foreground: "${accent.cyan}" }
  video: { foreground: "${accent.cyan}" }
  music: { foreground: "${accent.aqua}" }
  lossless: { foreground: "${accent.aqua}" }
  crypto: { foreground: "${diag.error}" }
  document: { foreground: "${ui.fg_dim}" }
  compressed: { foreground: "${accent.orange}" }
  temp: { foreground: "${ui.special}" }
  compiled: { foreground: "${ui.special}" }
  build: { foreground: "${accent.teal}" }
  source: { foreground: "${accent.violet}" }

punctuation: { foreground: "${ui.nontext}" }
date: { foreground: "${accent.yellow}" }
inode: { foreground: "${ui.special}" }
blocks: { foreground: "${ui.special}" }
header: { foreground: "${ui.fg_dim}" }
octal: { foreground: "${accent.orange}" }
flags: { foreground: "${accent.violet}" }

symlink_path: { foreground: "${accent.cyan}" }
control_char: { foreground: "${accent.orange}" }
broken_symlink: { foreground: "${accent.pink}" }
broken_path_overlay: { foreground: "${accent.pink}" }]],
    colors
  )

  return eza
end

return M

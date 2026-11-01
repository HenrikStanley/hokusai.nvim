local M = {}

---@param opts? hokusai.Config
function M.setup(opts)
  opts = require("hokusai.config").extend(opts)

  local colors = require("hokusai.colors").setup(opts)
  local groups = require("hokusai.groups").setup(colors, opts)

  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "hokusai-" .. opts.style

  for group, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end

  if opts.terminal_colors then
    M.terminal(colors)
  end

  return colors, groups, opts
end

---@param colors ColorScheme
function M.terminal(colors)
  for i, color in ipairs(colors.term) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M

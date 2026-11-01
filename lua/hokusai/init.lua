local config = require("hokusai.config")

local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@param opts? hokusai.Config
function M.load(opts)
  opts = require("hokusai.config").extend(opts)
  local Colors = require("hokusai.colors")
  local bg = vim.o.background
  local style_bg = Colors.background(opts.style)

  if bg ~= style_bg then
    if vim.g.colors_name == "hokusai-" .. opts.style then
      -- the background was changed after loading, so switch to the matching style
      opts.style = bg == "light" and (M.styles.light or opts.light_style or "lotus")
        or (M.styles.dark or config.options.style or "wave")
      if Colors.background(opts.style) ~= bg then
        opts.style = bg == "light" and "lotus" or "wave"
      end
    else
      vim.o.background = style_bg
    end
  end
  M.styles[vim.o.background] = opts.style
  return require("hokusai.theme").setup(opts)
end

M.setup = config.setup

return M

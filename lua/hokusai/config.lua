local M = {}

M.version = "0.1.0" -- x-release-please-version

---@class hokusai.Config
---@field on_colors fun(colors: ColorScheme)
---@field on_highlights fun(highlights: hokusai.Highlights, colors: ColorScheme)
M.defaults = {
  -- The theme comes in seven styles:
  --   Kanagawa: `wave` (dark), `dragon` (dark), `lotus` (light)
  --   Kansō:    `zen` (dark), `ink` (dark), `mist` (dark), `pearl` (light)
  style = "wave",
  light_style = "lotus", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    types = {},
    -- Background styles. Can be "auto", "dark", "transparent" or "normal"
    -- "auto" uses the variant's own look: layered ("dark") for Kanagawa variants,
    -- flat ("normal") for Kansō variants.
    sidebars = "auto", -- style for sidebars, see below
    floats = "auto", -- style for floating windows
  },
  -- "default" or "saturated". Can also be a table: { dark = "default", light = "saturated" }
  -- Saturated mode boosts the saturation of syntax colors while keeping the backgrounds.
  foreground = "default",
  minimal = false, -- Reduced syntax color palette for a more minimal look
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights hokusai.Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,

  cache = true, -- When set to true, the theme will be cached for better performance

  ---@type table<string, boolean|{enabled:boolean}>
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses your plugin manager to automatically enable needed plugins
    -- currently only lazy.nvim is supported
    auto = true,
    -- add any plugins here that you want to enable
    -- for all possible plugins, see:
    --   * https://github.com/HenrikStanley/hokusai.nvim/tree/main/lua/hokusai/groups
    -- telescope = true,
  },
}

---@type hokusai.Config
M.options = nil

---@param options? hokusai.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? hokusai.Config
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})

return M

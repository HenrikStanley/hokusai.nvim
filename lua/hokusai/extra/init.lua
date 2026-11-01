local Util = require("hokusai.util")

local M = {}

-- map of plugin name to plugin extension
--- @type table<string, {ext:string, url:string, label:string, subdir?: string, sep?:string}>
-- stylua: ignore
M.extras = {
  delta    = { ext = "gitconfig", url = "https://github.com/dandavison/delta", label = "Delta" },
  eza      = { ext = "yml", url = "https://eza.rocks", label = "eza" },
  fish     = { ext = "fish", url = "https://fishshell.com/docs/current/index.html", label = "Fish" },
  fzf      = { ext = "sh", url = "https://github.com/junegunn/fzf", label = "Fzf" },
  ghostty  = { ext = "", url = "https://github.com/ghostty-org/ghostty", label = "Ghostty" },
  lazygit  = { ext = "yml", url = "https://github.com/jesseduffield/lazygit", label = "Lazygit" },
  lua      = { ext = "lua", url = "https://www.lua.org", label = "Lua Table for testing" },
  opencode = { ext = "json", url = "https://github.com/sst/opencode", label = "opencode" },
  yazi     = { ext = "toml", url = "https://github.com/sxyazi/yazi", label = "Yazi" },
}

function M.setup()
  local hokusai = require("hokusai.theme")
  local Colors = require("hokusai.colors")

  ---@type string[]
  local names = vim.tbl_keys(M.extras)
  table.sort(names)

  for _, extra in ipairs(names) do
    local info = M.extras[extra]
    local plugin = require("hokusai.extra." .. extra)
    for _, style in ipairs(Colors.variants) do
      vim.o.background = Colors.background(style)
      local colors, groups, opts = hokusai.setup({ style = style, plugins = { all = true }, cache = false })
      local fname = extra
        .. (info.subdir and "/" .. info.subdir .. "/" or "")
        .. "/hokusai"
        .. (info.sep or "_")
        .. style
        .. "."
        .. info.ext
      fname = string.gsub(fname, "%.$", "") -- remove trailing dot when no extension
      colors["_upstream_url"] = "https://github.com/HenrikStanley/hokusai.nvim/raw/main/extras/" .. fname
      colors["_style_name"] = "Hokusai " .. style:sub(1, 1):upper() .. style:sub(2)
      colors["_name"] = "hokusai_" .. style
      colors["_style"] = style
      print("[write] " .. fname)
      Util.write("extras/" .. fname, plugin.generate(colors, groups, opts))
    end
  end
end
M.setup()

return M

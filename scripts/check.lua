-- Usage: nvim --headless -u NONE -l scripts/check.lua
-- Loads every variant/foreground/minimal combination with all plugins enabled
-- and verifies that every highlight group resolves to valid colors.
vim.opt.rtp:prepend(vim.fn.getcwd())

local Colors = require("hokusai.colors")
local errors = {} ---@type string[]
local count = 0

local function valid(v)
  return v == nil or v == "NONE" or (type(v) == "string" and v:match("^#%x%x%x%x%x%x$") ~= nil)
end

for _, style in ipairs(Colors.variants) do
  for _, foreground in ipairs({ "default", "saturated" }) do
    for _, minimal in ipairs({ false, true }) do
      for _, ui in ipairs({ "auto", "dark", "normal", "transparent" }) do
        require("hokusai").setup({
          style = style,
          foreground = foreground,
          minimal = minimal,
          cache = false,
          plugins = { all = true },
          styles = { sidebars = ui, floats = ui },
        })
        local ok, err = pcall(function()
          local _, groups = require("hokusai.theme").setup()
          for name, hl in pairs(groups) do
            count = count + 1
            if type(hl) == "table" then
              for _, key in ipairs({ "fg", "bg", "sp" }) do
                if not valid(hl[key]) then
                  errors[#errors + 1] = ("%s/%s/%s: %s.%s = %s"):format(
                    style,
                    foreground,
                    tostring(minimal),
                    name,
                    key,
                    vim.inspect(hl[key])
                  )
                end
              end
            elseif type(hl) ~= "string" then
              errors[#errors + 1] = ("%s: %s has invalid type %s"):format(style, name, type(hl))
            end
          end
        end)
        if not ok then
          errors[#errors + 1] = ("%s/%s/%s/%s: %s"):format(style, foreground, tostring(minimal), ui, err)
        end
      end
    end
  end
end

local seen = {}
for _, e in ipairs(errors) do
  if not seen[e] then
    seen[e] = true
    print(e)
  end
end
print(("checked %d highlights, %d errors"):format(count, vim.tbl_count(seen)))
if #errors > 0 then
  os.exit(1)
end

local M = {}

-- top-level ColorScheme keys that should not end up in the opencode defs
local skip = { palette = true, meta = true, term = true, rainbow = true, none = true }

--- Flattens the ColorScheme into `defs`. Nested tables are joined with `_`,
--- e.g. `ui.pmenu.bg` becomes `ui_pmenu_bg`.
--- @param colors ColorScheme
--- @return table<string, string>
local function generate_defs(colors)
  local defs = {} ---@type table<string, string>
  local function walk(prefix, t)
    for k, v in pairs(t) do
      local key = prefix and (prefix .. "_" .. k) or k
      if type(v) == "string" and v:match("^#%x+$") then
        defs[key] = v
      elseif type(v) == "table" then
        walk(key, v)
      end
    end
  end
  for k, v in pairs(colors) do
    if type(k) == "string" and not skip[k] and not k:match("^_") then
      walk(nil, { [k] = v })
    end
  end
  return defs
end

-- opencode theme key -> def name
-- stylua: ignore
M.theme = {
  primary                 = "syn_fun",
  secondary               = "syn_keyword",
  accent                  = "syn_constant",
  error                   = "diag_error",
  warning                 = "diag_warning",
  success                 = "diag_ok",
  info                    = "diag_info",
  text                    = "ui_fg",
  textMuted               = "ui_fg_dim",
  background              = "ui_bg",
  backgroundPanel         = "bg_dark",
  backgroundElement       = "ui_bg_p1",
  border                  = "ui_bg_p2",
  borderActive            = "syn_fun",
  borderSubtle            = "ui_bg_p1",
  diffAdded               = "vcs_added",
  diffRemoved             = "vcs_removed",
  diffContext             = "syn_comment",
  diffHunkHeader          = "syn_comment",
  diffHighlightAdded      = "vcs_added",
  diffHighlightRemoved    = "vcs_removed",
  diffAddedBg             = "diff_add",
  diffRemovedBg           = "diff_delete",
  diffContextBg           = "bg_dark",
  diffLineNumber          = "ui_nontext",
  diffAddedLineNumberBg   = "diff_add",
  diffRemovedLineNumberBg = "diff_delete",
  markdownText            = "ui_fg",
  markdownHeading         = "syn_fun",
  markdownLink            = "syn_special1",
  markdownLinkText        = "syn_type",
  markdownCode            = "syn_string",
  markdownBlockQuote      = "syn_parameter",
  markdownEmph            = "syn_identifier",
  markdownStrong          = "syn_constant",
  markdownHorizontalRule  = "ui_nontext",
  markdownListItem        = "syn_special1",
  markdownListEnumeration = "syn_constant",
  markdownImage           = "syn_special1",
  markdownImageText       = "syn_type",
  markdownCodeBlock       = "ui_fg",
  syntaxComment           = "syn_comment",
  syntaxKeyword           = "syn_keyword",
  syntaxFunction          = "syn_fun",
  syntaxVariable          = "ui_fg",
  syntaxString            = "syn_string",
  syntaxNumber            = "syn_number",
  syntaxType              = "syn_type",
  syntaxOperator          = "syn_operator",
  syntaxPunctuation       = "syn_punct",
}

---@param t table<string, string>
---@param indent string
---@param value fun(key: string, v: string): string
local function json_object(t, indent, value)
  local keys = vim.tbl_keys(t)
  table.sort(keys)
  local lines = {}
  for _, k in ipairs(keys) do
    lines[#lines + 1] = ('%s"%s": %s'):format(indent, k, value(k, t[k]))
  end
  return table.concat(lines, ",\n")
end

--- @param colors ColorScheme
function M.generate(colors)
  local defs = generate_defs(colors)
  for key, def in pairs(M.theme) do
    assert(defs[def], ("opencode: unknown def `%s` for `%s`"):format(def, key))
  end

  local defs_json = json_object(defs, "    ", function(_, v)
    return ('"%s"'):format(v)
  end)
  local theme_json = json_object(M.theme, "    ", function(_, def)
    return ('{\n      "dark": "%s",\n      "light": "%s"\n    }'):format(def, def)
  end)

  return ([[{
  "$schema": "https://opencode.ai/theme.json",
  "defs": {
%s
  },
  "theme": {
%s
  }
}
]]):format(defs_json, theme_json)
end

return M

# Contributing to Hokusai

## Project Layout

```
colors/                     -- :colorscheme entry points (hokusai, hokusai-<variant>)
lua/hokusai/
  palette.lua               -- every raw named color (Kanagawa + Kansō + saturated)
  colors/<variant>.lua      -- variant definition: palette -> semantic colors
  colors/init.lua           -- builds the ColorScheme (derived colors, sidebars/floats, ...)
  groups/init.lua           -- plugin registry, auto-detection and caching
  groups/editor.lua         -- core UI groups
  groups/syntax.lua         -- legacy syntax groups
  groups/treesitter.lua     -- treesitter captures
  groups/semantic_tokens.lua-- LSP semantic tokens
  groups/kinds.lua          -- LSP/completion kinds
  groups/<plugin>.lua       -- one file per plugin
  extra/<tool>.lua          -- extras generators
lua/lualine, lua/lightline, lua/barbecue -- statusline/winbar themes
```

## Adding Plugin Support

Each plugin gets its own file in `lua/hokusai/groups/`. Adding support for a
plugin needs two steps.

### 1. Create the group file

`lua/hokusai/groups/my-plugin.lua`:

```lua
local M = {}

M.url = "https://github.com/author/my-plugin.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MyPluginNormal    = { fg = c.fg_float, bg = c.bg_float },
    MyPluginBorder    = "FloatBorder", -- a string links to another group
    MyPluginTitle     = { fg = c.ui.special, bold = true },
    MyPluginDirectory = "Directory",
    MyPluginAdded     = { fg = c.vcs.added },
    MyPluginError     = { fg = c.diag.error },
    MyPluginMatch     = { fg = c.syn.fun, bold = true },
  }
end

return M
```

### 2. Register it

Add the plugin to `M.plugins` in [`lua/hokusai/groups/init.lua`](lua/hokusai/groups/init.lua).
The key is the plugin's name as lazy.nvim knows it, which is usually the repository name:

```lua
["my-plugin.nvim"] = "my-plugin",
```

With lazy.nvim, the group then loads automatically whenever the plugin is installed.

### Choosing colors

Prefer **semantic** colors so a plugin looks right in every variant:

| Purpose                         | Use                                                       |
| ------------------------------- | --------------------------------------------------------- |
| Normal text / dimmed text       | `c.ui.fg`, `c.ui.fg_dim`                                  |
| Backgrounds                     | `c.ui.bg`, `c.ui.bg_p1` (raised), `c.ui.bg_p2` (cursorline) |
| Floats, sidebars, statusline    | `c.bg_float`, `c.bg_sidebar`, `c.bg_statusline`, `c.fg_float`, `c.fg_sidebar` |
| Borders                         | `c.border_highlight` (floats), `c.border` (splits)        |
| Subtle / muted text             | `c.syn.comment`, `c.ui.nontext`, `c.ui.special`           |
| Selection / search              | `c.ui.bg_visual`, `c.ui.bg_search`                        |
| Diagnostics                     | `c.diag.error`, `c.diag.warning`, `c.diag.info`, `c.diag.hint`, `c.diag.ok` |
| Git status                      | `c.vcs.added`, `c.vcs.changed`, `c.vcs.removed`, `c.vcs.untracked` |
| Diff backgrounds                | `c.diff.add`, `c.diff.change`, `c.diff.delete`, `c.diff.text` |
| Code-like things                | `c.syn.fun`, `c.syn.keyword`, `c.syn.type`, `c.syn.string`, `c.syn.constant`, ... |
| Indent guides                   | `c.ui.indent`, `c.ui.indent_active`                       |
| Hue-specific (icons, rainbows)  | `c.accent.red`, `.orange`, `.yellow`, `.green`, `.aqua`, `.teal`, `.cyan`, `.blue`, `.violet`, `.pink` |
| No color                        | `c.none`                                                  |

Tips:

- Linking to an existing group (`"Directory"`, `"FloatBorder"`, `"CursorLine"`) is
  often the best choice.
- Respect `opts.transparent` for backgrounds that should disappear, e.g.
  `bg = opts.transparent and c.none or c.ui.bg_p1`.
- Text drawn on a colored background (labels, badges) should use a dark foreground
  such as `c.ui.bg` or `c.ui.bg_m3`.
- `Util.blend_bg(color, amount)` mixes a color with the background, which is useful
  for subtle tinted backgrounds.

## Adding a Variant

1. Add any new raw colors to `lua/hokusai/palette.lua`. If saturated mode should
   change a color, also add `<name>Saturated`.
2. Create `lua/hokusai/colors/<name>.lua` that returns `function(p, s)`.
   `p` is the palette and `s` is the saturated view of it. Use `s.*` for syntax colors.
3. Add the name to `M.variants` in `lua/hokusai/colors/init.lua`, and to
   `M.background` if it is a light variant.
4. Add `colors/hokusai-<name>.lua` and `lua/lualine/themes/hokusai-<name>.lua`.

## Adding Extras

Extras are generated from the ColorScheme with `util.template()`, which supports
nested keys such as `${ui.bg}`, `${syn.keyword}` or `${terminal.red_bright}`.

1. Create `lua/hokusai/extra/<tool>.lua` with a `M.generate(colors, groups, opts)`
   function that returns the file contents.
2. Register it in `M.extras` in `lua/hokusai/extra/init.lua`.
3. Run `./scripts/build` to generate one file per variant in `extras/<tool>/`.

## Checks

```sh
./scripts/test     # test suite (mini.test via lazy.nvim)
nvim --headless -u NONE -l scripts/check.lua   # every variant/mode resolves to valid colors
./scripts/build    # regenerate extras
./scripts/docs     # regenerate README tables and vimdoc
```

`scripts/fidelity.lua` compares the core highlight groups against the original
Kanagawa and Kansō themes:

```sh
git clone --depth 1 https://github.com/rebelot/kanagawa.nvim /tmp/ref/kanagawa.nvim
git clone --depth 1 https://github.com/webhooked/kanso.nvim /tmp/ref/kanso.nvim
nvim --headless -u NONE -l scripts/fidelity.lua /tmp/ref
```

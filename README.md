# 🌊 Hokusai

A Neovim colorscheme named after the Japanese painter Katsushika Hokusai.
It combines the palettes of [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
and [Kansō](https://github.com/webhooked/kanso.nvim) with broad plugin support,
caching and extras generation.

## ✨ Features

- 🎨 Seven variants: **wave**, **dragon** and **lotus** from Kanagawa;
  **zen**, **ink**, **mist** and **pearl** from Kansō
- 🧠 A semantic color layer (`ui`, `syn`, `diag`, `vcs`, `diff`, `accent`), so code
  highlighting stays faithful to the original themes
- 🔆 **Saturated** foreground mode for every variant
- 🎯 **Minimal** mode with a reduced syntax palette
- 🔌 Support for 70+ plugins, enabled automatically when using
  [lazy.nvim](https://github.com/folke/lazy.nvim)
- ⚡ Highlight caching for fast startup
- 🧩 Generated themes for terminals and CLI tools ([extras](#-extras))
- 📊 Themes for [lualine](https://github.com/nvim-lualine/lualine.nvim),
  [lightline](https://github.com/itchyny/lightline.vim) and
  [barbecue](https://github.com/utilyre/barbecue.nvim)

## 🎨 Variants

| Variant  | Origin   | Background | Character                         | UI style  |
| -------- | -------- | ---------- | --------------------------------- | --------- |
| `wave`   | Kanagawa | dark       | Indigo ink, vivid (default dark)  | layered   |
| `dragon` | Kanagawa | dark       | Warm black, muted                 | layered   |
| `lotus`  | Kanagawa | light      | Warm parchment (default light)    | layered   |
| `zen`    | Kansō    | dark       | Near-black, deep and rich         | flat      |
| `ink`    | Kansō    | dark       | Balanced                          | flat      |
| `mist`   | Kansō    | dark       | Soft and muted                    | flat      |
| `pearl`  | Kansō    | light      | Neutral light                     | flat      |

_Layered_ variants give floats and sidebars a darker background.
_Flat_ variants keep everything on the editor background and separate it with borders.
Change this with `styles.sidebars` and `styles.floats`.

## 🔌 Supported Plugins

<!-- plugins:start -->

| Plugin | Source |
| --- | --- |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | [`aerial`](lua/hokusai/groups/aerial.lua) |
| [ale](https://github.com/dense-analysis/ale) | [`ale`](lua/hokusai/groups/ale.lua) |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | [`alpha`](lua/hokusai/groups/alpha.lua) |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim) | [`barbar`](lua/hokusai/groups/barbar.lua) |
| [blink.cmp](https://github.com/Saghen/blink.cmp) | [`blink`](lua/hokusai/groups/blink.lua) |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | [`bufferline`](lua/hokusai/groups/bufferline.lua) |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | [`cmp`](lua/hokusai/groups/cmp.lua) |
| [codeium.nvim](https://github.com/Exafunction/codeium.nvim) | [`codeium`](lua/hokusai/groups/codeium.lua) |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | [`copilot`](lua/hokusai/groups/copilot.lua) |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | [`dap`](lua/hokusai/groups/dap.lua) |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | [`dashboard`](lua/hokusai/groups/dashboard.lua) |
| [flash.nvim](https://github.com/folke/flash.nvim) | [`flash`](lua/hokusai/groups/flash.lua) |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | [`fzf`](lua/hokusai/groups/fzf.lua) |
| [vim-gitgutter](https://github.com/airblade/vim-gitgutter) | [`gitgutter`](lua/hokusai/groups/gitgutter.lua) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | [`gitsigns`](lua/hokusai/groups/gitsigns.lua) |
| [glyph-palette.vim](https://github.com/lambdalisue/glyph-palette.vim) | [`glyph-palette`](lua/hokusai/groups/glyph-palette.lua) |
| [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) | [`grug-far`](lua/hokusai/groups/grug-far.lua) |
| [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim) | [`headlines`](lua/hokusai/groups/headlines.lua) |
| [hop.nvim](https://github.com/phaazon/hop.nvim) | [`hop`](lua/hokusai/groups/hop.lua) |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) | [`illuminate`](lua/hokusai/groups/illuminate.lua) |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | [`indent-blankline`](lua/hokusai/groups/indent-blankline.lua) |
| [indentmini.nvim](https://github.com/nvimdev/indentmini.nvim) | [`indentmini`](lua/hokusai/groups/indentmini.lua) |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | [`lazy`](lua/hokusai/groups/lazy.lua) |
| [leap.nvim](https://github.com/ggandor/leap.nvim) | [`leap`](lua/hokusai/groups/leap.lua) |
| [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) | [`lspsaga`](lua/hokusai/groups/lspsaga.lua) |
| [mini.animate](https://github.com/echasnovski/mini.animate) | [`mini_animate`](lua/hokusai/groups/mini_animate.lua) |
| [mini.clue](https://github.com/echasnovski/mini.clue) | [`mini_clue`](lua/hokusai/groups/mini_clue.lua) |
| [mini.completion](https://github.com/echasnovski/mini.completion) | [`mini_completion`](lua/hokusai/groups/mini_completion.lua) |
| [mini.cursorword](https://github.com/echasnovski/mini.cursorword) | [`mini_cursorword`](lua/hokusai/groups/mini_cursorword.lua) |
| [mini.deps](https://github.com/echasnovski/mini.deps) | [`mini_deps`](lua/hokusai/groups/mini_deps.lua) |
| [mini.diff](https://github.com/echasnovski/mini.diff) | [`mini_diff`](lua/hokusai/groups/mini_diff.lua) |
| [mini.files](https://github.com/echasnovski/mini.files) | [`mini_files`](lua/hokusai/groups/mini_files.lua) |
| [mini.hipatterns](https://github.com/echasnovski/mini.hipatterns) | [`mini_hipatterns`](lua/hokusai/groups/mini_hipatterns.lua) |
| [mini.icons](https://github.com/echasnovski/mini.icons) | [`mini_icons`](lua/hokusai/groups/mini_icons.lua) |
| [mini.indentscope](https://github.com/echasnovski/mini.indentscope) | [`mini_indentscope`](lua/hokusai/groups/mini_indentscope.lua) |
| [mini.jump](https://github.com/echasnovski/mini.jump) | [`mini_jump`](lua/hokusai/groups/mini_jump.lua) |
| [mini.map](https://github.com/echasnovski/mini.map) | [`mini_map`](lua/hokusai/groups/mini_map.lua) |
| [mini.notify](https://github.com/echasnovski/mini.notify) | [`mini_notify`](lua/hokusai/groups/mini_notify.lua) |
| [mini.operators](https://github.com/echasnovski/mini.operators) | [`mini_operators`](lua/hokusai/groups/mini_operators.lua) |
| [mini.pick](https://github.com/echasnovski/mini.pick) | [`mini_pick`](lua/hokusai/groups/mini_pick.lua) |
| [mini.starter](https://github.com/echasnovski/mini.starter) | [`mini_starter`](lua/hokusai/groups/mini_starter.lua) |
| [mini.statusline](https://github.com/echasnovski/mini.statusline) | [`mini_statusline`](lua/hokusai/groups/mini_statusline.lua) |
| [mini.surround](https://github.com/echasnovski/mini.surround) | [`mini_surround`](lua/hokusai/groups/mini_surround.lua) |
| [mini.tabline](https://github.com/echasnovski/mini.tabline) | [`mini_tabline`](lua/hokusai/groups/mini_tabline.lua) |
| [mini.test](https://github.com/echasnovski/mini.test) | [`mini_test`](lua/hokusai/groups/mini_test.lua) |
| [mini.trailspace](https://github.com/echasnovski/mini.trailspace) | [`mini_trailspace`](lua/hokusai/groups/mini_trailspace.lua) |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) | [`navic`](lua/hokusai/groups/navic.lua) |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | [`neo-tree`](lua/hokusai/groups/neo-tree.lua) |
| [neogit](https://github.com/TimUntersberger/neogit) | [`neogit`](lua/hokusai/groups/neogit.lua) |
| [neotest](https://github.com/nvim-neotest/neotest) | [`neotest`](lua/hokusai/groups/neotest.lua) |
| [noice.nvim](https://github.com/folke/noice.nvim) | [`noice`](lua/hokusai/groups/noice.lua) |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | [`notify`](lua/hokusai/groups/notify.lua) |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) | [`nvim-tree`](lua/hokusai/groups/nvim-tree.lua) |
| [octo.nvim](https://github.com/pwntester/octo.nvim) | [`octo`](lua/hokusai/groups/octo.lua) |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | [`oil`](lua/hokusai/groups/oil.lua) |
| [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) | [`rainbow`](lua/hokusai/groups/rainbow.lua) |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | [`render-markdown`](lua/hokusai/groups/render-markdown.lua) |
| [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) | [`scrollbar`](lua/hokusai/groups/scrollbar.lua) |
| [sidekick.nvim](https://github.com/folke/sidekick.nvim) | [`sidekick`](lua/hokusai/groups/sidekick.lua) |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | [`snacks`](lua/hokusai/groups/snacks.lua) |
| [vim-sneak](https://github.com/justinmk/vim-sneak) | [`sneak`](lua/hokusai/groups/sneak.lua) |
| [supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) | [`supermaven`](lua/hokusai/groups/supermaven.lua) |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | [`telescope`](lua/hokusai/groups/telescope.lua) |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | [`treesitter-context`](lua/hokusai/groups/treesitter-context.lua) |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | [`trouble`](lua/hokusai/groups/trouble.lua) |
| [vimwiki](https://github.com/vimwiki/vimwiki) | [`vimwiki`](lua/hokusai/groups/vimwiki.lua) |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | [`which-key`](lua/hokusai/groups/which-key.lua) |
| [yanky.nvim](https://github.com/gbprod/yanky.nvim) | [`yanky`](lua/hokusai/groups/yanky.lua) |

<!-- plugins:end -->

## 🍭 Extras

<!-- extras:start -->

| Tool | Extra |
| --- | --- |
| [Delta](https://github.com/dandavison/delta) | [extras/delta](extras/delta) |
| [eza](https://eza.rocks) | [extras/eza](extras/eza) |
| [Fish](https://fishshell.com/docs/current/index.html) | [extras/fish](extras/fish) |
| [Fzf](https://github.com/junegunn/fzf) | [extras/fzf](extras/fzf) |
| [Ghostty](https://github.com/ghostty-org/ghostty) | [extras/ghostty](extras/ghostty) |
| [Lazygit](https://github.com/jesseduffield/lazygit) | [extras/lazygit](extras/lazygit) |
| [Lua Table for testing](https://www.lua.org) | [extras/lua](extras/lua) |
| [opencode](https://github.com/sst/opencode) | [extras/opencode](extras/opencode) |
| [Yazi](https://github.com/sxyazi/yazi) | [extras/yazi](extras/yazi) |

<!-- extras:end -->

## ⚡️ Requirements

- Neovim >= 0.8.0
- A terminal with true color and undercurl support

## 📦 Installation

```lua
{
  "HenrikStanley/hokusai.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

## 🚀 Usage

```vim
colorscheme hokusai
```

`:colorscheme hokusai` uses `style` when `background=dark` and `light_style`
when `background=light`. To load a specific variant, use
`hokusai-wave`, `hokusai-dragon`, `hokusai-lotus`, `hokusai-zen`, `hokusai-ink`,
`hokusai-mist` or `hokusai-pearl`.

Changing `vim.o.background` while Hokusai is active switches between your dark
and light variants.

### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

```lua
require("lualine").setup({
  options = {
    -- follows the active variant; or use e.g. "hokusai-dragon"
    theme = "hokusai",
  },
})
```

### [Lightline](https://github.com/itchyny/lightline.vim)

```vim
let g:lightline = {'colorscheme': 'hokusai'}
```

### [Barbecue](https://github.com/utilyre/barbecue.nvim)

```lua
require("barbecue").setup({ theme = "hokusai" })
```

## ⚙️ Configuration

> [!IMPORTANT]
> Call `setup` **before** loading the colorscheme.

<details>
  <summary>Default Options</summary>

<!-- config:start -->

```lua
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
```

<!-- config:end -->

</details>

### Saturated foreground

```lua
require("hokusai").setup({
  foreground = "saturated",
  -- or per background:
  -- foreground = { dark = "default", light = "saturated" },
})
```

### Minimal mode

```lua
require("hokusai").setup({ minimal = true })
```

## 🪓 Overriding Colors & Highlight Groups

The `ColorScheme` passed to `on_colors` and `on_highlights` contains:

| Key            | Contents                                                                |
| -------------- | ----------------------------------------------------------------------- |
| `c.ui`         | `fg`, `fg_dim`, `bg`, `bg_m3`…`bg_p2`, `bg_visual`, `pmenu`, `float`, … |
| `c.syn`        | `string`, `keyword`, `fun`, `type`, `constant`, `comment`, …            |
| `c.diag`       | `error`, `warning`, `info`, `hint`, `ok`                                |
| `c.vcs`        | `added`, `removed`, `changed`, `untracked`                              |
| `c.diff`       | `add`, `delete`, `change`, `text`                                       |
| `c.accent`     | `red`, `orange`, `yellow`, `green`, `aqua`, `teal`, `cyan`, `blue`, `violet`, `pink` |
| `c.term`       | the 16 ANSI colors + 2 extended colors                                  |
| `c.palette`    | every raw named color, e.g. `c.palette.sumiInk3`                        |
| derived        | `c.bg_float`, `c.bg_sidebar`, `c.bg_statusline`, `c.border`, …          |

See [`lua/hokusai/types.lua`](lua/hokusai/types.lua) for the full definition.

```lua
require("hokusai").setup({
  on_colors = function(c)
    c.syn.comment = c.palette.oldWhite
    c.ui.bg_gutter = c.none -- no gutter background on Kanagawa variants
  end,
  on_highlights = function(hl, c)
    hl.WinSeparator = { fg = c.ui.bg_p2 }
    hl.TelescopeBorder = { fg = c.syn.fun, bg = c.bg_float }
  end,
})
```

To reuse the colors elsewhere:

```lua
local colors = require("hokusai.colors").setup({ style = "dragon" })
```

## 🧩 Adding Plugin Support

See [CONTRIBUTING.md](CONTRIBUTING.md).

## 💎 Credits

Hokusai builds on these projects:

- [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) by Tommaso Laurenzi (MIT):
  the wave, dragon and lotus palettes and theme mappings
- [kanso.nvim](https://github.com/webhooked/kanso.nvim) by Webhooked (MIT):
  the zen, ink, mist and pearl palettes, the saturated and minimal modes
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) by Folke Lemaitre (Apache-2.0):
  the plugin architecture

See [NOTICE](NOTICE) for full attribution and license texts.

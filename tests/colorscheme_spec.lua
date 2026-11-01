local Config = require("hokusai.config")
local Init = require("hokusai")

before_each(function()
  vim.o.background = "dark"
  vim.cmd.colorscheme("default")
  Config.setup()
  Init.styles = {}
end)

it("did proper init", function()
  assert.same({}, Init.styles)
  assert.same("default", vim.g.colors_name)
  assert.same("dark", vim.o.background)
end)

describe("loading respects vim.o.background", function()
  it("= dark", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("hokusai")
    assert.same("dark", vim.o.background)
    assert.same("hokusai-wave", vim.g.colors_name)
  end)

  it("= light", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("hokusai")
    assert.same("light", vim.o.background)
    assert.same("hokusai-lotus", vim.g.colors_name)
  end)

  it("= dark with dragon", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("hokusai-dragon")
    assert.same("dark", vim.o.background)
    assert.same("hokusai-dragon", vim.g.colors_name)
  end)

  it("= dark with lotus", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("hokusai-lotus")
    assert.same("light", vim.o.background)
    assert.same("hokusai-lotus", vim.g.colors_name)
  end)

  it("= light with zen", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("hokusai-zen")
    assert.same("dark", vim.o.background)
    assert.same("hokusai-zen", vim.g.colors_name)
  end)

  it("= light with pearl", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("hokusai-pearl")
    assert.same("light", vim.o.background)
    assert.same("hokusai-pearl", vim.g.colors_name)
  end)

  it(" and switches to light", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("hokusai-dragon")
    vim.o.background = "light"
    assert.same("light", vim.o.background)
    assert.same("hokusai-lotus", vim.g.colors_name)
  end)

  it(" and switches to the configured light style", function()
    Config.setup({ light_style = "pearl" })
    vim.o.background = "dark"
    vim.cmd.colorscheme("hokusai")
    vim.o.background = "light"
    assert.same("light", vim.o.background)
    assert.same("hokusai-pearl", vim.g.colors_name)
  end)

  it(" and switches to dark", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("hokusai")
    vim.o.background = "dark"
    assert.same("dark", vim.o.background)
    assert.same("hokusai-wave", vim.g.colors_name)
  end)

  it(" and remembers dark", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("hokusai-ink")
    vim.o.background = "light"
    vim.o.background = "dark"
    assert.same("dark", vim.o.background)
    assert.same("hokusai-ink", vim.g.colors_name)
  end)
end)

describe("variants", function()
  local Colors = require("hokusai.colors")

  for _, style in ipairs(Colors.variants) do
    it(style .. " loads", function()
      vim.cmd.colorscheme("hokusai-" .. style)
      assert.same("hokusai-" .. style, vim.g.colors_name)
      assert.same(Colors.background(style), vim.o.background)
      local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
      assert.is_not_nil(normal.fg)
      assert.is_not_nil(normal.bg)
    end)
  end

  it("wave matches kanagawa", function()
    local c = Colors.setup({ style = "wave" })
    assert.same("#1F1F28", c.ui.bg)
    assert.same("#DCD7BA", c.ui.fg)
    assert.same("#957FB8", c.syn.keyword)
    assert.same("#7E9CD8", c.syn.fun)
  end)

  it("zen matches kanso", function()
    local c = Colors.setup({ style = "zen" })
    assert.same("#090E13", c.ui.bg)
    assert.same("#C5C9C7", c.ui.fg)
    assert.same("#8992a7", c.syn.keyword)
  end)

  it("saturated foreground changes syntax colors only", function()
    local d = Colors.setup({ style = "ink" })
    local s = Colors.setup({ style = "ink", foreground = "saturated" })
    assert.same(d.ui.bg, s.ui.bg)
    assert.same(d.diag.error, s.diag.error)
    assert.are_not.same(d.syn.string, s.syn.string)
    assert.same("#7F9F6E", s.syn.string)
  end)

  it("saturated foreground per background", function()
    local s = Colors.setup({ style = "wave", foreground = { dark = "saturated", light = "default" } })
    local l = Colors.setup({ style = "lotus", foreground = { dark = "saturated", light = "default" } })
    assert.same("saturated", s.foreground)
    assert.same("default", l.foreground)
  end)

  it("auto sidebar/float style follows the variant", function()
    local wave = Colors.setup({ style = "wave" })
    local zen = Colors.setup({ style = "zen" })
    assert.same(wave.ui.bg_m3, wave.bg_float)
    assert.same(zen.ui.bg, zen.bg_float)
  end)
end)

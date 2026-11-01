local opts = require("hokusai.config").options
require("hokusai").load({
  style = vim.o.background == "light" and (opts.light_style or "lotus") or nil,
})

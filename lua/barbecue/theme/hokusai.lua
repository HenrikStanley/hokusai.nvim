local style = (vim.g.colors_name or ""):match("^hokusai%-(%w+)$")
local c = require("hokusai.colors").setup({ style = style })

local M = {
  normal = { bg = c.none, fg = c.ui.fg_dim },

  ellipsis = { fg = c.ui.special },
  separator = { fg = c.ui.special },
  modified = { fg = c.diag.warning },

  dirname = { fg = c.ui.special },
  basename = { fg = c.ui.fg_dim, bold = true },
  context = { fg = c.ui.fg_dim },

  context_file = { fg = c.ui.fg_dim },
  context_module = { fg = c.syn.type },
  context_namespace = { fg = c.syn.type },
  context_package = { fg = c.syn.type },
  context_class = { fg = c.syn.type },
  context_method = { fg = c.syn.fun },
  context_property = { fg = c.syn.identifier },
  context_field = { fg = c.syn.identifier },
  context_constructor = { fg = c.syn.special1 },
  context_enum = { fg = c.syn.type },
  context_interface = { fg = c.syn.type },
  context_function = { fg = c.syn.fun },
  context_variable = { fg = c.ui.fg },
  context_constant = { fg = c.syn.constant },
  context_string = { fg = c.syn.string },
  context_number = { fg = c.syn.number },
  context_boolean = { fg = c.syn.constant },
  context_array = { fg = c.syn.type },
  context_object = { fg = c.syn.type },
  context_key = { fg = c.syn.identifier },
  context_null = { fg = c.syn.constant },
  context_enum_member = { fg = c.syn.constant },
  context_struct = { fg = c.syn.type },
  context_event = { fg = c.syn.type },
  context_operator = { fg = c.syn.operator },
  context_type_parameter = { fg = c.syn.type },
}

return M

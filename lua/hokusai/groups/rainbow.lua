local M = {}

M.url = "https://github.com/HiPhish/rainbow-delimiters.nvim"

---@type hokusai.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- rainbow-delimiters
    RainbowDelimiterRed    = { fg = c.accent.red },
    RainbowDelimiterOrange = { fg = c.accent.orange },
    RainbowDelimiterYellow = { fg = c.accent.yellow },
    RainbowDelimiterGreen  = { fg = c.accent.green },
    RainbowDelimiterBlue   = { fg = c.accent.blue },
    RainbowDelimiterViolet = { fg = c.accent.violet },
    RainbowDelimiterCyan   = { fg = c.accent.cyan },
  }
end

return M

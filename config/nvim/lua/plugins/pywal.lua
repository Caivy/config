return {
  "uZer/pywal16.nvim",
  lazy = false,
  priority = 1000,
  as = "pywal16",
  config = function()
    local pywal16 = require("pywal16")
    pywal16.setup()
    vim.cmd([[colorscheme pywal16]])
  end,
}

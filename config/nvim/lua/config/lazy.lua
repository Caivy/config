local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- import/override with your plugins
    { "folke/ts-comments.nvim", enabled = false },
    { "goolord/alpha-nvim", enabled = false },
    -- { "folke/tokyonight.nvim", enabled = false },
    { "catppuccin/nvim", enabled = false },
    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
    -- { "stevearc/dressing.nvim", enabled = false },
    { import = "plugins" },
    { import = "lazyvim.plugins.extras.lang.json" },
    -- { "folke/trouble.nvim", enabled = false },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  -- We don't need to specify pywal16 as it's already in the config
  -- install = {
  --   colorscheme = { "pywal16" },
  -- },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

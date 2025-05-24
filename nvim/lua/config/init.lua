local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.swapfile = false
vim.fn.setfiletype({ "move" })
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.keymaps")
-- require("config.autocmds")
require("config.helpers")
require("noice").setup({ enabled = false })
require("snacks").setup({ image = { enabled = false } })
require("lspconfig").sqls.setup({})
-- Optional, you don't have to run setup.
-- v
require("transparent").setup({
  --
  groups = {
    "Normal",
    "NormalNC",
    "Comment",
    "Constant",
    "Special",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Underlined",
    "Todo",
    "String",
    "Function",
    "Conditional",
    "Repeat",
    "Operator",
    "Structure",
    "LineNr",
    "NonText",
    "SignColumn",
    "CursorLine",
    "CursorLineNr",
    "StatusLine",
    "StatusLineNC",
    "EndOfBuffer",
    "PMenu",
  },
  -- table: additional groups that should be cleared
  extra_groups = {},
  -- table: groups you don't want to clear
  exclude_groups = {},
  -- function: code to be executed after highlight groups are cleared
  -- Also the user event "TransparentClear" will be triggered
  on_clear = function() end,
})
local plugins = "plugins"

local opts = {
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "tokyonight" },
  },
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrw",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
  change_detection = {
    notify = false,
  },
}

require("lazy").setup(plugins, opts)

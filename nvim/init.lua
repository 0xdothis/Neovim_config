-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autocmds")

-- Set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

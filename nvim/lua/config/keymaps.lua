-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Format SQL with pg_format manually
vim.keymap.set("n", "<leader>pf", ":%!pg_format -<CR>", { desc = "[P]ostgres [F]ormat" })

local M = {}

-- Define the sign (red dot or custom symbol)
local sign_name = "LineMarkerDot"
local sign_group = "LineMarkerGroup"

vim.fn.sign_define(sign_name, {
  text = "●",  -- Symbol (try: •, ⚫, ⏺, ▎)
  texthl = "DiagnosticError",  -- Red highlight (or "ErrorMsg", "WarningMsg")
  linehl = "",  -- No line highlight
  numhl = "",   -- No number column highlight
})

-- Toggle marker on current line
function M.toggle()
  local bufnr = vim.api.nvim_get_current_buf()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local signs = vim.fn.sign_getplaced(bufnr, { group = sign_group, lnum = line })[1].signs

  if #signs > 0 then
    vim.fn.sign_unplace(sign_group, { buffer = bufnr, id = signs[1].id })
  else
    vim.fn.sign_place(0, sign_group, sign_name, bufnr, { lnum = line })
  end
end

-- Set keybinding (optional, customize in setup)
function M.setup(opts)
  opts = opts or {}
  vim.keymap.set("n", opts.keymap or "<leader>dm", M.toggle, { desc = "Toggle line marker" })
end

-- Auto-initialize if loaded directly (optional)
local function auto_init()
  M.setup()
end
auto_init()

return M

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autocmds")
require("neotest.logging"):set_level(vim.log.levels.INFO)
-- Transparency config
-- Set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.lsp.enable("cairo_ls")
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE
  highlight StatusLine guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  ]])
-- Auto reapply transparent background after any colorscheme loads
-- v
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local transparent_groups = {
      "Normal",
      "NormalNC",
      "EndOfBuffer",
      "SignColumn",
      "VertSplit",
      "StatusLine",
      "LineNr",
      "CursorLine",
      -- "Visual",
      -- "VisualNOS",
      "CmpItemAbbrMatch",
      "CmpItemAbbrMatchFuzzy",
      "LuaSnipInsertNodePassive",
      "LuaSnipChoiceNodePassive",
    }

    -- local transparent_groups = {
    --   "Normal",
    --   "NormalNC",
    --   "EndOfBuffer",
    --   "SignColumn",
    --   "VertSplit",
    --   "StatusLine",
    --   "LineNr",
    -- }

    for _, group in ipairs(transparent_groups) do
      vim.cmd(string.format("highlight %s guibg=NONE ctermbg=NONE", group))
    end
  end,
})
--  End of transparency config

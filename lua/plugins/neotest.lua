-- lua/plugins/neotest.lua
return {
  "nvim-neotest/neotest",
  dependencies = {
    "rouge8/neotest-rust", -- Rust adapter for neotest
    "nvim-lua/plenary.nvim", -- Required by neotest
    "nvim-treesitter/nvim-treesitter", -- Required by neotest
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rust"),
      },
    })

    -- Keybindings for running tests
    -- vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<CR>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { noremap = true, silent = true })
  end,
}
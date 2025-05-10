return {
  -- Mason for installing cairo-language-server
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "cairo-language-server" },
      automatic_installation = true,
    },
  },
  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cairo_ls = {
          filetypes = { "cairo" },
          root_dir = require("lspconfig.util").root_pattern("Scarb.toml", ".git") or vim.loop.cwd,
          settings = {
            telemetry = { enabled = true },
            trace = { server = "verbose" },
          },
        },
      },
    },
  },
  -- Treesitter for syntax highlighting (if parser exists)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "cairo" }, -- Add if parser available
      highlight = { enable = true },
    },
  },
  -- Ensure nvim-cmp for autocompletion
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      },
    },
  },
}

local mason = {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "BufReadPre",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}

local mason_lspconfig = {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      -- Existing servers
      "solidity_ls",
      "efm",
      "bashls",
      "ts_ls",
      "tailwindcss-language-server",
      "pyright",
      "lua_ls",
      "emmet_ls",
      "jsonls",
      "clangd",
      "dockerls",
      -- Add missing language servers
      "gopls", -- Go
      "marksman", -- Markdown
      "sqls", -- SQL
      "taplo", -- TOML
    },
    automatic_installation = true,
  },
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}

-- Optionally, configure mason to install non-LSP tools
local mason_tools = {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          -- Linting and formatting tools
          "hadolint", -- Docker
          "golangci-lint", -- Go
          "delve", -- Go debugging
          "markdownlint", -- Markdown
          "prettier", -- JSON, Markdown, Tailwind, TypeScript
          "ruff", -- Python
          "black", -- Python
          "debugpy", -- Python debugging
          "sql-formatter", -- SQL
          "eslint_d", -- TypeScript (fixed from "eslint")
          "js-debug-adapter", -- TypeScript debugging
        },
      },
    },
  },
}

return {
  mason,
  mason_lspconfig,
  mason_tools,
}

-- local mason = {
-- 	"williamboman/mason.nvim",
-- 	cmd = "Mason",
-- 	event = "BufReadPre",
-- 	opts = {
-- 		ui = {
-- 			icons = {
-- 				package_installed = "✓",
-- 				package_pending = "➜",
-- 				package_uninstalled = "✗",
-- 			},
-- 		},
-- 	},
-- }
--
-- local mason_lspconfig = {
-- 	"williamboman/mason-lspconfig.nvim",
-- 	opts = {
-- 		ensure_installed = {
-- 			"solidity_ls",
-- 			"efm",
-- 			"bashls",
-- 			"ts_ls",
-- 			"tailwindcss",
-- 			"pyright",
-- 			"lua_ls",
-- 			"emmet_ls",
-- 			"jsonls",
-- 			"clangd",
-- 			"dockerls",
-- 		},
-- 		automatic_installation = true,
-- 	},
-- 	event = "BufReadPre",
-- 	dependencies = "williamboman/mason.nvim",
-- }
--
-- return {
-- 	mason,
-- 	mason_lspconfig,
-- }


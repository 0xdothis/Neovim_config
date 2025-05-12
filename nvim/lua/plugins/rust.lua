return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          require("config.jump-to-definition").on_attach(_, bufnr)
          -- Format on save through LazyVim's built-in mechanisms
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              -- First ensure the file is valid Rust
              if vim.bo[bufnr].filetype == "rust" then
                -- Check for Solana project markers
                local is_solana = vim.fn.expand("%:p"):lower():find("solana") ~= nil
                  or vim.fn.filereadable(vim.fn.expand("%:p:h") .. "/Anchor.toml") == 1
                  or vim.fn.filereadable(vim.fn.expand("%:p:h:h") .. "/Anchor.toml") == 1
                -- Additional Solana-specific cleanup
                if is_solana then
                  vim.cmd([[keeppatterns %s/\s\+$//e]]) -- Remove trailing whitespace
                end
              end
            end,
          })
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = {
              command = "clippy",
              extraArgs = { "--no-deps" }, -- Faster checks
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = {
          {
            "rustfmt",
            command = "rustfmt",
            args = { "--edition=2021", "--quiet" },
            stdin = true,
          },
        },
      },
    },
    init = function()
      -- Pre-cache rustfmt to avoid first-run delay
      vim.fn.system("rustfmt --version >/dev/null 2>&1")
    end,
  },
}

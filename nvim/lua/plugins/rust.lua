return {

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            require("config.jump-to-definition").on_attach(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                if vim.bo[bufnr].filetype == "rust" then
                  local is_solana = vim.fn.expand("%:p"):lower():find("solana") ~= nil
                    or vim.fn.filereadable(vim.fn.expand("%:p:h") .. "/Anchor.toml") == 1
                    or vim.fn.filereadable(vim.fn.expand("%:p:h:h") .. "/Anchor.toml") == 1
                  if is_solana then
                    vim.cmd([[keeppatterns %s/\s\+$//e]])
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
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
      }
    end,
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

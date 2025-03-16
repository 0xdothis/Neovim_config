-- lua/plugins/crates.lua
return {
  "Saecki/crates.nvim",
  event = { "BufRead Cargo.toml" }, -- Load the plugin when a Cargo.toml file is opened
  opts = {
    completion = {
      crates = {
        enabled = true, -- Enable completion for crate versions
      },
    },
    lsp = {
      enabled = true, -- Enable LSP features for Cargo.toml
      actions = true, -- Enable automatic version updates
      completion = true, -- Enable completion for crate names
      hover = true, -- Enable hover information for crates
    },
  },
}
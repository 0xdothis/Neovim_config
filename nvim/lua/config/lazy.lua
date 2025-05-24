local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        -- Disable LazyVim's default cmp config
        cmp = {
          enabled = false,
        },
      },
    },
    -- import/override with your plugins
    { import = "plugins" },

    {
      "folke/tokyonight.nvim",
      opts = {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      },
    },
    -- {
    --   "nvim-neotest/neotest",
    --   dependencies = {
    --     "nvim-neotest/nvim-nio",
    --     "nvim-lua/plenary.nvim",
    --     "antoinemadec/FixCursorHold.nvim",
    --     "nvim-treesitter/nvim-treesitter",
    --     -- This is where you install the adapter:
    --     "maxandron/neotest-cairo",
    --   },
    --   opts = function()
    --     return {
    --       adapters = {
    --         -- This is where you add the adapter:
    --         require("neotest-cairo"),
    --       },
    --       -- The rest of your Neotest configuration
    --     }
    --   end,
    -- },
    -- {
    --   "nvim-neotest/neotest",
    --   dependencies = {
    --     "llllvvuu/neotest-foundry",
    --     "nvim-treesitter/nvim-treesitter",
    --     "nvim-lua/plenary.nvim",
    --   },
    -- },
    -- {
    --   "nvim-neotest/neotest",
    --   dependencies = {
    --     "llllvvuu/neotest-foundry",
    --     "nvim-treesitter/nvim-treesitter",
    --     "nvim-lua/plenary.nvim",
    --   },
    --   config = function()
    --     require("neotest").setup({
    --       adapters = {
    --         require("neotest-foundry")({
    --           foundryCommand = "forge test",
    --         }),
    --       },
    --     })
    --   end,
    -- }
    -- {
    --   "mrcjkb/rustaceanvim",
    --   version = "^6", -- Recommended
    --   lazy = false, -- This plugin is already lazy
    -- },

    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "cairo" }, -- Add if parser available
        highlight = { enable = true },
      },
    },
    -- Add or modify this entry for mason-lspconfig.nvim
    {
      "williamboman/mason-lspconfig.nvim",
      lazy = false, -- THIS IS THE CRUCIAL LINE
      dependencies = { "williamboman/mason.nvim" },
    },
    { "tribela/vim-transparent" },
    {
      "saghen/blink.cmp",
      enabled = false,
    },
    -- {
    -- "hrsh7th/cmp-nvim-lsp", -- Completion engine (must-have)
    -- enabled = true,
    -- },
    { import = "plugins.languages.astro" },
    { import = "plugins.languages.docker" },
    { import = "plugins.languages.go" },
    { import = "plugins.languages.markdown" },
    { import = "plugins.languages.mdx" },
    { import = "plugins.languages.python" },
    { import = "plugins.languages.typescript" },
    { import = "plugins.test.core" },
    { import = "plugins.formatting.conform" },
    { import = "plugins.formatting.prettier" },
    -- { import = "plugins.linting.core" },
    { import = "plugins.util.mini-hipatterns" },

    {
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
    },
    -- Import foundry test adapter
    --     {
    --   'nvim-neotest/neotest',
    --   dependencies = {
    --     ...,
    --     'llllvvuu/neotest-foundry',
    --   },
    --   config = {
    --     ...,
    --     adapters = {
    --       require('neotest-foundry')
    --     }
    --   }
    -- },
    { "ryanoasis/vim-devicons", lazy = true, event = "VeryLazy" }, -- Minimal setup
    {
      "yanganto/move.vim",
      branch = "sui-move",
    },
    -- {
    --   "getomni/neovim",
    -- },
    -- Telescope
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").setup({})
      end,
    },
    -- {
    --   "Pocco81/auto-save.nvim",
    --   opts = {
    --     enabled = true,
    --     events = { "InsertLeave", "TextChanged" }, -- Save on leaving insert mode or text changes
    --     write_all_buffers = false, -- Only save current buffer
    --     debounce_delay = 135, -- Delay to avoid excessive saves
    --   },
    -- },
    { "Mofiqul/vscode.nvim" },
    -- { "hrsh7th/cmp-nvim-lsp" }, -- LSP source
    -- { "hrsh7th/cmp-buffer" }, -- Buffer source
    -- { "hrsh7th/cmp-path" }, -- Path completion
    {
      "onsails/lspkind.nvim",
      lazy = true,
    },
    -- {
    --   "L3MON4D3/LuaSnip",
    --   version = "v2.*",
    --   build = "make install_jsregexp",
    --   dependencies = {
    --     "rafamadriz/friendly-snippets",
    --   },
    -- },
    {
      "hrsh7th/nvim-cmp",
      enabled = true,
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
      },
    },
    -- null-ls for formatting
    {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  {
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = "⌘",
        config = "🛠",
        event = "📅",
        ft = "📂",
        init = "⚙",
        keys = "🗝",
        plugin = "🔌",
        runtime = "💻",
        require = "🌙",
        source = "📄",
        start = "🚀",
        task = "📌",
        lazy = "💤 ",
      },
    },
  },
})
-- Apply vscode.nvim after the UI is fully loaded and the loading screen is gone
-- vim.api.nvim_create_autocmd("UIEnter", {
--   callback = function()
--     vim.cmd("colorscheme vscode")
--   end,
-- })

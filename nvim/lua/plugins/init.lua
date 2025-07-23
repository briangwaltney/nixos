return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", 
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
{
  "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
  opts = {
    ensure_installed = {
"lua-language-server",
    "alejandra",
    "goimports",
    "gopls",
    "html-lsp",
    "json-lsp",
    "nixfmt",
    "nixpkgs-fmt",
    "prettier",
    "prettierd",
    "stylua",
        "typescript-language-server",
    },
  },
    auto_update = true,
},


  {
    "bbjornstad/pretty-fold.nvim",
    lazy = false,
    config = function()
      require("pretty-fold").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup {
        filters = {
          dotfiles = false,
          custom = { ".DS_Store" },
        },
        git = { ignore = false },
      }
    end,
  },
}

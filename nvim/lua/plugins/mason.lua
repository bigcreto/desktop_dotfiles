return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "codelldb",
        "jdtls",
        "golangci-lint",
        "gopls",
        "lua-language-server",
        "pyright",
        "rust-analyzer",
      },
    },
  },
}

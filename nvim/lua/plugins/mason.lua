return {
  {
    -- Mason Language Server, Debugger, Linter, and Formatter Installer
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
    -- Mason Language Server Configuration
    "williamboman/mason-lspconfig.nvim",
  },
  {
    -- Mason Tool Installer
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "codelldb",
        "golangci-lint",
        "gopls",
        "lua-language-server",
        "pyright",
        "rust-analyzer",
        "yaml-language-server",
      },
    },
  },
}

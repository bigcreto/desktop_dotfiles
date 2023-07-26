return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
      if not treesitter_status then
        return
      end

      treesitter.setup({
        ensure_installed = {
          "c",
          "cpp",
          "go",
          "lua",
          "ocaml",
          "query",
          "rust",
          "vim",
          "vimdoc",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      local treesitter_context_status, treesitter_context = pcall(require, "treesitter-context")
      if not treesitter_context_status then
        return
      end

      treesitter_context.setup({
        enable = true,
        max = 0,
        min_window_height = 0,
        line_numbers = true,
        mode = 'cursor',
        separator = nil,
        on_attach = nil
      })
    end,
  }
}

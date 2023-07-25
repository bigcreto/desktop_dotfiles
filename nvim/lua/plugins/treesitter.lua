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
}

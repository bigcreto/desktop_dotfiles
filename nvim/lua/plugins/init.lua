return {

  { "tpope/vim-surround" },
  { "numToStr/Comment.nvim", opts = {} },
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  {
    "szw/vim-maximizer",
    config = function()
      vim.keymap.set("n", "<leader>wm",  vim.cmd.MaximizerToggle )
    end,
  },
  { import = "plugins/colorschemes" },
  { import = "plugins/toggleterm" },
  { import = "plugins/lualine" },
  { import = "plugins/mason" },
  { import = "plugins/lspconfig" },
  { import = "plugins/nvim-cmp" },
  { import = "plugins/autopairs" },
  { import = "plugins/nvim-dap" },
  { import = "plugins/treesitter" },

}

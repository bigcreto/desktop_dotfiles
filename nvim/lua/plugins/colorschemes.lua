return {
  {
    "bluz71/vim-moonfly-colors",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme moonfly")
    end,
  },
  {
    "bluz71/vim-nightfly-colors",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    lazy = true,
  },
}
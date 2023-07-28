return {
  {
    -- Moonfly Colorscheme
    "bluz71/vim-moonfly-colors",
    lazy = true,
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   vim.cmd("colorscheme moonfly")
    -- end,
  },
  {
    -- Nightfly Colorscheme
    "bluz71/vim-nightfly-colors",
    lazy = true,
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   vim.cmd("colorscheme nightfly")
    -- end,
  },
  {
    -- Catppuccin Colorscheme
    "catppuccin/nvim",
    -- lazy = true,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },
}

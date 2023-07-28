return {

  { "tpope/vim-surround"            },
  { "numToStr/Comment.nvim", opts = {} },
  { "nvim-lua/plenary.nvim"         },
  { "nvim-tree/nvim-web-devicons"   },
  {
    "szw/vim-maximizer",
    config = function()
      vim.keymap.set("n", "<leader>wm",  vim.cmd.MaximizerToggle )
    end,
  },
  { import = "plugins/colorschemes" },
  { import = "plugins/lualine"      },
  { import = "plugins/dashboard"        },
  { import = "plugins/toggleterm"   },
  { import = "plugins/treesitter"   },
  { import = "plugins/mason"        },
  { import = "plugins/lspconfig"    },
  { import = "plugins/fidget"       },
  { import = "plugins/nvim-cmp"     },
  { import = "plugins/autopairs"    },
  { import = "plugins/tabout"       },
  { import = "plugins/nvim-lint"    },
  { import = "plugins/nvim-dap"     },
  { import = "plugins/formatter"    },

}

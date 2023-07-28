return {

  { "tpope/vim-surround"               }, -- Import Vim Surround
  { "numToStr/Comment.nvim", opts = {} }, -- Import Comment
  { "nvim-lua/plenary.nvim"            }, -- Import Plenary
  { "nvim-tree/nvim-web-devicons"      }, -- Import Devicons
  {
    "szw/vim-maximizer",
    config = function()
      vim.keymap.set("n", "<leader>wm",  vim.cmd.MaximizerToggle )
    end,
  },
  { import = "plugins/colorschemes"    }, -- Import Colorschemes
  { import = "plugins/lualine"         }, -- Import Lualine
  { import = "plugins/dashboard"       }, -- Import Dashboard
  { import = "plugins/toggleterm"      }, -- Import Toggleterm
  { import = "plugins/treesitter"      }, -- Import Treesitter
  { import = "plugins/mason"           }, -- Import Mason
  { import = "plugins/lspconfig"       }, -- Import LSP
  { import = "plugins/fidget"          }, -- Import Fidget
  { import = "plugins/nvim-cmp"        }, -- Import Nvim CMP
  { import = "plugins/autopairs"       }, -- Import Autopairs
  { import = "plugins/tabout"          }, -- Import Tabout
  { import = "plugins/nvim-lint"       }, -- Import Neovim Lint
  { import = "plugins/nvim-dap"        }, -- Import Neovim DAP
  { import = "plugins/formatter"       }, -- Import Formatter.

}

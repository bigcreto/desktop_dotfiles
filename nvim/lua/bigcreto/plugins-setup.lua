local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)

  -- Packer manages itself.
  use ("wbthomason/packer.nvim")

  -- Provides additional lua functions.
  use ("nvim-lua/plenary.nvim")

  use ("tpope/vim-surround")

  -- Syntax highlighting.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Colorscheme.
  use { "bluz71/vim-moonfly-colors", as = "moonfly" } -- Moonfly colorscheme.

  -- Nvim tree
  use ('nvim-tree/nvim-tree.lua')
  use ('nvim-tree/nvim-web-devicons')

  -- Lualine
  use ('nvim-lualine/lualine.nvim')

  -- Telescope fuzzy finder.
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x'
  }
  use { 
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -- Autocompletion.
  use ("hrsh7th/nvim-cmp")
  use ("hrsh7th/cmp-nvim-lsp")
  use ("hrsh7th/cmp-buffer")
  use ("hrsh7th/cmp-path")

  -- Snippets.
  use ("L3MON4D3/LuaSnip")
  use ("saadparwaiz1/cmp_luasnip")
  use ("rafamadriz/friendly-snippets")
  
  -- Manage and install LSP servers.
  use ("williamboman/mason.nvim")
  use ("williamboman/mason-lspconfig.nvim")

  -- Configure LSP servers.
  use ("neovim/nvim-lspconfig")
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main'
  }
  use ("onsails/lspkind.nvim")

  -- Formatting and linting.
  use ("jose-elias-alvarez/null-ls.nvim")
  use ("jayp0521/mason-null-ls.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)

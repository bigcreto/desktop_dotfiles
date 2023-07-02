local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost pluginSetup.lua source <afile> | PackerSync
  augroup end
]])

local packer_status, packer = pcall(require, "packer")
if not packer_status then
	return
end

return packer.startup(function(use)
	-- Have Packer manage itself.
	use("wbthomason/packer.nvim")

	-- Provides necessary Lua functions.
	use("nvim-lua/plenary.nvim")

	-- Colorschemes.
  use("navarasu/onedark.nvim")

	-- Nvim tree.
	use("nvim-tree/nvim-web-devicons")
	use("nvim-tree/nvim-tree.lua")

	-- Lualine
	use("nvim-lualine/lualine.nvim")

  -- Linting.
  use("dense-analysis/ale")

  -- Nvim completion.
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  -- Snippets.
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- Mason
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- LSP Configuration.
  use("neovim/nvim-lspconfig")
  use("onsails/lspkind.nvim")
  use("jose-elias-alvarez/typescript.nvim")

  -- Treesitter
  use{
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  }

  -- Telescope fuzzy finder.
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x'
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -- Vim surround.
  use("tpope/vim-surround")



	if packer_bootstrap then
		packer.sync()
	end
end)

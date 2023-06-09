local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system { "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer. Close and reopen Neovim..."
  -- vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

return require('packer').startup(function(use)
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  use({
    "aserowy/tmux.nvim",
    config = function() require("tmux").setup() end
  })
  use 'editorconfig/editorconfig-vim'
  use 'folke/tokyonight.nvim'

  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
  }

  use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }

  use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"}
  use { "williamboman/mason-lspconfig.nvim", commit = "0eb7cfefbd3a87308c1875c05c3f3abac22d367c" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }

  -- cmp plugins
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- snippets
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- fugitive
  use { "tpope/vim-fugitive" }
  use { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" }
  use { 'hashivim/vim-terraform' }
  use { 'github/copilot.vim' }
  use { 'jparise/vim-graphql' }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

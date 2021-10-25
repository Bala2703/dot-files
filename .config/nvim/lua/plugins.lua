return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- Lua development
  use { 'tjdevries/nlua.nvim' }

  use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

  use {'monsonjeremy/onedark.nvim'}
    
  use{'arcticicestudio/nord-vim'}
  -- Vim dispatch
  use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }
  
  --Nvim Tree
  use {'kyazdani42/nvim-tree.lua'}
  --Dev Icons
  use('kyazdani42/nvim-web-devicons')
  --Which-key
  use ('folke/which-key.nvim')
  --Tree-sitter
  use { 'nvim-treesitter/nvim-treesitter' }
  --Rainbow colorizer
  use {"p00f/nvim-ts-rainbow"} 
  --Colorizer
  use{'norcalli/nvim-colorizer.lua'}
  --Auto-save
  use{'Pocco81/AutoSave.nvim'}
end)



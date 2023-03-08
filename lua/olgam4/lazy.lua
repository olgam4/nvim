local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
    tag = 'nightly',
  },

  'eandrju/cellular-automaton.nvim',
  'kyazdani42/nvim-web-devicons',

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',

  'mg979/vim-visual-multi',

  { 'samodostal/image.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'm00qek/baleia.nvim'
    }
  },

  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() require('todo-comments').setup {} end
  },

  -- {
  --   'ray-x/navigator.lua',
  --   dependencies = {
  --     { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  --     { 'neovim/nvim-lspconfig' },
  --   },
  -- },

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
      })
    end,
  },

  -- tpope, our god and saviour
  { 'tpope/vim-surround' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-projectionist' }, -- TODO: setup me
  { 'github/copilot.vim' },

  {
    'ThePrimeagen/harpoon',
    dependencies = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope.nvim' } },
    run = function() require 'telescope'.load_extension('harpoon') end
  },
  {
    'ThePrimeagen/refactoring.nvim', -- TODO: test me
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' }
    },
    run = function() require 'refactoring'.setup {} end
  },

  'andweeb/presence.nvim',

  -- dancing around
  'wellle/targets.vim',
  'ggandor/leap.nvim',

  -- themes
  'megantiu/true.vim',
  'ray-x/aurora',
  'rebelot/kanagawa.nvim',
  { 'catppuccin/nvim', as = "cattpuccin" },
  { 'kyoz/purify', rtp = 'vim' },

  {
    'NTBBloodbath/galaxyline.nvim',
    config = function()
      require('olgam4.themes.galaxyline')
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end
  },

  -- git
  'airblade/vim-gitgutter', -- TODO: setup,
  { 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      { 'simrat39/rust-tools.nvim' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- Snippet Collection (Optional)
      { 'rafamadriz/friendly-snippets' },
    }
  },
  { 'ray-x/lsp_signature.nvim' },
}

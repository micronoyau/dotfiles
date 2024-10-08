local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODO : tidy this a bit
require('lazy').setup({
{
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},

{
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme tokyonight]])
  end,
},

'nvim-treesitter/nvim-treesitter',

{
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  }
},

{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3'
},

{
  'akinsho/toggleterm.nvim',
  version = '*',
  config = true
},

{
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim'
  }
},

{
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
},

{ 'RaafatTurki/hex.nvim' },

{
  'numToStr/Comment.nvim',
  lazy = false,
},

{ 'L3MON4D3/LuaSnip' },

{ 'neovim/nvim-lspconfig' },

{ 'williamboman/mason.nvim' },

{ 'williamboman/mason-lspconfig.nvim' },

{
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip'
  }
},

{ 'mfussenegger/nvim-jdtls' },

{ 'mfussenegger/nvim-dap' },

{'lewis6991/gitsigns.nvim'},
{'tpope/vim-fugitive'},
{'rbong/vim-flog'}
})

require('hex').setup()
require('Comment').setup()

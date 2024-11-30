-- Install neovim by default if no install is done
local root = vim.fn.stdpath('data') .. '/lazy'
local lazypath = root .. '/lazy.nvim'
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

require('lazy').setup({
    -- Key bindings hints
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    -- Color scheme
    {
        'folke/tokyonight.nvim',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- Treesitter for basic parsing support
    'nvim-treesitter/nvim-treesitter',

    -- FS tree
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
        }
    },

    -- Fuzzy finder : requires ripgrep installed on system
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3'
    },

    -- Toggle terminal if needed
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = true
    },

    -- Mark important/recent files
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    -- Markdown preview
    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        build = 'cd app && yarn install',
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { 'markdown' },
    },

    -- Display and even edit hex
    { 'RaafatTurki/hex.nvim' },

    -- Comment stuff
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    -- Snippet engine
    { 'L3MON4D3/LuaSnip' },

    -- Mason manage installed LSP servers
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Completion plugin
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

    -- Specific to java : support for eclipse's jdtls lsp
    { 'mfussenegger/nvim-jdtls' },

    -- Debug Access Protocol support
    { 'mfussenegger/nvim-dap' },

    -- Git support
    { 'lewis6991/gitsigns.nvim' },
    { 'tpope/vim-fugitive' },
    { 'rbong/vim-flog' }
})

require('hex').setup()
require('Comment').setup()

-- plugins/telescope.lua:
return {
{
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
},

    -- Using treesitter
   { 'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    },
{"nvim-treesitter/nvim-treesitter-context"},
    {'nvim-treesitter/playground'},

    -- folke is nvim god
 {
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
 opts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
 },
    -- Using Harpoon
    {'theprimeagen/harpoon'},
    {"theprimeagen/refactoring.nvim"}, -- nice plugin

    {'mbbill/undotree'},
    {'tpope/vim-fugitive'},

    -- LSP-zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, --Optional
        }
    }

    -- Optional
    -- use("github/copilot.vim") -- i've no money
    {"eandrju/cellular-automaton.nvim"}, -- really funny
    {"laytan/cloak.nvim"},              -- allows you to overlay *'s (or any other character) over defined patterns in defined files.
    }

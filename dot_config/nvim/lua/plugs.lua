---@brief [[
--- Neovim plugin configuration using lazy.nvim
--- Manages plugin loading, dependencies, and initialization
---@brief ]]

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=main",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specification
require('lazy').setup({
    -- LSP support
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        priority = 1000,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        priority = 900,
    },

    -- Function signature help while typing
    { 'ray-x/lsp_signature.nvim' },

    -- Color scheme
    {
        'Mofiqul/dracula.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme dracula")
        end
    },

    -- File icons
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
    },

    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        cmd = {
            "NvimTreeToggle",
            "NvimTreeFocus",
            "NvimTreeFindFile",
        },
    },

    -- Fuzzy finder
    {
        'junegunn/fzf',
        lazy = false,
        build = function()
            vim.fn['fzf#install']()
        end,
    },
    { 'junegunn/fzf.vim' },

    -- Telescope for advanced searching
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        },
        dependencies = {'nvim-lua/plenary.nvim'}
    },

    -- Directory navigation
    { 'nanotee/zoxide.vim' },

    -- Smooth scrolling
    { 'psliwka/vim-smoothie' },

    -- Git integration with LazyGit
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },

    -- Git commands
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-git' },
    { 'tpope/vim-rhubarb' },

    -- Code manipulation
    { 'tpope/vim-commentary' },
    { 'tpope/vim-surround' },

    -- Syntax highlighting and code context
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter',
                build = ':TSUpdate',
                lazy = false,
            },
        },
    },

    -- Asynchronous linting
    { 'mfussenegger/nvim-lint' },

    -- Swift language support
    { 'keith/swift.vim' },
    { 'gfontenot/vim-xcode' },

    -- Search and replace
    {
        'nvim-pack/nvim-spectre',
        dependencies = {'nvim-lua/plenary.nvim'},
        cmd = "Spectre",
    },

    -- Markdown rendering
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
    },

    -- Commented/Experimental plugins
    -- {
    --     "smjonas/live-command.nvim",
    --     config = function()
    --         require("live-command").setup({commands = {Norm = {cmd = "norm"}}})
    --     end
    -- },
    -- {
    --   'yetone/avante.nvim',
    --   event = "VeryLazy",
    --   -- build = "make",
    --   build = "make BUILD_FROM_SOURCE=true luajit",
    --   opts = {
    --       -- add any opts here
    --   },
    --   dependencies = {
    --       "nvim-tree/nvim-web-devicons",
    --       "stevearc/dressing.nvim",
    --       "nvim-lua/plenary.nvim",
    --       "MunifTanjim/nui.nvim",
    --       {
    --       'MeanderingProgrammer/render-markdown.nvim',
    --       opts = {
    --           file_types = { "markdown", "Avante" },
    --       },
    --       ft = { "markdown", "Avante" },
    --       },
    --   },
    -- },
    -- {'hrsh7th/cmp-nvim-lsp'},
    -- {'lvimuser/lsp-inlayhints.nvim'},
})


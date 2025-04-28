-- lazy.nvim pre-setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=main", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Test
  -- {
  --     "smjonas/live-command.nvim", -- live command
  --     config = function()
  --         require("live-command").setup({commands = {Norm = {cmd = "norm"}}})
  --     end
  -- },
  -- End Test
  {'ray-x/lsp_signature.nvim'},
  {
     'Mofiqul/dracula.nvim',
     config = function()
       vim.cmd("colorscheme dracula")      
     end
  },
  {'gfontenot/vim-xcode'},
  {
	'nvim-pack/nvim-spectre',
    	dependencies = {'nvim-lua/plenary.nvim'}  -- Specify dependencies
  },
  -- {
  --   'yetone/avante.nvim',
  --   event = "VeryLazy",
  --   -- build = "make",
  --   build = "make BUILD_FROM_SOURCE=true luajit",
  --   opts = {
  --       -- add any opts here
  --   },
  --   dependencies = {
  --       "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --       "stevearc/dressing.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "MunifTanjim/nui.nvim",
  --       --- The below is optional, make sure to setup it properly if you have lazy=true
  --       {
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --           file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --       },
  --   },
  -- },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
        file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
  {'hrsh7th/nvim-cmp', lazy = false},  -- Essential for autocompletion, load immediately
  {
    'junegunn/fzf',
    lazy = false,
    -- build = 'fzf#install()'
  },
  {'junegunn/fzf.vim'},
  {'neovim/nvim-lspconfig', lazy = false},  -- Essential for LSP, load immediately
  -- {'hrsh7th/cmp-nvim-lsp'},
  {'nvim-tree/nvim-tree.lua'},
  -- {'lvimuser/lsp-inlayhints.nvim'},
  {'nvim-tree/nvim-web-devicons', lazy = false},
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   build = ':TSUpdate',
  --   lazy = false
  -- },
  { 'nvim-treesitter/nvim-treesitter-context' },
  {'keith/swift.vim'},
  {'psliwka/vim-smoothie'},
  {'tpope/vim-commentary'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-git'},
  {'tpope/vim-rhubarb'},
  {'tpope/vim-surround'},
  {'nvim-lspconfig'},  -- Uses native LSP diagnostics
  {'mfussenegger/nvim-lint'},
  {'nanotee/zoxide.vim'},
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {'nvim-lua/plenary.nvim'}  -- Specify dependencies
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
       { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
})


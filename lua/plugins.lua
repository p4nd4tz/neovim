local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use popup window
packer.init {
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups
  },
}

return packer.startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lua Development
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "christianchiarulli/lua-dev.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "ray-x/lsp_signature.nvim"
  use "b0o/schemastore.nvim"
  --use {
  --  "zbirenbaum/copilot.lua",
  --  event = { "VimEnter" },
  --  config = function()
  --    vim.defer_fn(function()
  --      require "copilot"
  --    end, 100)
  --  end,
  --}
  use "j-hui/fidget.nvim"
  use "lvimuser/lsp-inlayhints.nvim"
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

  -- Completions
  use 'hrsh7th/nvim-cmp' -- completion plugins
  use 'hrsh7th/cmp-buffer' -- buffer completion
  use 'hrsh7th/cmp-path' -- path completion
  use 'hrsh7th/cmp-cmdline'
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  --use "zbirenbaum/copilot-cmp"
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  use "L3MON4D3/LuaSnip" -- snippet completion
  --use "rafamadriz/friendly-snippets"

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "kylechui/nvim-surround"
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
  }

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use "nvim-telescope/telescope-media-files.nvim"

  -- Nvim-tree
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- Status Line && TabLine
  --use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }
  use "akinsho/bufferline.nvim"
  use "christianchiarulli/lualine.nvim"

  -- Color
  use "NvChad/nvim-colorizer.lua"

  -- Colorscheme
  use "lunarvim/darkplus.nvim"
  --use "lunarvim/onedarker.nvim"

  -- Utility
  use "ghillb/cybu.nvim"
  use "rcarriga/nvim-notify"
  use "stevearc/dressing.nvim"
  use "lewis6991/impatient.nvim"

  -- Comment
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- Indent Line
  use 'lukas-reineke/indent-blankline.nvim' -- indendation

  -- Terminal 
  use "akinsho/toggleterm.nvim"

  -- Editing Support
  use 'windwp/nvim-autopairs' -- autopairs
  use 'Pocco81/AutoSave.nvim'
  use "karb94/neoscroll.nvim"
  use "folke/zen-mode.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Motions
  use "phaazon/hop.nvim"

  -- Debugger ( Debug Adapter Protocol )
  --use 'mfussenegger/nvim-dap'
  --use "Pocco81/DAPInstall.nvim"
  --use { "rcarriga/nvim-dap-ui" }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

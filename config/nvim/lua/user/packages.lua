-- Boostrap Lazy
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

-- Plugins
local function use(name, params)
	local t = params or {}
	table.insert(t, 1, name)
	return t
end

require("lazy").setup({
  -- Libraries
	use("nvim-lua/plenary.nvim"),
  use("nvim-tree/nvim-web-devicons"),

	-- Core Plugins
	use("nvim-treesitter/nvim-treesitter", {build = ":TSUpdate"}),
	use("nvim-telescope/telescope.nvim"),
  use("L3MON4D3/LuaSnip"),
  use("nvim-tree/nvim-tree.lua"),
  use("folke/which-key.nvim"),
  use("nvim-orgmode/orgmode"),

	-- Useless Themeing (I would be "semi-fine" using the default themes!)
  -- Otherwise, my favourite themes are below.
  use("shaunsingh/nord.nvim"),
  use("sainnhe/everforest"),
  use("nyoom-engineering/oxocarbon.nvim"),
  use("ellisonleao/gruvbox.nvim"),

  -- LSP, Completion Engines, and Languages
  use("neovim/nvim-lspconfig"),
  use("williamboman/mason.nvim"),
  use("williamboman/mason-lspconfig.nvim"),
  use("folke/neodev.nvim"),
  use("hrsh7th/nvim-cmp"),
  use("hrsh7th/cmp-nvim-lsp"),
  use("saadparwaiz1/cmp_luasnip"),

  -- Others
  use("figsoda/nix-develop.nvim"),
  use("direnv/direnv.vim"),
  use("cdelledonne/vim-cmake")
}, {})

require("nvim-treesitter.configs").setup{
	ensure_installed = { "c", "lua", "cpp", "rust", "nix", "org", "zig" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
    additional_vim_regex_highlighting = { "org" }
	}
}
require("telescope").setup{}
require("nvim-tree").setup{}
require("orgmode").setup_ts_grammar()
require("orgmode").setup{}

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

-- yes. i made this function so i dont have to repeatedly insert commas when
-- using lazy
-- this seems like packer now, doesn't it?
local function plugins(fn)
	local plugs = {}
	local function use(repo, opts)
		local plug = opts or {}
		table.insert(plug, 1, repo)
		table.insert(plugs, plug)
	end

	fn(use)

	require("lazy").setup(plugs, {})
end

plugins(function(use)
	-- Libraries
	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("lewis6991/gitsigns.nvim")
  use("rktjmp/lush.nvim")

	-- Some nice colorschemes and other themeing utilities
	use("nyoom-engineering/oxocarbon.nvim")
	use("gruvbox-community/gruvbox")
	use("catppuccin/nvim", { name = "catppuccin" })
  use("rebelot/kanagawa.nvim")
  use("mcchrish/zenbones.nvim")

	-- Plugins
	use("nvim-treesitter/nvim-treesitter", { build = ":TSUpdate" })
	use("nvim-telescope/telescope.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-vsnip")
  use("folke/which-key.nvim")
	use("folke/neodev.nvim")
end)

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "lua", "rust" },
	auto_install = true,
	sync_install = false,
	ignore_install = {},
	modules = {},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

require("telescope").setup({})
require("mason").setup()
require("nvim-tree").setup()

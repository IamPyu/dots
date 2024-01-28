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
  local plugins = {}
  local function use(repo, opts)
    local plug = opts or {}
    table.insert(plug, 1, repo)
    table.insert(plugins, plug)
  end

  fn(use)

  require("lazy").setup(plugins, {})
end

plugins(function(use)
  -- Libraries
  use("nvim-lua/plenary.nvim")
  use("MunifTanjim/nui.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("lewis6991/gitsigns.nvim")

  -- Some nice colorschemes and other themeing utilities
  use("xero/miasma.nvim")
  use("embark-theme/vim", {name = "embark"})
  use("savq/melange-nvim")
  use("shaunsingh/nord.nvim")
  use("sainnhe/everforest")
  use("sainnhe/sonokai")
  use("nyoom-engineering/oxocarbon.nvim")
  use("olivercederborg/poimandres.nvim")
  use("gruvbox-community/gruvbox")
  use("loctvl842/monokai-pro.nvim")

  use("rose-pine/neovim", {name = "rose-pine"})

  -- Plugins
  use("nvim-treesitter/nvim-treesitter", {build = ":TSUpdate"}) -- Treesitter.
  use("nvim-telescope/telescope.nvim") -- A nice fuzzy finder.
  use("nvim-tree/nvim-tree.lua") -- A file tree/explorer.

  use("romgrk/barbar.nvim"); use("nvim-lualine/lualine.nvim") -- Statusline and tabline

  use("neovim/nvim-lspconfig") -- LSP configurations
  use("williamboman/mason.nvim") -- ---------- ↓
  use("williamboman/mason-lspconfig.nvim") --  Managing of LSP, and DAP servers, and formatters
  use("hrsh7th/nvim-cmp"); use("hrsh7th/cmp-nvim-lsp"); -- Code completion
  use("hrsh7th/vim-vsnip"); use("hrsh7th/cmp-vsnip") -- Snippets
  use("folke/neodev.nvim") -- Neovim API auto completion
  use("stevearc/conform.nvim") -- Formatter
  use("Olical/conjure")
end)

require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "cpp", "lua", "rust" },
  auto_install = true,
  sync_install = false,
  ignore_install = {},
  modules = {},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
})

local section = {
  lualine_a = {"mode"},
  lualine_b =  {"branch", "diagnostics"},
  lualine_c = {"filename", "location"},

  lualine_x = {},
  lualine_y = {"fileformat", "filetype"},
  lualine_z = {function ()
    return "mix"
  end}
}
require("lualine").setup({
  options = {
    icons_enabled = true,
    section_separators = '',
    component_separators = ''
  },

  sections = section,
  inactive_sections = section
})
require("conform").setup({
  formatters_by_ft = {}
})
require("telescope").setup({})

require("mason").setup()
require("nvim-tree").setup()
require("barbar").setup()

local function tabs(size, expandtab)
	vim.opt.tabstop = size
	vim.opt.softtabstop = size
	vim.opt.shiftwidth = size
	vim.opt.expandtab = expandtab
end

tabs(2, true)

local options = {
	number = true,
	relativenumber = true,
	termguicolors = true,
	clipboard = "unnamedplus",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.cmd([[
    let g:gruvbox_contrast_dark = "hard"
    let g:gruvbox_italic = 1
    let g:gruvbox_underline = 1
]])

require("catppuccin").setup({
	no_italic = false,
	no_underline = false,
	no_bold = false,
	color_overrides = {
		all = {
			--base = "#000000",
		},
	},
	styles = {
		comments = { "italic" },
		functions = { "bold" },
		keywords = { "italic" },
		loops = { "italic" },
	},
	integrations = {
		cmp = true,
		treesitter = true,
		nvimtree = false,
	}
})

require("kanagawa").setup{
  theme = "dragon",
  terminalColors = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true},
  statementStyle = { },
  typeStyle = {}
}

local function color(theme, type)
	local c = theme or "default"
	vim.opt["background"] = type or "dark"
	vim.cmd("colo " .. c)
end

color("zenbones", "light")

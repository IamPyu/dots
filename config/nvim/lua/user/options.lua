local opts = {
	-- Visuals
	number = true,
	relativenumber = true,
  termguicolors = true,
  background = "dark",

	-- Tabs vs Spaces
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,
}

for key, value in pairs(opts) do
	vim.opt[key] = value
end

local DEFAULT_THEME = "gruvbox"
---@param theme string?
---Change colorscheme, default is `DEFAULT_THEME`
local function color(theme)
  local c = theme or DEFAULT_THEME
  vim.cmd.colorscheme(c)
end

color()

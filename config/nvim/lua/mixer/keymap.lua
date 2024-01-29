local setkey = vim.keymap.set
local noremap = { noremap = true }
local leader = ";"

--Defines a "main" keybinding
local function defkey(mode, binding, assignee, options)
	setkey(mode, leader .. binding, assignee, options or {})
end

-- Telescope
defkey("n", "tf", ":Telescope find_files<CR>")
defkey("n", "tg", ":Telescope git_files<CR>")

-- Files
defkey("n", "ft", ":NvimTreeToggle<CR>")

return {
	setkey = setkey,
}

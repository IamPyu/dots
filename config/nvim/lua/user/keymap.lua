local setkeyopts = {
	noremap = true,
	silent = true
}
local function setkey(mode, binding, bind)
	vim.keymap.set(mode, binding, bind, setkeyopts)
end
require("which-key").setup{}
vim.g.mapleader = " "

-- Files
setkey("n", "<leader>fo", function ()
  local root = vim.fn.getcwd()
	local file = vim.fn.input("File to open/create (Root directory is: " .. root .. "): ")
	vim.cmd.e(file)
end)
setkey("n", "<leader>ff", ":Telescope find_files<CR>")
setkey("n", "<leader>fg", ":Telescope git_files<CR>")
setkey("n", "<leader>", "")

-- Project
setkey("n", "<leader>pt", ":NvimTreeToggle<CR>")

return {
  setkey = setkey,
  setkeyopts = setkeyopts
}

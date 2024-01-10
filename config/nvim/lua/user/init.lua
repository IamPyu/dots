-- Disable Netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load modules
require("user.packages")
require("user.keymap")
require("user.lsp")
require("user.options")

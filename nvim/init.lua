-- Set leader key
vim.g.mapleader = " "

-- Enables setting LSPs within the `lze` specs
require("lze").register_handlers(require("lzextras").lsp)

-- Ensure that cache directory is made
vim.fn.mkdir(vim.fn.stdpath("cache"), "p")

-- Source configuration modules
require("user.autocmds")
require("user.keymaps")
require("user.options")
require("user.overrides")

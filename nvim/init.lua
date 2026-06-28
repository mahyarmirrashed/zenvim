-- Set leader key
vim.g.mapleader = " "

-- Enable filetype detection, plugins, and indentation
vim.cmd.filetype('plugin', 'indent', 'on')

-- Ensure that cache directory is made
vim.fn.mkdir(vim.fn.stdpath("cache"), "p")

-- Source configuration modules
require("user.autocmds")
require("user.ft")
require("user.keymaps")
require("user.options")
require("user.overrides")

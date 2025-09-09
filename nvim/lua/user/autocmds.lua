-- For highlighting what is copied
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
})

-- Disable spellcheck on Terminal windows
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function() vim.opt_local.spell = false end,
})

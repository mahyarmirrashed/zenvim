vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "TreesitterHighlight",
  callback = function(ev) pcall(vim.treesitter.start, ev.buf) end,
})

require("treesitter-context").setup({ max_lines = 3 })

require("ts_context_commentstring").setup()

require("treesj").setup({ use_default_keymaps = false })

vim.keymap.set(
  "n",
  "<leader>m",
  function() require("treesj").toggle() end,
  { desc = "Toggle Splitjoin" }
)

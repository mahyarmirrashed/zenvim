require("nvim-treesitter.config").setup()

vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "TreesitterHighlight",
  callback = function(ev) pcall(vim.treesitter.start, ev.buf) end,
})

require("lze").load({
  {
    "treesj",
    keys = {
      { "<leader>m", function() require("treesj").toggle() end, "Toggle Splitjoin" },
    },
    after = function(_) require("treesj").setup({ use_default_keymaps = false }) end,
  },
})

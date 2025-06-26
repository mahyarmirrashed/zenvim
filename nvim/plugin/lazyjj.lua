require("lze").load({
  "lazyjj.nvim",
  keys = {
    { "<leader>jj", "<cmd>LazyJJ<cr>", desc = "LazyJJ" },
    { "<leader>lj", "<cmd>LazyJJ<cr>", desc = "LazyJJ" },
  },
  after = function(_) require("lazyjj").setup() end,
})

require("lze").load({
  "auto-fix-return-nvim",
  ft = "go",
  after = function(_) require("auto-fix-return").setup({}) end,
})

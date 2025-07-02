require("lze").load({
  "jdd.nvim",
  event = "DeferredUIEnter",
  after = function(_) require("jdd").setup({ root = ".", start = false }) end,
})

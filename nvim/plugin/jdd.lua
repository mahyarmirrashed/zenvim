require("lze").load({
  "jdd.nvim",
  enabled = false,
  event = "DeferredUIEnter",
  after = function(_) require("jdd").setup({ root = ".", start = false }) end,
})

require("lze").load({
  "cloak.nvim",
  enabled = false,
  event = "DeferredUIEnter",
  after = function(_) require("cloak").setup() end,
})

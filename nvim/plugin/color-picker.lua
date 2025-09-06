require("lze").load({
  "oklch-color-picker.nvim",
  event = "DeferredUIEnter",
  after = function(_) require("oklch-color-picker").setup() end,
})

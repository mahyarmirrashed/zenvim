require("lze").load({
  "nvim-early-retirement",
  event = "DeferredUIEnter",
  after = function(_) require("early-retirement").setup({ minimumBufferNum = 4 }) end,
})

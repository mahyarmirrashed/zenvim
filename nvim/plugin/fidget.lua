require("lze").load({
  "fidget.nvim",
  event = "DeferredUIEnter",
  after = function(_)
    require("fidget").setup({
      notification = {
        override_vim_notify = true,
      },
    })
  end,
})

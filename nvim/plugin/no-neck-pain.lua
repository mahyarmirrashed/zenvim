require("lze").load({
  "no-neck-pain.nvim",
  keys = {
    { "<leader>zt", "<cmd>NoNeckPain<cr>", desc = "Toggle zen mode" },
    { "<leader>z=", "<cmd>NoNeckPainWidthUp<cr>", desc = "Increase zen mode width" },
    { "<leader>z-", "<cmd>NoNeckPainWidthDown<cr>", desc = "Decrease zen mode width" },
  },
  after = function(_)
    require("no-neck-pain").setup({
      autocmds = {
        reloadOnColorSchemeChange = true,
      },
    })
  end,
})

require("lze").load({
  "lazydocker.nvim",
  keys = {
    { "<leader>ld", "<cmd>lua LazyDocker.toggle()<cr>", desc = "LazyDocker" },
  },
  after = function(_)
    require("lazydocker").setup({
      window = {
        settings = {
          width = 0.9,
          height = 0.9,
        },
      },
    })
  end,
})

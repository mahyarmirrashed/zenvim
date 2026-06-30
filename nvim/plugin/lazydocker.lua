require("lazydocker").setup({
  window = {
    settings = {
      width = 0.9,
      height = 0.9,
    },
  },
})

vim.keymap.set(
  "n",
  "<leader>ld",
  "<cmd>lua LazyDocker.toggle()<cr>",
  { desc = "LazyDocker" }
)

require("no-neck-pain").setup({
  autocmds = {
    reloadOnColorSchemeChange = true,
  },
})

vim.keymap.set("n", "<leader>zt", "<cmd>NoNeckPain<cr>", { desc = "Toggle zen mode" })
vim.keymap.set(
  "n",
  "<leader>z=",
  "<cmd>NoNeckPainWidthUp<cr>",
  { desc = "Increase zen mode width" }
)
vim.keymap.set(
  "n",
  "<leader>z-",
  "<cmd>NoNeckPainWidthDown<cr>",
  { desc = "Decrease zen mode width" }
)

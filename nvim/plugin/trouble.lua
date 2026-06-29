require("trouble").setup()

vim.keymap.set(
  "n",
  "<leader>xx",
  function() require("trouble").toggle({ mode = "diagnostics" }) end,
  { desc = "Diagnostics (Trouble)" }
)

vim.keymap.set(
  "n",
  "<leader>xX",
  function() require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } }) end,
  { desc = "Buffer Diagnostics (Trouble)" }
)

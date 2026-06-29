require("auto-session").setup({
  bypass_save_filetypes = { "alpha", "help", "nofile", "oil", "telescope", "trouble" },
  lazy_support = false,
  suppressed_dirs = { "~/Downloads" },
})

vim.o.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "Delete Session" })
vim.keymap.set("n", "<leader>sf", "<cmd>SessionSearch<cr>", { desc = "Search Session" })
vim.keymap.set(
  "n",
  "<leader>sl",
  "<cmd>SessionRestore<cr>",
  { desc = "Restore Session" }
)
vim.keymap.set(
  "n",
  "<leader>sr",
  "<cmd>SessionRestore<cr>",
  { desc = "Restore Session" }
)
vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save Session" })
vim.keymap.set(
  "n",
  "<leader>st",
  "<cmd>SessionToggleAutoSave<cr>",
  { desc = "Toggle Session Autosave" }
)
vim.keymap.set(
  "n",
  "<leader>s<bs>",
  "<cmd>SessionPurgeOrphaned<cr>",
  { desc = "Clean Orphaned Sessions" }
)

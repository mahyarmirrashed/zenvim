require("oil").setup({
  default_file_explorer = true,
  keymaps = {
    ["h"] = { "actions.parent", mode = "n" },
    ["l"] = { "actions.select", mode = "n" },
  },
  columns = { "icon", "permissions", "size" },
  view_options = {
    show_hidden = true,
  },
})

require("oil-git").setup({
  highlights = {
    OilGitAdded = { link = "GruvboxGreen" },
    OilGitModified = { link = "GruvboxYellow" },
    OilGitRenamed = { link = "GruvboxPurple" },
    OilGitDeleted = { link = "GruvboxRed" },
    OilGitCopied = { link = "GruvboxPurple" },
    OilGitConflict = { link = "GruvboxOrange" },
    OilGitUntracked = { link = "GruvboxBlue" },
    OilGitIgnored = { link = "GruvboxGray" },
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Toggle Oil file explorer" })

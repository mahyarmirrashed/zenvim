require("lze").load({
  {
    "oil.nvim",
    dep_of = "oil-git.nvim",
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", desc = "Toggle Oil file explorer" },
    },
    after = function(_)
      require("oil").setup({
        -- Replace `netrw` as default file explorer
        default_file_explorer = true,
        -- Keymaps in oil buffer
        keymaps = {
          ["h"] = { "actions.parent", mode = "n" },
          ["l"] = { "actions.select", mode = "n" },
        },
        -- Columns to show for files
        columns = {
          "icon",
          "permissions",
          "size",
        },
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
        },
      })
    end,
  },
  {
    "oil-git.nvim",
    after = function(_)
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
    end,
  },
})

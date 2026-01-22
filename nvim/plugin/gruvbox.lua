require("lze").load({
  "gruvbox.nvim",
  dep_of = "oil-git.nvim",
  after = function()
    require("gruvbox").setup({ terminal_colors = true })

    vim.cmd.colorscheme("gruvbox")
  end,
})

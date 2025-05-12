require("lze").load({
  "gruvbox.nvim",
  after = function()
    require("gruvbox").setup({ terminal_colors = true })

    vim.cmd.colorscheme("gruvbox")
  end,
})

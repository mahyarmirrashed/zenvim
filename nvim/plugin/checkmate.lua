require("lze").load({
  "checkmate.nvim",
  ft = "markdown",
  after = function(_)
    require("checkmate").setup({
      files = { "*.md" },
      todo_markers = {
        unchecked = "[ ]",
        checked = "[x]",
      },
    })
  end,
})

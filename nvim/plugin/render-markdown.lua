require("lze").load({
  "render-markdown-nvim",
  ft = "markdown",
  after = function(_)
    require("render-markdown").setup({
      completions = { blink = { enabled = true } },
      latex = { enabled = false },
    })
  end,
})

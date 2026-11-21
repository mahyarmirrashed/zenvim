vim.lsp.enable("markdown_oxide")

require("render-markdown").setup({
  completions = { blink = { enabled = true } },
  latex = { enabled = false },
})

require("checkmate").setup({
  files = { "*.md" },
  todo_markers = {
    unchecked = "[ ]",
    checked = "[x]",
  },
})

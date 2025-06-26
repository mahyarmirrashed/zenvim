require("lze").load({
  "freeze.nvim",
  event = "DeferredUIEnter",
  after = function(_)
    require("freeze").setup({
      output = function()
        local date = os.date("%Y-%m-%d")
        local f = vim.fn.expand("%:t")
        local name = f:sub(1, 1) == "." and (f:match("([^%.]+)$") or f:sub(2)) or f:match("^[^%.]+")
        return string.format("./%s_%s_freeze.png", date, name or "untitled")
      end,
      theme = "gruvbox",
    })
  end,
})

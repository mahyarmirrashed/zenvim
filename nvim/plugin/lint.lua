local lint = require("lint")

lint.linters_by_ft = {
  dockerfile = { "hadolint" },
}

vim.api.nvim_create_augroup("Linting", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = "Linting",
  callback = function() lint.try_lint() end,
})

require("lze").load({
  "schema-companion.nvim",
  ft = "yaml",
  after = function(_)
    require("schema-companion").setup({
      enable_telescope = true,
      matchers = { require("schema-companion.matchers.kubernetes").setup({ version = "master" }) },
    })
  end,
})

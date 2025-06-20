require("lze").load({
  "conform.nvim",
  event = "BufWritePre",
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      desc = "Format Document",
      mode = { "n", "v" },
    },
  },
  after = function(_)
    require("conform").setup({
      formatters_by_ft = {
        sh = { "shfmt" },
        go = { "gofumpt", "goimports" },
        javascript = { "prettierd" },
        json = { "jq" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        nix = { "nixfmt" },
        typescript = { "prettierd" },
        yaml = { "yamlfmt" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })
  end,
})

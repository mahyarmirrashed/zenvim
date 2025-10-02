require("lze").load({
  "conform.nvim",
  event = "BufWritePre",
  after = function(_)
    require("conform").setup({
      formatters_by_ft = {
        css = { "prettierd" },
        go = { "gofumpt", "goimports" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        json = { "jq" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        nix = { "nixfmt" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        toml = { "taplo" },
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

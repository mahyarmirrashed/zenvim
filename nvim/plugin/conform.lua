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
        kotlin = { "ktlint", "ktfmt" },
        json = { "jq" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        nix = { "nixfmt" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        toml = { "taplo" },
        typescript = { "prettierd" },
        typst = { "typstyle" },
        xml = { "prettierd" },
        yaml = { "yamlfmt" },
      },
      format_after_save = {
        lsp_fallback = true,
      },
    })
  end,
})

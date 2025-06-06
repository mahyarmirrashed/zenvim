require("lze").load({
  {
    "nvim-lspconfig",
    on_require = "lspconfig",
    keys = {
      { "<leader>rn", vim.lsp.buf.rename, "Rename" },
      { "<leader>la", vim.lsp.buf.code_action, "Code Action" },
      { "K", vim.lsp.buf.hover, "Hover Documentation" },
      { "<c-k>", vim.lsp.buf.signature_help, "Signature Documentation" },
    },
    lsp = function(plugin)
      vim.lsp.config(plugin.name, plugin.lsp or {})
      vim.lsp.enable(plugin.name)
    end,
    before = function()
      vim.lsp.config("*", {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })
    end,
  },
  -- LSP server definitions
  {
    "lua_ls",
    lsp = {
      filetypes = { "lua" },
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          formatters = { ignoreComments = true },
          telemetry = { enabled = false },
        },
      },
    },
  },
  {
    "nixd",
    lsp = {
      filetypes = { "nix" },
    },
  },
  {
    "gopls",
    lsp = {
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
    },
  },
  {
    "svelte",
    lsp = {
      filetypes = { "svelte" },
      settings = {
        svelte = {
          plugin = {
            svelte = { format = { enable = true } },
            typescript = { enable = true },
          },
        },
      },
    },
  },
  {
    "typescript-language-server",
    lsp = {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
          format = { enable = true },
          suggest = { completeFunctionCalls = true },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
          format = { enable = true },
          suggest = { completeFunctionCalls = true },
        },
      },
    },
  },
})

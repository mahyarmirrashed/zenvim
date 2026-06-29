-- Global LSP capabilities applied to all servers
vim.lsp.config("*", {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- LSP keymaps (buffer-local, set on attach)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
    end
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>la", vim.lsp.buf.code_action, "Code Action")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("<c-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  end,
})

-- LSP server configurations (settings only, activation via ftplugin/)
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      formatters = { ignoreComments = true },
      telemetry = { enabled = false },
    },
  },
})

vim.lsp.config("gopls", {
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
})

vim.lsp.config("helm_ls", {
  settings = {
    ["helm-ls"] = {
      yamlls = {
        path = "yaml-language-server",
      },
    },
  },
})

vim.lsp.config("svelte", {
  settings = {
    svelte = {
      plugin = {
        svelte = { format = { enable = true } },
        typescript = { enable = true },
      },
    },
  },
})

vim.lsp.config("tailwindcss", {
  settings = {
    tailwindCSS = {
      classFunctions = { "clsx" },
    },
  },
})

vim.lsp.config("tinymist", {
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onType",
    semanticTokens = "enable",
  },
})

vim.lsp.config("typescript-language-server", {
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
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      validate = { enable = true },
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
    },
  },
})

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemaStore = { enable = true },
      kubernetesCRDStore = { enable = true },
    },
  },
})

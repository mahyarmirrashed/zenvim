require("lze").load({
  {
    "nvim-treesitter",
    dep_of = { "treesj", "nvim-ts-autotag", "auto-fix-return", "render-markdown" },
    event = "DeferredUIEnter",
    after = function(_)
      require("nvim-treesitter.config").setup()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          pcall(vim.treesitter.start, buf)
        end
      end
    end,
  },
  {
    "treesj",
    event = "DeferredUIEnter",
    keys = {
      { "<leader>m", function() require("treesj").toggle() end, "Toggle Splitjoin" },
    },
    after = function(_)
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },
  {
    "nvim-ts-autotag",
    after = function(_) require("nvim-ts-autotag").setup() end,
  },
})

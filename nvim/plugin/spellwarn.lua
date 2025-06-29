require("lze").load({
  "spellwarn.nvim",
  event = "DeferredUIEnter",
  keys = {
    { "<leader>wt", function() require("spellwarn").toggle() end, mode = "n", desc = "Toggle spell warnings" },
  },
  after = function(_)
    require("spellwarn").setup({
      enable = false,
      ft_default = "cursor",
      ft_config = {
        markdown = "iter",
        tex = "cursor",
        text = "iter",
      },
      severity = {
        spellcap = false,
        spelllocal = false,
        spellrare = false,
      },
    })
  end,
})

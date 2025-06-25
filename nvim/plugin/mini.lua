require("lze").load({
  "mini.surround",
  dep_of = "render-markdown",
  event = "DeferredUIEnter",
  after = function(_)
    require("mini.surround").setup({
      respect_selection_type = true,
      search_method = "cover_or_nearest",
    })
  end,
})

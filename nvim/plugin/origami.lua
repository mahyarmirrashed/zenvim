vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

require("origami").setup({
  foldKeymaps = {
    closeOnlyOnFirstColumn = true,
    scrollLeftOnCaret = false,
  },
})

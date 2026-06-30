require("lualine").setup({
  options = {
    theme = "gruvbox_dark",
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        symbols = { modified = " ●", alternate_file = "" },
        mode = 2,
      },
    },
    lualine_z = { "tabs" },
  },
})

for i = 1, 9 do
  vim.keymap.set(
    "n",
    "<leader>" .. i,
    ":LualineBuffersJump " .. i .. "<cr>",
    { noremap = true, silent = true, desc = "Go to buffer " .. i }
  )
end

vim.keymap.set(
  "n",
  "<leader>0",
  ":b#<cr>",
  { noremap = true, silent = true, desc = "Go to last buffer" }
)

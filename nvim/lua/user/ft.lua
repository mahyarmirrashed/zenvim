vim.filetype.add({
  extension = {
    Containerfile = "dockerfile",
  },
  pattern = {
    [".env.*"] = "sh",
  },
})

require("telescope").setup()

local function tf(cmd, opts)
  return function() return require("telescope.builtin")[cmd](opts or {}) end
end

-- Essential
vim.keymap.set("n", "<leader><space>", tf("find_files"), { desc = "Search Files" })
vim.keymap.set("n", "<leader>,", tf("buffers"), { desc = "Search Buffers" })
vim.keymap.set(
  "n",
  "<leader>:",
  tf("command_history"),
  { desc = "Search Command History" }
)

-- Find
vim.keymap.set("n", "<leader>fa", tf("autocommands"), { desc = "Search Autocommands" })
vim.keymap.set("n", "<leader>fb", tf("buffers"), { desc = "Search Buffers" })
vim.keymap.set("n", "<leader>fc", tf("commands"), { desc = "Search Commands" })
vim.keymap.set(
  "n",
  "<leader>fC",
  tf("command_history"),
  { desc = "Search Command History" }
)
vim.keymap.set(
  "n",
  "<leader>fd",
  tf("diagnostics"),
  { desc = "Search Diagnostics (All)" }
)
vim.keymap.set(
  "n",
  "<leader>fD",
  tf("diagnostics", { bufnr = 0 }),
  { desc = "Search Diagnostics (Buffer)" }
)
vim.keymap.set("n", "<leader>ff", tf("find_files"), { desc = "Search Files" })
vim.keymap.set(
  "n",
  "<leader>fF",
  tf("find_files", { hidden = true }),
  { desc = "Search All Files" }
)
vim.keymap.set("n", "<leader>fg", tf("git_files"), { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>fh", tf("help_tags"), { desc = "Search Help Pages" })
vim.keymap.set(
  "n",
  "<leader>fH",
  tf("highlights"),
  { desc = "Search Highlight Groups" }
)
vim.keymap.set("n", "<leader>fj", tf("jumplist"), { desc = "Search Jump List" })
vim.keymap.set("n", "<leader>fk", tf("keymaps"), { desc = "Search Key Mappings" })
vim.keymap.set("n", "<leader>fl", tf("loclist"), { desc = "Search Location List" })
vim.keymap.set("n", "<leader>fm", tf("man_pages"), { desc = "Search Man Pages" })
vim.keymap.set(
  "n",
  "<leader>fo",
  tf("oldfiles"),
  { desc = "Search Old (Recent) Files" }
)
vim.keymap.set("n", "<leader>fq", tf("quickfix"), { desc = "Search Quickfix List" })
vim.keymap.set({ "n", "x" }, "<leader>fw", tf("live_grep"), { desc = "Search Words" })
vim.keymap.set(
  { "n", "x" },
  "<leader>fW",
  tf("live_grep", { additional_args = { "--hidden" } }),
  { desc = "Search All Words" }
)
vim.keymap.set(
  "n",
  "<leader>f.",
  tf("current_buffer_fuzzy_find"),
  { desc = "Search Buffer Lines" }
)
vim.keymap.set("n", "<leader>f/", tf("search_history"), { desc = "Search History" })
vim.keymap.set("n", "<leader>f'", tf("marks"), { desc = "Search Marks" })
vim.keymap.set("n", '<leader>f"', tf("registers"), { desc = "Search Registers" })
vim.keymap.set("n", "<leader>f<cr>", tf("resume"), { desc = "Resume Last Search" })

-- Git
vim.keymap.set("n", "<leader>gb", tf("git_branches"), { desc = "Search Git Branches" })
vim.keymap.set("n", "<leader>gs", tf("git_status"), { desc = "Search Git Status" })
vim.keymap.set("n", "<leader>gS", tf("git_stash"), { desc = "Search Git Stash" })
vim.keymap.set("n", "<leader>gl", tf("git_commits"), { desc = "Search Git Commits" })
vim.keymap.set(
  "n",
  "<leader>gf",
  tf("git_bcommits"),
  { desc = "Search Git Buffer Commits" }
)

-- LSP
vim.keymap.set("n", "gd", tf("lsp_definitions"), { desc = "Go to Definition" })
vim.keymap.set("n", "gD", tf("lsp_declarations"), { desc = "Go to Declaration" })
vim.keymap.set(
  "n",
  "gr",
  tf("lsp_references"),
  { nowait = true, desc = "Search References" }
)
vim.keymap.set("n", "gI", tf("lsp_implementations"), { desc = "Go to Implementation" })
vim.keymap.set(
  "n",
  "gy",
  tf("lsp_type_definitions"),
  { desc = "Go to Type Definition" }
)

-- Miscellaneous
vim.keymap.set("n", "<leader>uC", tf("colorscheme"), { desc = "Search Colorschemes" })

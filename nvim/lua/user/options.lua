-- See :help E355 for the full list of options

-- resolves to ~/.local/share/<program-name>/spell
local spelldir = vim.fn.stdpath("data") .. "/spell"

-- create if not exists
vim.fn.mkdir(spelldir, "p")

-- General
vim.opt.clipboard = "unnamedplus" -- use system clipboard (`+` register)
vim.opt.mouse = "a" -- enable mouse support in all modes
vim.opt.spell = true -- enable spell checking
vim.opt.spellcapcheck = "" -- disable capitalization check
vim.opt.spellfile = spelldir .. "/en.add" -- specify spell file directory
vim.opt.spelllang = "en" -- specify language for spell checking
vim.opt.swapfile = false -- disable swap files to avoid clutter
vim.opt.undofile = true -- enable undo files for persistent undo

-- Neovim UI
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.cursorline = true -- highlight the current line
vim.opt.showmatch = true -- show matching parenthesis
vim.opt.ignorecase = true -- search: ignore casing
vim.opt.smartcase = true -- search: obey casing containing uppercase
vim.opt.hlsearch = true -- search: highlight results
vim.opt.incsearch = true -- search: show matches as you type
vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.scrolloff = 2 -- number of lines above/below on scroll
vim.opt.sidescrolloff = 2 -- number of lines left/right on side scroll
vim.opt.wrap = true -- enable line wrapping
vim.opt.list = true -- show invisible characters at end of lines
vim.opt.listchars = { -- customize invisible characters
  tab = "» ",
  trail = "-",
  nbsp = "␣",
  extends = ">",
  precedes = "<",
}
vim.opt.cmdheight = 0 -- remove command line on bottom

-- Tabs and Indentation
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- number of spaces for each indent level
vim.opt.tabstop = 2 -- number of spaces for a tab character
vim.opt.softtabstop = 2 -- number of spaces cursor to move on tab character
vim.opt.autoindent = true -- enable auto indentation
vim.opt.smartindent = true -- enable smart indentation
vim.opt.breakindent = true -- enable break indentation for wrapped lines

-- Diagnostics
local icons = {
  [vim.diagnostic.severity.ERROR] = "✘",
  [vim.diagnostic.severity.WARN] = "⁉",
  [vim.diagnostic.severity.INFO] = "ℹ",
  [vim.diagnostic.severity.HINT] = "➤",
}
local function format_diagnostic(diagnostic)
  local source = diagnostic.source and diagnostic.source:gsub("%.$", "") or "unknown"
  local code = diagnostic.code or source
  local icon = icons[diagnostic.severity] or "■"

  return icon .. " " .. code .. ": " .. diagnostic.message
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "",
    source = "if_many", -- Show source (e.g., "hadolint") if multiple sources
    format = format_diagnostic,
  },
  signs = true, -- signs in gutter
  update_in_insert = false, -- Only update diagnostics in Normal mode
  underline = true, -- Underline errors as well
  severity_sort = true, -- Sort by severity
})

-- Performance
vim.opt.history = 100 -- remember last N, ":" commands

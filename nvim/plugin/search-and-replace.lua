local function prompt_search_and_replace(opts)
  local function prompt_input(label, cb, _opts)
    _opts = _opts or {}
    vim.ui.input({ prompt = label }, function(input)
      if _opts.optional or input ~= "" then cb(input) end
    end)
  end

  if opts.mode == "n" then
    prompt_input("Search: ", function(search)
      prompt_input("Replace: ", function(replace)
        prompt_input("Glob (optional, e.g. *.lua): ", function(glob)
          local cmd = string.format("SearchAndReplace %s %s%s", search, replace, glob and (" " .. glob) or "")
          vim.cmd(cmd)
        end, { optional = true })
      end)
    end)
  elseif opts.mode == "x" then
    prompt_input("Replace: ", function(replace)
      prompt_input("Glob (optional, e.g. *.lua): ", function(glob)
        local cmd = string.format("'<,'>SearchAndReplaceVisual %s%s", replace, glob and (" " .. glob) or "")
        vim.cmd(cmd)
      end, { optional = true })
    end)
  end
end

require("lze").load({
  "search-and-replace.nvim",
  lazy = false,
  keys = {
    {
      "<leader>fr",
      function() prompt_search_and_replace({ mode = "n" }) end,
      desc = "Search and replace for file",
      mode = "n",
    },
    {
      "<leader>fr",
      function() prompt_search_and_replace({ mode = "x" }) end,
      desc = "Search and replace for selection",
      mode = "x",
    },
  },
  after = function(_) require("search-and-replace").setup() end,
})

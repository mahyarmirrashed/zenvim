-- Ignore certain vim.notify notifications
local ignored_messages = {
  "failed to get nvim-treesitter parser",
}

local notify = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" then
    for _, message in ipairs(ignored_messages) do
      if msg:find(message, 1, true) then
        return -- Ignore this message
      end
    end
  end
  notify(msg, level, opts)
end

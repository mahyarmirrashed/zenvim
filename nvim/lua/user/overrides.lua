-- Ignore certain vim.notify notifications
local ignored_messages = {
  "failed to get nvim-treesitter parser",
  "checkmate: saved",
}

local notify = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" then
    local lower_msg = msg:lower()
    for _, message in ipairs(ignored_messages) do
      if lower_msg:find(message:lower(), 1, true) then
        return -- Ignore this message
      end
    end
  end
  notify(msg, level, opts)
end

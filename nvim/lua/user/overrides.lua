-- Ignore certain vim.notify notifications
local ignored_messages = {
  "checkmate: saved",
}

local notify = vim.notify

---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
  if type(msg) == "string" then
    for _, i in ipairs(ignored_messages) do
      if msg:lower():find(i:lower(), 1, true) then return end
    end
  end
  notify(msg, ...)
end

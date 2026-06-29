local header = {
  [[=================     ===============     ===============   ========  ========]],
  [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
  [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
  [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
  [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
  [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
  [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
  [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
  [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
  [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
  [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
  [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
  [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
  [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
  [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
  [[||.=='    _-'                                                     `' |  /==.||]],
  [[=='    _-'                        Z E N V I M                         \/   `==]],
  [[\   _-'                                                                `-_   /]],
  [[ `''                                                                      ``' ]],
}

local function wrap_quote(quote, max_len)
  local lines = {}

  while #quote > 0 do
    if #quote <= max_len then
      table.insert(lines, quote)
      break
    end

    local split_at = quote:sub(1, max_len):find("%s[^%s]*$") or max_len

    table.insert(lines, quote:sub(1, split_at):match("^%s*(.-)%s*$"))
    quote = quote:sub(split_at + 1)
  end

  return lines
end

require("famous-quotes").setup()

local theta = require("alpha.themes.theta")

theta.header.val = header

local quote = require("famous-quotes").get_quote()[1]
local quote_lines = wrap_quote(quote.quote, 79)
table.insert(quote_lines, "")
table.insert(quote_lines, "— " .. quote.author)

table.insert(theta.config.layout, 3, {
  type = "text",
  val = quote_lines,
  opts = { position = "center", hl = "Comment" },
})
table.insert(theta.config.layout, 3, { type = "padding", val = 2 })

table.remove(theta.config.layout, #theta.config.layout)
table.remove(theta.config.layout, #theta.config.layout)

require("alpha").setup(theta.config)

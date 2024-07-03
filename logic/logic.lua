-- logic/logic.lua
local file = io.open(arg[1], "r")
local title = nil

if file then
  for line in file:lines() do
    local match = string.match(line, "\\title{(.+)}")
    if match then
      title = match
      break
    end
  end
  file:close()
end

if title then
  -- Remove non-alphanumeric characters and replace spaces with underscores
  title = title:gsub("[^%w%s]", ""):gsub("%s+", "_")
  print(title .. ".pdf")
else
  print("document.pdf")
end

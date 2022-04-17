local w = 500
local frame_h = 46
local text_h = 32

local skin = {}

skin.image = {
  {id = "search_frame", src = 3, x = 0, y = 0, w = w, h = frame_h}
}

skin.text = {
  {id = "search", font = 0, size = text_h, ref = 30}
}

do
  local base_x = 50 local base_y = 50
  skin.destination = {
    {id = "search_frame", dst = {
      {x = base_x - 8, y = base_y - 8, w = w, h = frame_h, r = 16, g = 16, b = 16}
    }},
    {id = "search", filter = 1, dst = {
      {x = base_x, y = base_y, w = w, h = text_h}
    }}
  }
end

return skin
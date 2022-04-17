local header = require "header"

local src = "src_white"
local w = 25
local frame_h = 600
local thumb_h = 4

local skin = {}

skin.image = {
  {id = "scrollbar_frame", src = src, x = 0, y = 0, w = w, h = frame_h}
}

skin.slider = {
  {id = "scrollbar_thumb", src = src, x = 0, y = 0, w = w, h = thumb_h, angle = 2, type = 1, range = frame_h}
}

do
  local x = 1860
  local y = (header.h - frame_h) / 2
  skin.destination = {
    {id = "scrollbar_frame", dst = {
      {x = x, y = y, w = w, h = frame_h, r = 16, g = 16, b = 16}
    }},
    {id = "scrollbar_thumb", dst = {
      {x = x, y = y + frame_h, w = w, h = thumb_h, r = 225, g = 225, b = 225}
    }}
  }
end

return skin
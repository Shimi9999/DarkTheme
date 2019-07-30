local header = require "header"

local ScrollBar = {}
ScrollBar.src = 3
ScrollBar.w = 20
ScrollBar.frame_h = 600
ScrollBar.thumb_h = 50
function ScrollBar.new()
  local obj = {}
  return setmetatable(obj, {__index = ScrollBar})
end
function ScrollBar.image()
  return {
    {id = "scrollbar_frame", src = ScrollBar.src, x = 0, y = 0, w = ScrollBar.w, h = ScrollBar.frame_h}
  }
end
function ScrollBar.slider()
  return {
    {id = "scrollbar_thumb", src = ScrollBar.src, x = 0, y = 0, w = ScrollBar.w, h = ScrollBar.thumb_h, angle = 2, type = 1, range = ScrollBar.frame_h - ScrollBar.thumb_h}
  }
end
function ScrollBar.destination()
  local x = 1860
  local y = (header.h - ScrollBar.frame_h) / 2
  return {
    {id = "scrollbar_frame", dst = { {x = x, y = y, w = ScrollBar.w, h = ScrollBar.frame_h, r = 16, g = 16, b = 16} }},
    {id = "scrollbar_thumb", dst = { {x = x, y = y + ScrollBar.frame_h - ScrollBar.thumb_h, w = ScrollBar.w, h = ScrollBar.thumb_h, r = 225, g = 225, b = 225} }}
  }
end

return ScrollBar
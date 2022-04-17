local utils = require "utils"

local src = 3
local w = 25
local frame_h = 200
local thumb_h = 4
local text_src = 17
local text_w = 20
local text_h = 120

local skin = {}

skin.image = {
  {id = "volumetext_master", src = text_src, x = text_w * 0, y = 0, w = text_w, h = text_h},
  {id = "volumetext_key", src = text_src, x = text_w * 1, y = 0, w = text_w, h = text_h},
  {id = "volumetext_bgm", src = text_src, x = text_w * 2, y = 0, w = text_w, h = text_h},

  {id = "volumeslider_frame", src = src, x = 0, y = 0, w = w, h = frame_h}
}

skin.value = {
  utils.generateValue({id = "volume_master", digit = 3, ref = 57, align = 2}),
  utils.generateValue({id = "volume_key", digit = 3, ref = 58, align = 2}),
  utils.generateValue({id = "volume_bgm", digit = 3, ref = 59, align = 2})
}

skin.slider = {
  {id = "volumeslider_master", src = src, x = 0, y = 0, w = w, h = thumb_h, angle = 0, type = 17, range = frame_h},
  {id = "volumeslider_key", src = src, x = 0, y = 0, w = w, h = thumb_h, angle = 0, type = 18, range = frame_h},
  {id = "volumeslider_bgm", src = src, x = 0, y = 0, w = w, h = thumb_h, angle = 0, type = 19, range = frame_h}
}

do
  local base_x = 900
  local base_y = 250
  local op = {1}
  local space = 35

  local function slider_dst(name, x, y)
    return {
      {id = "volume_"..name, op = op, filter = 1, dst = {
        {x = x - 5, y = y + frame_h + 4, w = 14, h = 22}
      }},
      {id = "volumeslider_frame", op = op, dst = {
        {x = x, y = y, w = w, h = frame_h, r = 16, g = 16, b = 16}
      }},
      {id = "volumeslider_"..name, op = op, dst = {
        {x = x, y = y, w = w, h = thumb_h, r = 225, g = 225, b = 225}
      }},
      {id = "volumetext_"..name, op = op, dst = {
        {x = x + 2, y = y - text_h, w = text_w, h = text_h}
      }}
    }
  end

  skin.destination = {}
  utils.merge_all(skin.destination, slider_dst("master", base_x, base_y))
  utils.merge_all(skin.destination, slider_dst("key", base_x + space, base_y))
  utils.merge_all(skin.destination, slider_dst("bgm", base_x + space * 2, base_y))
end

return skin
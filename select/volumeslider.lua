local Object = require "object"

local VolumeSlider = Object.new()
VolumeSlider.src = 3
VolumeSlider.w = 25
VolumeSlider.frame_h = 200
VolumeSlider.thumb_h = 4
VolumeSlider.text_src = 17
VolumeSlider.text_w = 20
VolumeSlider.text_h = 120
function VolumeSlider.image()
  return {
    {id = "volumetext_master", src = VolumeSlider.text_src, x = VolumeSlider.text_w * 0, y = 0, w = VolumeSlider.text_w, h = VolumeSlider.text_h},
    {id = "volumetext_key", src = VolumeSlider.text_src, x = VolumeSlider.text_w * 1, y = 0, w = VolumeSlider.text_w, h = VolumeSlider.text_h},
    {id = "volumetext_bgm", src = VolumeSlider.text_src, x = VolumeSlider.text_w * 2, y = 0, w = VolumeSlider.text_w, h = VolumeSlider.text_h},

    {id = "volumeslider_frame", src = VolumeSlider.src, x = 0, y = 0, w = VolumeSlider.w, h = VolumeSlider.frame_h}
  }
end
function VolumeSlider.slider()
  return {
    {id = "volumeslider_master", src = VolumeSlider.src, x = 0, y = 0, w = VolumeSlider.w, h = VolumeSlider.thumb_h, angle = 0, type = 17, range = VolumeSlider.frame_h},
    {id = "volumeslider_key", src = VolumeSlider.src, x = 0, y = 0, w = VolumeSlider.w, h = VolumeSlider.thumb_h, angle = 0, type = 18, range = VolumeSlider.frame_h},
    {id = "volumeslider_bgm", src = VolumeSlider.src, x = 0, y = 0, w = VolumeSlider.w, h = VolumeSlider.thumb_h, angle = 0, type = 19, range = VolumeSlider.frame_h}
  }
end
function VolumeSlider.destination()
  local x = 900
  local y = 250
  local op = {1}
  local space = 35
  return {
    {id = "volumeslider_frame", op = op, dst = { {x = x, y = y, w = VolumeSlider.w, h = VolumeSlider.frame_h, r = 16, g = 16, b = 16} }},
    {id = "volumeslider_master", op = op, dst = { {x = x, y = y, w = VolumeSlider.w, h = VolumeSlider.thumb_h, r = 225, g = 225, b = 225} }},
    {id = "volumetext_master", op = op, dst = { {x = x + 2, y = y - VolumeSlider.text_h, w = VolumeSlider.text_w, h = VolumeSlider.text_h} }},

    {id = "volumeslider_frame", op = op, dst = { {x = x + space, y = y, w = VolumeSlider.w, h = VolumeSlider.frame_h, r = 16, g = 16, b = 16} }},
    {id = "volumeslider_key", op = op, dst = { {x = x + space, y = y, w = VolumeSlider.w, h = VolumeSlider.thumb_h, r = 225, g = 225, b = 225} }},
    {id = "volumetext_key", op = op, dst = { {x = x + space + 2, y = y - VolumeSlider.text_h, w = VolumeSlider.text_w, h = VolumeSlider.text_h} }},

    {id = "volumeslider_frame", op = op, dst = { {x = x + space * 2, y = y, w = VolumeSlider.w, h = VolumeSlider.frame_h, r = 16, g = 16, b = 16} }},
    {id = "volumeslider_bgm", op = op, dst = { {x = x + space * 2, y = y, w = VolumeSlider.w, h = VolumeSlider.thumb_h, r = 225, g = 225, b = 225} }},
    {id = "volumetext_bgm", op = op, dst = { {x = x + space * 2 + 2, y = y - VolumeSlider.text_h, w = VolumeSlider.text_w, h = VolumeSlider.text_h} }},
  }
end

return VolumeSlider
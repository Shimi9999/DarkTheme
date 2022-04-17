local utils = require "utils"

local skin = {}

do
  local src = 10
  local x = 0 local y = 0 local w = 526 local h = 64
  skin.image = {
    {id = "uptime", src = src, x = x, y = y + h * 0, w = w, h = h}
  }
end

do
  local font = 1
  local size = 64
  skin.text = {
    {id = "bottom_fps", font = font, size = size, constantText = "FPS"},
    {id = "bottom_uptime", font = font, size = size, constantText = "UPTIME"},

    {id = "ir_offline", font = font, size = size, constantText = "IR OFFLINE"},
    {id = "ir_online", font = font, size = size, constantText = "IR ONLINE"}
  }
end

skin.value = {
  utils.generateValue({id = "fps_num", digit = 4, ref = 20}),

  utils.generateValue({id = "uptime_hour_num", digit = 2, ref = 27}),
  utils.generateValueX({id = "uptime_minute_num", digit = 2, ref = 28}, 11),
  utils.generateValueX({id = "uptime_second_num", digit = 2, ref = 29}, 11),
}

do
  local scale = 0.45
  local base_x = 16 local y = 4
  local num_y = y + 3 local num_w = 48 * scale
  local h = 64 * scale
  local uptime_x = base_x + 170 local uptimenum_x = uptime_x + 70
  local ir_x = uptimenum_x + 250
  local info_color = {r = 105, g = 105, b = 105}

  skin.destination = {
    {id = "bottom_fps", filter = 1, dst = {
      utils.merge_all({x = base_x, y = y, w = num_w, h = h}, info_color)
    }},
    {id = "fps_num", filter = 1, dst = {
      utils.merge_all({x = base_x + 50, y = num_y, w = num_w, h = h}, info_color)
    }},

    {id = "bottom_uptime", filter = 1, dst = {
      utils.merge_all({x = uptime_x, y = y, w = 1, h = h}, info_color)
    }},
    {id = "uptime_hour_num", filter = 1, dst = {
      utils.merge_all({x = uptimenum_x + 50 * 1, y = num_y, w = num_w, h = h}, info_color)
    }},
    {id = "colon", filter = 1, dst = {
      utils.merge_all({x = uptimenum_x + 32 + 50 * 1, y = num_y, w = num_w, h = h},info_color)
    }},
    {id = "uptime_minute_num", filter = 1, dst = {
      utils.merge_all({x = uptimenum_x + 50 * 2, y = num_y, w = num_w, h = h}, info_color)
    }},
    {id = "colon", filter = 1, dst = {
      utils.merge_all({x = uptimenum_x + 32 + 50 * 2, y = num_y, w = num_w, h = h}, info_color)
    }},
    {id = "uptime_second_num", filter = 1, dst = {
      utils.merge_all({x = uptimenum_x + 50 * 3, y = num_y, w = num_w, h = h}, info_color)
    }},

    {id = "ir_offline", op = {50}, filter = 1, dst = {
      utils.merge_all({x = ir_x, y = y, w = 1, h = h}, info_color)
    }},
    {id = "ir_online", op = {51}, filter = 1, dst = {
      utils.merge_all({x = ir_x, y = y, w = 1, h = h}, info_color)
    }}
  }
end

return skin
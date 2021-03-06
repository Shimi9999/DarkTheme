local utils = require "utils"
local Object = require "object"

local BottomInfo = Object.new()
function BottomInfo.image()
  local src = 10 local x = 0 local y = 0 local w = 526 local h = 64
  return {
    {id = "uptime", src = src, x = x, y = y + h * 0, w = w, h = h}
  }
end
function BottomInfo.text()
  return {
    {id = "bottom_fps", font = 1, size = 64, constantText = "FPS"},
    {id = "bottom_uptime", font = 1, size = 64, constantText = "UPTIME"},

    {id = "ir_offline", font = 1, size = 64, constantText = "IR OFFLINE"},
    {id = "ir_online", font = 1, size = 64, constantText = "IR ONLINE"}
  }
end
function BottomInfo.value()
  return {
    utils.generateValue({id = "fps_num", digit = 4, ref = 20}),

    utils.generateValue({id = "uptime_hour_num", digit = 2, ref = 27}),
    utils.generateValueX({id = "uptime_minute_num", digit = 2, ref = 28}, 11),
    utils.generateValueX({id = "uptime_second_num", digit = 2, ref = 29}, 11),
  }
end
function BottomInfo.destination()
  local scale = 0.45
  local base_x = 16 local y = 4 local ny = y + 3 local nw = 48 * scale local h = 64 * scale
  local uptime_x = base_x + 170 local uptimenum_x = uptime_x + 70
  local ir_x = uptimenum_x + 250
  local info_color = {r = 105, g = 105, b = 105}
  return {
    {id = "bottom_fps", filter = 1, dst = { utils.mergeMap({x = base_x, y = y, w = nw, h = h}, info_color) }},
    {id = "fps_num", filter = 1, dst = { utils.mergeMap({x = base_x + 50, y = ny, w = nw, h = h}, info_color) }},

    {id = "bottom_uptime", filter = 1, dst = { utils.mergeMap({x = uptime_x, y = y, w = 1, h = h}, info_color) }},
    {id = "uptime_hour_num", filter = 1, dst = { utils.mergeMap({x = uptimenum_x + 50 * 1, y = ny, w = nw, h = h}, info_color) }},
    {id = "colon", filter = 1, dst = { utils.mergeMap({x = uptimenum_x + 32 + 50 * 1, y = ny, w = nw, h = h}, info_color) }},
    {id = "uptime_minute_num", filter = 1, dst = { utils.mergeMap({x = uptimenum_x + 50 * 2, y = ny, w = nw, h = h}, info_color) }},
    {id = "colon", filter = 1, dst = { utils.mergeMap({x = uptimenum_x + 32 + 50 * 2, y = ny, w = nw, h = h}, info_color) }},
    {id = "uptime_second_num", filter = 1, dst = { utils.mergeMap({x = uptimenum_x + 50 * 3, y = ny, w = nw, h = h}, info_color) }},

    {id = "ir_offline", op = {50}, filter = 1, dst = { utils.mergeMap({x = ir_x, y = y, w = 1, h = h}, info_color) }},
    {id = "ir_online", op = {51}, filter = 1, dst = { utils.mergeMap({x = ir_x, y = y, w = 1, h = h}, info_color) }}
  }
end

return BottomInfo
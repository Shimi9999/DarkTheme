local utils = require "utils"

local BottomInfo = {}
function BottomInfo.new()
  local obj = {}
  return setmetatable(obj, {__index = BottomInfo})
end
function BottomInfo.image()
  local src = 10 local x = 0 local y = 0 local w = 526 local h = 64
  return {
    {id = "uptime", src = src, x = x, y = y + h * 0, w = w, h = h}
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
  local base_x = 4 local y = 4 local nw = 48 * scale local h = 64 * scale
  local uptime_x = base_x + 140 local uptimenum_x = uptime_x + 76
  local info_color = {r = 105, g = 105, b = 105}
  return {
    {id = "fps_num", dst = { utils.mergeMap({x = base_x, y = y, w = nw, h = h}, info_color) }},

    {id = "uptime", dst = { utils.mergeMap({x = uptime_x, y = y, w = 526 * scale, h = h}, info_color) }},
    {id = "uptime_hour_num", dst = { utils.mergeMap({x = uptimenum_x + 50 * 1, y = y, w = nw, h = h}, info_color) }},
    {id = "colon", dst = { utils.mergeMap({x = uptimenum_x + 32 + 50 * 1, y = y, w = nw, h = h}, info_color) }},
    {id = "uptime_minute_num", dst = { utils.mergeMap({x = uptimenum_x + 50 * 2, y = y, w = nw, h = h}, info_color) }},
    {id = "colon", dst = { utils.mergeMap({x = uptimenum_x + 32 + 50 * 2, y = y, w = nw, h = h}, info_color) }},
    {id = "uptime_second_num", dst = { utils.mergeMap({x = uptimenum_x + 50 * 3, y = y, w = nw, h = h}, info_color) }}
  }
end

return BottomInfo
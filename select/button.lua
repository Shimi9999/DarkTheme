local PlayButton = {}
function PlayButton.new()
  local obj = {}
  return setmetatable(obj, {__index = PlayButton})
end
function PlayButton.image()
  local src = 5 local base_x = 0 local y = 0 local w = 64 local h = 64
  return {
    {id = "play", src = src, x = base_x + w * 0, y = y, w = w, h = h, ref = 15, act = 15},
    {id = "auto", src = src, x = base_x + w * 1, y = y, w = w, h = h, ref = 16, act = 16},
    {id = "practice", src = src, x = base_x + w * 2, y = y, w = w, h = h, ref = 315, act = 315},
    {id = "replay_1", src = src, x = base_x + w * 3, y = y, w = w, h = h, ref = 19, act = 19},
    {id = "replay_2", src = src, x = base_x + w * 4, y = y, w = w, h = h, ref = 316, act = 316},
    {id = "replay_3", src = src, x = base_x + w * 5, y = y, w = w, h = h, ref = 317, act = 317},
    {id = "replay_4", src = src, x = base_x + w * 6, y = y, w = w, h = h, ref = 318, act = 318}
  }
end
function PlayButton.destination()
  local x = 50 local y = 100 local w = 38 local h = 38 local margin = 10
  local function dst(pos) return { {x = x + (w + margin) * pos, y = y, w = w, h = h} } end
  return {
    {id = "play", op = {5}, filter = 1, dst = dst(0)},
    {id = "auto", op = {5}, filter = 1, dst = dst(1)},
    {id = "practice", op = {5}, filter = 1, dst = dst(2)},
    {id = "replay_1", op = {5, 197}, filter = 1, dst = dst(3)},
    {id = "replay_2", op = {5, 1197}, filter = 1, dst = dst(4)},
    {id = "replay_3", op = {5, 1200}, filter = 1, dst = dst(5)},
    {id = "replay_4", op = {5, 1203}, filter = 1, dst = dst(6)}
  }
end

local SortButton = {}
SortButton.w = 400
SortButton.h = 64
function SortButton.new()
  local obj = {}
  return setmetatable(obj, {__index = SortButton})
end
function SortButton.image()
  local w = SortButton.w local h = SortButton.h
  return {
    {id = "sort", src = 4, x = 1010, y = 0, w = w, h = h * 8, divy = 8, len = 8, ref = 12, act = 12}
  }
end
function SortButton.destination()
  local scale = 0.5
  local w = SortButton.w * scale local h = SortButton.h * scale
  return {
    {id = "sort", dst = { {x = 880, y = 1000, w = w, h = h} }},
  }
end

local KeyModeButton = {}
KeyModeButton.w = 284
KeyModeButton.h = 64
function KeyModeButton.new()
  local obj = {}
  return setmetatable(obj, {__index = KeyModeButton})
end
function KeyModeButton.image()
  local w = KeyModeButton.w  local h = KeyModeButton.h
  return {
    {id = "keys", src = 4, x = 1410, y = 0, w = w, h = h * 8, divy = 8, len = 8, ref = 11, act = 11},
  }
end
function KeyModeButton.destination()
  local scale = 0.5
  local w = KeyModeButton.w * scale local h = KeyModeButton.h * scale
  return {
    {id = "keys", dst = { {x = 700, y = 1000, w = w, h = h} }},
  }
end

local LNModeButton = {}
LNModeButton.w = 150
LNModeButton.h = 64
function LNModeButton.new()
  local obj = {}
  return setmetatable(obj, {__index = LNModeButton})
end
function LNModeButton.image()
  local w = LNModeButton.w local h = LNModeButton.h
  return {
    {id = "lnmode", src = 7, x = 0, w = w, h = h * 3, divy = 3, len = 3, ref = 308, act = 308},
    {id = "lnmode_frame", src = 3, x = 0, y = 0, w = w, h = h},
  }
end
function LNModeButton.destination()
  local scale = 0.6
  local x = 800 local y = 50 local w = LNModeButton.w * scale local h = LNModeButton.h * scale
  return {
    {id = "lnmode_frame", dst = { {x = x, y = y, w = w, h = h, r = 16, g = 16, b = 16} }},
    {id = "lnmode", dst = { {x = x, y = y, w = w, h = h} }}
  }
end

return {
  PlayButton = PlayButton,
  SortButton = SortButton,
  KeyModeButton = KeyModeButton,
  LNModeButton = LNModeButton
}
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

return PlayButton
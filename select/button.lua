local utils = require "utils"

local playButton = {}
do
  do
    local src = 5
    local base_x = 0 local y = 0 local w = 64 local h = 64
    playButton.image = {
      {id = "play", src = src, x = base_x + w * 0, y = y, w = w, h = h, ref = 15, act = 15},
      {id = "auto", src = src, x = base_x + w * 1, y = y, w = w, h = h, ref = 16, act = 16},
      {id = "practice", src = src, x = base_x + w * 2, y = y, w = w, h = h, ref = 315, act = 315},
      {id = "replay_1", src = src, x = base_x + w * 3, y = y, w = w, h = h, ref = 19, act = 19},
      {id = "replay_2", src = src, x = base_x + w * 4, y = y, w = w, h = h, ref = 316, act = 316},
      {id = "replay_3", src = src, x = base_x + w * 5, y = y, w = w, h = h, ref = 317, act = 317},
      {id = "replay_4", src = src, x = base_x + w * 6, y = y, w = w, h = h, ref = 318, act = 318}
    }
  end

  do
    local x = 50 local y = 100 local w = 38 local h = 38
    local margin = 10
    local function dst(pos)
      return {
        {x = x + (w + margin) * pos, y = y, w = w, h = h}
      }
    end
    playButton.destination = {
      {id = "play", op = {5}, filter = 1, dst = dst(0)},
      {id = "auto", op = {5}, filter = 1, dst = dst(1)},
      {id = "practice", op = {5}, filter = 1, dst = dst(2)},
      {id = "replay_1", op = {5, 197}, filter = 1, dst = dst(3)},
      {id = "replay_2", op = {5, 1197}, filter = 1, dst = dst(4)},
      {id = "replay_3", op = {5, 1200}, filter = 1, dst = dst(5)},
      {id = "replay_4", op = {5, 1203}, filter = 1, dst = dst(6)}
    }
  end
end

local sortButton = {}
do
  local w = 400
  local h = 64

  sortButton.image = {
    {id = "sort", src = 4, x = 1010, y = 0, w = w, h = h * 8, divy = 8, len = 8, ref = 12, act = 12}
  }

  do
    local scale = 0.5
    sortButton.destination = {
      {id = "sort", dst = {
        {x = 880, y = 1000, w = w * scale, h = h * scale}
      }}
    }
  end
end

local keyModeButton = {}
do
  local w = 284
  local h = 64

  keyModeButton.image = {
    {id = "keys", src = 4, x = 1410, y = 0, w = w, h = h * 8, divy = 8, len = 8, ref = 11, act = 11},
  }

  do
    local scale = 0.5
    keyModeButton.destination = {
      {id = "keys", dst = {
        {x = 700, y = 1000, w = w * scale, h = h * scale}
      }}
    }
  end
end

local lnModeButton = {}
do
  local w = 150
  local h = 64

  lnModeButton.image = {
    {id = "lnmode", src = 7, x = 0, w = w, h = h * 3, divy = 3, len = 3, ref = 308, act = 308},
    {id = "lnmode_frame", src = 3, x = 0, y = 0, w = w, h = h},
  }

  do
    local scale = 0.6
    local x = 800 local y = 50 local w = w * scale local h = h * scale
    lnModeButton.destination = {
      {id = "lnmode_frame", dst = {
        {x = x, y = y, w = w, h = h, r = 16, g = 16, b = 16}
      }},
      {id = "lnmode", dst = {
        {x = x, y = y, w = w, h = h}
      }}
    }
  end
end

local skin = {}
utils.merge_all(skin, playButton)
utils.merge_all(skin, sortButton)
utils.merge_all(skin, keyModeButton)
utils.merge_all(skin, lnModeButton)

return skin
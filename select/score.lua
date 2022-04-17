local utils = require "utils"

local scoreRate = {}
do
  scoreRate.value = {
    utils.generateValue({id = "scorerate_num", digit = 3, ref = 102}),
    utils.generateValueX({id = "scorerate_afterdot_num", digit = 2, ref = 103}, 11),
  }

  function scoreRate.destination(base_x, base_y)
    local w = 24 local h = 32
    local y = base_y - 40
    local op = {5, -100}
    return {
      {id = "scorerate_num", op = op, dst = {
        {x = base_x, y = y, w = w, h = h}
      }},
      {id = "dot", op = op, dst = {
        {x = base_x + 53, y = y, w = w, h = h}
      }},
      {id = "scorerate_afterdot_num", op = op, dst = {
        {x = base_x + 70, y = y, w = w, h = h}
      }},
      {id = "percent", op = op, dst = {
        {x = base_x + 110, y = y, w = w, h = h}
      }}
    }
  end
end

local clearType = {}
do
  local w = 400
  local h = 64

  do
    local src = 4
    local x = 600
    clearType.image = {}
    for i = 1, 11 do
      table.insert(clearType.image,
        {id = "cleartype_"..i, src = src, x = x, y = h * (i-1), w = w, h = h}
      )
    end
  end

  function clearType.destination(x, y)
    local scale = 0.5
    local w = w * scale local h = h * scale
    local ops = {100, 101, 1100, 1101, 102, 103, 104, 1102, 105, 1103, 1104}
    local t = {}
    for i = 1, 11 do
      table.insert(t, {id = "cleartype_"..i, op = {5, ops[i]}, dst = {
        {x = x, y = y, w = w, h = h}
      }})
    end
    return t
  end
end

local rank = {}
do
  local w = 140
  local h = 64

  do
    rank.image = {}
    for i = 1, 9 do
      table.insert(rank.image, {id = "rank_"..i, src = 6, x = 740, y = h * (i-1), w = w, h = h})
    end
  end

  function rank.destination(x, y)
    local t = {}
    for i = 1, 8 do
      table.insert(t, {id = "rank_"..i + 1, op = {199 + i}, dst = {
        {x = x, y = y, w = w - 10, h = h}
      }})
    end
    return t
  end
end

local nextRank = {}
do
  nextRank.value = {
    utils.generateValue({id = "nextrank_num", digit = 4, align = 1, ref = 154})
  }

  function nextRank.destination(x, y)
    local scale = 0.4
    local w = 48 * scale local h = 64 * scale
    local t = {
      {id = "minus", op = {5, -100}, dst = {
        {x = x + 48, y = y, w = w, h = h}
      }},
      {id = "nextrank_num", op = {5, -100}, dst = {
        {x = x + 64, y = y, w = w, h = h}
      }}
    }
    for i = 1, 8 do
      utils.merge_all(t, {
        {id = "rank_"..i, op = {199 + i, -100}, dst = {
          {x = x, y = y, w = 140 * scale, h = h}
        }}
      })
    end
    return t
  end
end

local judgeNumbers = {}
do
  local text_w = 254
  local num_w = 48
  local h = 64

  judgeNumbers.image = {
    {id = "judges", src = 6, x = 0, y = 0, w = text_w, h = h * 6},
  }

  do
    judgeNumbers.value = {}
    for i = 1, 6 do
      local ref = 109 + i
      if i == 6 then ref = 420 end
      utils.merge_all(judgeNumbers.value, { utils.generateValue({id = "judge_num_"..i, digit = 4, ref = ref}) } )
    end
  end

  function judgeNumbers.destination(base_x, base_y)
    local scale = 0.4
    local t = {}
    utils.merge_all(t, (function()
      local w = text_w * scale local h = h * scale
      return {
        {id = "judges", op = {5}, dst = {
          {x = base_x, y = base_y, w = w, h = h * 6}
        }},
      }
    end)())
    utils.merge_all(t, (function()
      local w = num_w * scale local h = h * scale
      local x = base_x + 110
      local y = base_y + h * 6
      local t = {}
      for i = 1, 6 do
        table.insert(t, {id = "judge_num_"..i, op = {5}, dst = {
          {x = x, y = y - h * i, w = w, h = h}
        }})
      end
      return t
    end)())
    return t
  end
end

local scoreParams = {}
do
  local text_w = 400
  local num_w = 48
  local h = 64

  scoreParams.image = {
    {id = "scores", src = 6, x = 300, y = 0, w = text_w, h = h * 5}
  }

  scoreParams.value = {
    utils.generateValue({id = "exscore_num", digit = 4, ref = 71}),
    utils.generateValue({id = "maxcombo_num", digit = 4, ref = 75}),
    utils.generateValue({id = "totalnotes_num", digit = 4, ref = 74}),
    utils.generateValue({id = "combobreak_num", digit = 4, ref = 425}),
    utils.generateValue({id = "misscount_num", digit = 4, ref = 76}),
    utils.generateValue({id = "clearcount_num", digit = 4, ref = 78}),
    utils.generateValue({id = "playcount_num", digit = 4, ref = 77}),
    utils.generateValue({id = "fast_num", digit = 4, ref = 423}),
    utils.generateValue({id = "slow_num", digit = 4, ref = 424}),
    utils.generateValue({id = "djpoint_num", digit = 6, ref = 100}),
  }

  function scoreParams.destination(base_x, base_y)
    local scale = 0.4
    local t = {}
    utils.merge_all(t, (function()
      local w = text_w * scale local h = h * scale
      return {
        {id = "scores", op = {5}, dst = { {x = base_x, y = base_y + h, w = w, h = h * 5} }}
      }
    end)())
    utils.merge_all(t, (function()
      local w = num_w * scale local h = h * scale
      local x = base_x + 170 local base_y = base_y + h * 5
      local s_margin = 56 local margin = 70
      return {
        {id = "exscore_num", op = {2}, dst = { {x = x, y = base_y - h * 0, w = w, h = h} }},
        {id = "maxcombo_num", op = {5}, dst = { {x = x, y = base_y - h * 1, w = w, h = h} }},
        {id = "totalnotes_num", op = {5}, dst = { {x = x + margin, y = base_y - h * 1, w = w, h = h} }},
        {id = "combobreak_num", op = {5}, dst = { {x = x, y = base_y - h * 2, w = w, h = h} }},
        {id = "misscount_num", op = {5}, dst = { {x = x + margin, y = base_y - h * 2, w = w, h = h} }},
        {id = "clearcount_num", op = {5}, dst = { {x = x, y = base_y - h * 3, w = w, h = h} }},
        {id = "playcount_num", op = {5}, dst = { {x = x + margin, y = base_y - h * 3, w = w, h = h} }},
        {id = "fast_num", op = {5}, dst = { {x = x, y = base_y - h * 4, w = w, h = h} }},
        {id = "slow_num", op = {5}, dst = { {x = x + margin, y = base_y - h * 4, w = w, h = h} }},

        {id = "slash", op = {5}, dst = { {x = x + s_margin, y = base_y - h * 1, w = w, h = h} }},
        {id = "slash", op = {5}, dst = { {x = x + s_margin, y = base_y - h * 2, w = w, h = h} }},
        {id = "slash", op = {5}, dst = { {x = x + s_margin, y = base_y - h * 3, w = w, h = h} }},
        {id = "slash", op = {5}, dst = { {x = x + s_margin, y = base_y - h * 4, w = w, h = h} }},

        {id = "djpoint_num", op = {5}, dst = { {x = x - 100, y = base_y - h * 5, w = w, h = h} }},
      }
    end)())
    return t
  end
end

local clearOption = {}
do
  local w = 450
  local h = 64

  do
    clearOption.image = {}
    for i = 1, 10 do
      table.insert(clearOption.image, {id = "clearoption_"..i, src = 6, x = 900, y = h * (i - 1), w = w, h = h})
    end
  end

  function clearOption.destination(x, y)
    -- DISPLAY(Saved) : NORMAL,MIRROR,RANDOM,SRANDOM,RRANDOM,SPIRAL
    -- HIDDEN(No saved) : HRANDOM,ALLSCR,ECRANDOM,EXSRANDOM
    local scale = 0.3
    local w = w * scale local h = h * scale
    local ops = {126, 127, 128, 129, 130, 131, 1128, 1129, 1130, 1131}
    local t = {}
    for i = 1, 10 do
      table.insert(t, {id = "clearoption_"..i, op = {5, 624, ops[i]}, dst = {
        {x = x + (w + 10) * math.floor(i / 5) , y = y - h * (i % 5 - 1), w = w, h = h}
      }})
    end
    return t
  end
end

local rivalScore = {}
do
  local num_w = 48
  local img_w = 400
  local h = 64

  rivalScore.image = {
    {id = "rival_exscore", src = 6, x = 300, y = 0, w = img_w, h = h}
  }

  rivalScore.value = {
    utils.generateValue({id = "rival_exscore_num", digit = 4, ref = 271}),
  }

  rivalScore.text = {
    {id = "rival_name", font = 0, size = h, overflow = 1, ref = 1},
  }

  function rivalScore.destination(base_x, base_y)
    local scale = 0.4
    local num_w = num_w * scale local img_w = img_w * scale
    local h = h * scale
    local op = {625}
    local color = {r = 255, g = 153, b = 153}
    return {
      {id = "rival_name", op = op, dst = {
        utils.merge_all({x = base_x + 2, y = base_y - 4, w = 200, h = h}, color)
      }},
      {id = "rival_exscore", op = op, dst = {
        utils.merge_all({x = base_x + 150, y = base_y, w = img_w, h = h}, color)
      }},
      {id = "rival_exscore_num", op = op, dst = {
        utils.merge_all({x = base_x + 300, y = base_y, w = num_w, h = h}, color)
      }},
    }
  end
end

local skin = {}
skin.destination = {}

local parts = {
  scoreRate,
  clearType,
  rank,
  nextRank,
  judgeNumbers,
  scoreParams,
  clearOption,
  rivalScore,
}
for _, part in ipairs(parts) do
  utils.merge_all_whitout_function(skin, part)
end

local destinations = {
  scoreRate.destination(50, 460),
  clearType.destination(30, 460),
  rank.destination(240, 430),
  nextRank.destination(370, 420),
  judgeNumbers.destination(30, 250),
  scoreParams.destination(230, 250),
  clearOption.destination(50, 220),
  rivalScore.destination(30, 210)
}
for _, destination in ipairs(destinations) do
  utils.append_all(skin.destination, destination)
end

return skin
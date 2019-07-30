local utils = require "utils"

local ClearType = {}
ClearType.w = 400
ClearType.h = 64
function ClearType.new()
  local obj = {}
  return setmetatable(obj, {__index = ClearType})
end
function ClearType.image()
  local src = 4 local x = 600 local w = ClearType.w local h = ClearType.h
  local t = {}
  for i = 1, 11 do
    t[i] = {id = "cleartype_"..i, src = src, x = x, y = h * (i-1), w = w, h = h}
  end
  return t
end
function ClearType.destination(x, y)
  local scale = 0.5
  local w = ClearType.w * scale local h = ClearType.h * scale
  local ops = {100, 101, 1100, 1101, 102, 103, 104, 1102, 105, 1103, 1104}
  local t = {}
  for i = 1, 11 do
    t[i] = {id = "cleartype_"..i, op = {5, ops[i]}, dst = { {x = x, y = y, w = w, h = h} }}
  end
  return t
end

local JudgeNumbers = {}
JudgeNumbers.text_w = 254
JudgeNumbers.num_w = 48
JudgeNumbers.h = 64
function JudgeNumbers.new()
  local obj = {}
  return setmetatable(obj, {__index = JudgeNumbers})
end
function JudgeNumbers.image()
  local src = 6 local w = JudgeNumbers.text_w local h = JudgeNumbers.h
  return {
    {id = "judges", src = src, x = 0, y = 0, w = w, h = h * 6},
  }
end
function JudgeNumbers.value()
  local t = {}
  for i = 1, 6 do
    local ref = 109 + i
    if i == 6 then ref = 420 end
    utils.mergeArray(t, { utils.generateValue({id = "judge_num_"..i, digit = 4, ref = ref}) } )
  end
  return t
end
function JudgeNumbers.destination(base_x, base_y)
  local scale = 0.4
  local t = {}
  utils.mergeArray(t, (function()
    local w = JudgeNumbers.text_w * scale local h = JudgeNumbers.h * scale
    return {
      {id = "judges", op = {5}, dst = { {x = base_x, y = base_y, w = w, h = h * 6} }},
    }
  end)())
  utils.mergeArray(t, (function()
    local x = base_x + 110
    local w = JudgeNumbers.num_w * scale local h = JudgeNumbers.h * scale
    local t = {}
    for i = 1, 6 do
      t[i] = {id = "judge_num_"..i, op = {5}, dst = { {x = x, y = base_y + h * (i - 1), w = w, h = h} }}
    end
    return t
  end)())
  return t
end

local ScoreParams = {}
ScoreParams.text_w = 400
ScoreParams.num_w = 48
ScoreParams.h = 64
function ScoreParams.new()
  local obj = {}
  return setmetatable(obj, {__index = ScoreParams})
end
function ScoreParams.image()
  local src = 6 local w = ScoreParams.text_w local h = ScoreParams.h
  return {
    {id = "scores", src = src, x = 300, y = 0, w = w, h = h * 5}
  }
end
function ScoreParams.value()
  return {
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

    utils.generateValue({id = "exscore_rival_num", digit = 5, ref = 271}),
  }
end
function ScoreParams.destination(base_x, base_y)
  local scale = 0.4
  local t = {}
  utils.mergeArray(t, (function()
    local w = ScoreParams.text_w * scale local h = ScoreParams.h * scale
    return {
      {id = "scores", op = {5}, dst = { {x = base_x, y = base_y + h, w = w, h = h * 5} }}
    }
  end)())
  utils.mergeArray(t, (function()
    local w = ScoreParams.num_w * scale local h = ScoreParams.h * scale
    local x = base_x + 170 local base_y = base_y + h * 5
    local margin = 70
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

      {id = "djpoint_num", op = {5}, dst = { {x = x - 100, y = base_y - h * 5, w = w, h = h} }},
    }
  end)())
  return t
end

local ScoreRate = {}
function ScoreRate.new()
  local obj = {}
  return setmetatable(obj, {__index = ScoreRate})
end
function ScoreRate.value()
  return {
    utils.generateValue({id = "scorerate_num", digit = 3, ref = 102}),
    utils.generateValueX({id = "scorerate_afterdot_num", digit = 2, ref = 103}, 11),
  }
end
function ScoreRate.destination(base_x, base_y)
  local w = 24 local h = 32
  return {
    {id = "scorerate_num", op = {5, -100}, dst = { {x = base_x, y = base_y - 40 , w = w, h = h} }},
    {id = "dot", op = {5, -100}, dst = { {x = base_x + 50, y = base_y - 40 , w = w, h = h} }},
    {id = "scorerate_afterdot_num", op = {5, -100}, dst = { {x = base_x + 70, y = base_y - 40, w = w, h = h} }},
    {id = "percent", op = {5, -100}, dst = { {x = base_x + 110, y = base_y - 40 , w = w, h = h} }}
  }
end

local Rank = {}
Rank.w = 140
Rank.h = 64
function Rank.new()
  local obj = {}
  return setmetatable(obj, {__index = Rank})
end
function Rank.image()
  local src = 6 local x = 740 local w = Rank.w local h = Rank.h
  local t = {}
  for i = 1, 9 do
    t[i] = {id = "rank_"..i, src = src, x = x, y = h * (i-1), w = w, h = h}
  end
  return t
end
function Rank.destination(x, y)
  local w = Rank.w - 10 local h = Rank.h
  local t = {}
  for i = 1, 8 do
    t[i] = {id = "rank_"..i + 1, op = {199 + i}, dst = { {x = x, y = y, w = w, h = h} }}
  end
  return t
end

local NextRank = {}
function NextRank.new()
  local obj = {}
  return setmetatable(obj, {__index = NextRank})
end
function NextRank.value()
  return {
    utils.generateValue({id = "nextrank_num", digit = 4, ref = 154})
  }
end
function NextRank.destination(x, y)
  local scale = 0.4
  local w = 48 * scale local h = 64 * scale
  local t = {
    {id = "minus", op = {5, -100}, dst = { {x = x + 48, y = y, w = w, h = h} }},
    {id = "nextrank_num", op = {5, -100}, dst = { {x = x + 50, y = y, w = w, h = h} }}
  }
  for i = 1, 8 do
    utils.mergeArray(t, {
      {id = "rank_"..i, op = {199 + i, -100}, dst = { {x = x, y = y, w = 140 * scale, h = h} }}
    })
  end
  return t
end

local ClearOption = {}
ClearOption.w = 450
ClearOption.h = 64
function ClearOption.new()
  local obj = {}
  return setmetatable(obj, {__index = ClearOption})
end
function ClearOption.image()
  local src = 6 local x = 900 local w = ClearOption.w local h = ClearOption.h
  local t = {}
  for i = 1, 10 do
    t[i] = {id = "clearoption_"..i, src = src, x = x, y = h * (i-1), w = w, h = h}
  end
  return t
end
function ClearOption.destination(x, y)
  -- DISPLAY(Saved) : NORMAL,MIRROR,RANDOM,SRANDOM,RRANDOM,SPIRAL
  -- HIDDEN(No saved) : HRANDOM,ALLSCR,ECRANDOM,EXSRANDOM
  local scale = 0.3
  local w = ClearOption.w * scale local h = ClearOption.h * scale
  local ops = {126, 127, 128, 129, 130, 131, 1128, 1129, 1130, 1131}
  local t = {}
  for i = 1, 10 do
    t[i] = {id = "clearoption_"..i, op = {5, ops[i]}, dst = {
       {x = x + (w + 10) * math.floor(i / 5) , y = y - h * (i % 5 - 1), w = w, h = h}
    }}
  end
  return t
end

local Score = {}
Score.cleartype = ClearType.new()
Score.judgenumbers = JudgeNumbers.new()
Score.scoreparams = ScoreParams.new()
Score.scorerate = ScoreRate.new()
Score.rank = Rank.new()
Score.nextrank = NextRank.new()
Score.clearoption = ClearOption.new()
function Score.new()
  local obj = {}
  return setmetatable(obj, {__index = Score})
end
function Score.image()
  local t = {}
  utils.mergeArray(t, Score.cleartype.image())
  utils.mergeArray(t, Score.judgenumbers.image())
  utils.mergeArray(t, Score.scoreparams.image())
  utils.mergeArray(t, Score.rank.image())
  utils.mergeArray(t, Score.clearoption.image())
  return t
end
function Score.value()
  local t = {}
  utils.mergeArray(t, Score.judgenumbers.value())
  utils.mergeArray(t, Score.scoreparams.value())
  utils.mergeArray(t, Score.scorerate.value())
  utils.mergeArray(t, Score.nextrank.value())
  return t
end
function Score.destination()
  local t = {}
  utils.mergeArray(t, Score.scorerate.destination(50, 460))
  utils.mergeArray(t, Score.cleartype.destination(30, 460))
  utils.mergeArray(t, Score.rank.destination(240, 430))
  utils.mergeArray(t, Score.nextrank.destination(360, 420))
  utils.mergeArray(t, Score.judgenumbers.destination(30, 250))
  utils.mergeArray(t, Score.scoreparams.destination(230, 250))
  utils.mergeArray(t, Score.clearoption.destination(50, 220))
  return t
end

return Score
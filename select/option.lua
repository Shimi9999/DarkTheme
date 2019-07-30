local utils = require "utils"
local header = require "header"

local Selector = {}
Selector.w = 220
function Selector.h(selection_num) return 10 + 60 * selection_num end
function Selector.new()
  local obj = {}
  return setmetatable(obj, {__index = Selector})
end
function Selector.image()
  local src = 11 local x = 0 local base_y = 540 local diff_y = 60
  local t = {}
  local function selector(selection_num)
    for i = 1, selection_num do
      table.insert(t, {id = "option_selector_"..selection_num.."_"..i, src = src,
        x = x, y = base_y - diff_y * (i - 1), w = Selector.w, h = Selector.h(selection_num)})
    end
  end
  selector(2)
  selector(3)
  selector(4)
  selector(5)
  selector(6)
  selector(10)
  return t
end
function Selector.imageset()
  local function optionSelector(num)
    local t = {}
    for i = 1, num do
      table.insert(t, "option_selector_"..num.."_"..i)
    end
    return t
  end
  return {
    {id = "option_random_1", ref = 42, images = optionSelector(10)},
    {id = "option_random_2", ref = 43, images = optionSelector(10)},
    {id = "option_gauge", ref = 40, images = optionSelector(6)},
    {id = "option_hsfix", ref = 55, images = optionSelector(5)},
    {id = "option_dp", ref = 54, images = optionSelector(4)},

    {id = "option_exjudge", ref = 301, images = optionSelector(2)},
    {id = "option_constant", ref = 302, images = optionSelector(2)},
    {id = "option_judgearea", ref = 303, images = optionSelector(2)},
    {id = "option_legacy", ref = 304, images = optionSelector(2)},
    {id = "option_marknote", ref = 305, images = optionSelector(2)},
    {id = "option_bpmguide", ref = 306, images = optionSelector(2)},
    {id = "option_nomine", ref = 307, images = optionSelector(2)},

    {id = "option_bga", ref = 72, images = optionSelector(3)},
    {id = "option_gas", ref = 78, images = optionSelector(5)},
  }
end
function Selector.destination(option_num, op)
  local function selector(id, selection_num, x, y)
    return {id = id, op = op, blend = 2, dst = { {x = x, y = y, w = Selector.w, h = Selector.h(selection_num)} }}
  end
  if option_num == 1 then
    local base_x = 510 local base_y = 70
    return {
      selector("option_random_1", 10, base_x, base_y),
      selector("option_gauge", 6, base_x + 230 * 1, base_y + 60 * (10 - 6)),
      selector("option_hsfix", 5, base_x + 230 * 2, base_y + 60 * (10 - 5)),
      selector("option_random_2", 10, base_x + 230 * 3, base_y),
      selector("option_dp", 4, 850, 20)
    }
  elseif option_num == 2 then
    local bottom_x = 510 local bottom_y = 230 local top_x = 630 local top_y = 720 local diff_x = 230
    return {
      selector("option_exjudge", 2, bottom_x + diff_x * 0, bottom_y),
      selector("option_judgearea", 2, bottom_x + diff_x * 1, bottom_y),
      selector("option_marknote", 2, bottom_x + diff_x * 2, bottom_y),
      selector("option_nomine", 2, bottom_x + diff_x * 3, bottom_y),
      selector("option_constant", 2, top_x + diff_x * 0, top_y),
      selector("option_legacy", 2, top_x + diff_x * 1, top_y),
      selector("option_bpmguide", 2, top_x + diff_x * 2, top_y),
    }
  elseif option_num == 3 then
    local x = 540
    return {
      selector("option_bga", 3, x, 170),
      selector("option_gas", 5, x, 540),
    }
  end
end

local Target = {}
Target.w = 310
Target.h = 430
function Target.new()
  local obj = {}
  return setmetatable(obj, {__index = Target})
end
function Target.image()
  local src = 15 local x = 0 local base_y = 0 local diff_y = 40
  local t = {}
  for i = 1, 11 do
    table.insert(t, {id = "option_target_"..i, src = src, x = x, y = base_y + diff_y * (i - 1), w = Target.w, h = Target.h})
  end
  return t
end
function Target.imageset()
  return {
    {id = "option_target", ref = 77, images =
      (function()
        local t = {}
        for i = 1, 11 do
          table.insert(t, "option_target_"..i)
        end
        return t
      end)()
    }
  }
end
function Target.destination(op)
  return {
    {id = "option_target", op = op, dst = { {x = 130, y = 320, w = Target.w, h = Target.h} }}
  }
end

local Option = {}
Option.selector = Selector.new()
Option.target = Target.new()
function Option.new()
  local obj = {}
  return setmetatable(obj, {__index = Option})
end
function Option.image()
  local t = {
    {id = "option_play", src = 12, x = 0, y = 0, w = -1, h = -1},
    {id = "option_assist", src = 13, x = 0, y = 0, w = -1, h = -1},
    {id = "option_detailed", src = 14, x = 0, y = 0, w = -1, h = -1},
    {id = "option_bg_1", src = 0, x = 0, y = 0, w = -1, h = -1},
    {id = "option_bg_2", src = 0, x = 0, y = 0, w = -1, h = -1},
    {id = "option_bg_3", src = 0, x = 0, y = 0, w = -1, h = -1}
  }
  utils.mergeArray(t, Option.selector.image())
  utils.mergeArray(t, Option.target.image())
  return t
end
function Option.imageset()
  local t = {}
  utils.mergeArray(t, Option.selector.imageset())
  utils.mergeArray(t, Option.target.imageset())
  return t
end
function Option.value()
  return {
    utils.generateValue({id = "option_duration", digit = 4, ref = 312}),
    utils.generateValue({id = "option_greennumber", digit = 4, ref = 313}),
    utils.generateValueXY({id = "option_judgetiming", digit = 3, ref = 12}, 12, 2)
  }
end
function Option.destination()
  local t = {}
  utils.mergeArray(t, (function()
    local op = {21}
    local t1 = {
      {id = "option_bg_1", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h, a = 200} }},
      {id = "option_play", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h} }}
    }
    utils.mergeArray(t1, Option.selector.destination(1, op))
    utils.mergeArray(t1, Option.target.destination(op))
    return t1
  end)())
  utils.mergeArray(t, (function()
    local op = {22}
    local t2 = {
      {id = "option_bg_2", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h, a = 200} }},
      {id = "option_assist", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h} }},
    }
    utils.mergeArray(t2, Option.selector.destination(2, op))
    return t2
  end)())
  utils.mergeArray(t, (function()
    local op = {23}
    local nscale = 0.5
    local nw = 48 * nscale local nh = 64 * nscale
    local t3 = {
      {id = "option_bg_3", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h, a = 200} }},
      {id = "option_detailed", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h} }},

      {id = "option_duration", op = op, dst = { {x = 1048, y = 740, w = nw, h = nh} }},
      {id = "option_greennumber", op = op, dst = { {x = 1160, y = 740, w = nw, h = nh, r = 127, g = 204, b = 101} }},
      {id = "option_judgetiming", op = op, dst = { {x = 1110, y = 310, w = nw, h = nh} }},
    }
    utils.mergeArray(t3, Option.selector.destination(3, op))
    return t3
  end)())
  return t
end

return Option
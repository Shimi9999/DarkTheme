local utils = require "utils"
local header = require "header"
local Object = require "object"

local Selector = Object.new()
Selector.w = 220
function Selector.h(selection_num) return 10 + 60 * selection_num end
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

local Target = Object.new()
Target.w = 310
Target.h = 430
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

local Hotkey = Object.new()
Target.fontSize = 30
function Hotkey.text()
  local font = 0
  local function hotkey(key, text)
    return {id = "hotkey_"..key, font = font, size = Target.fontSize, constantText = key.."  "..text, overflow = 1}
  end
  local t = {
    hotkey("1", "Change key mode filter"),
    hotkey("2", "Change sort mode"),
    hotkey("3", "Change LN mode"),
    hotkey("4", "Select replay log"),
    hotkey("5", "Show detail option"),
    hotkey("6", "Open key config"),
    hotkey("7", "Change rival lamps"),
    hotkey("8", "Open same song folder"),
    hotkey("9", "Display song text file"),

    hotkey("F1", "Show/hide FPS"),
    hotkey("F2", "Reload folder/table"),
    hotkey("F3", "Open folder with file viewer"),
    hotkey("F4", "Change fullscreen/windowed"),
    hotkey("F6", "Take a screen shot"),
    hotkey("F8", "Set song as favorite song"),
    hotkey("F9", "Set song as favorite chart"),
    hotkey("F10", "Autoplay all songs in folder"),
    hotkey("F11", "Open IR chart page"),
    hotkey("F12", "Open skin config"),

    hotkey("1KEY", "Play"),
    hotkey("3KEY", "Practice"),
    hotkey("5KEY", "Auto play"),
    hotkey("2,4KEY", "Close folder"),
    hotkey("6KEY", "Select replay log"),
    hotkey("7KEY", "Replay")
  }
  return t
end
function Hotkey.destination(op, x, y)
  local t = {}
  utils.mergeArray(t, Hotkey.destinationN(op, x, y))
  utils.mergeArray(t, Hotkey.destinationFN(op, x, y - 380))
  utils.mergeArray(t, Hotkey.destinationNKEY(op, x, y - 380 - 420))
  return t
end
function Hotkey.destinationN(op, x, y)
  local t = {}
  local margin = 8
  for i = 1, 9 do
    utils.mergeArray(t, {
      {id = "hotkey_"..i, op = op, filter = 1, dst = { {x = x, y = y - (Target.fontSize + margin) * (i - 1), w = 500, h = Target.fontSize} }}
    })
  end
  return t
end
function Hotkey.destinationFN(op, x, y)
  local t = {}
  local f = {1, 2, 3, 4, 6, 8, 9, 10, 11, 12}
  local margin = 8
  for i, v in ipairs(f) do
    utils.mergeArray(t, {
      {id = "hotkey_F"..v, op = op, filter = 1, dst = { {x = x, y = y - (Target.fontSize + margin) * (i - 1), w = 500, h = Target.fontSize} }}
    })
  end
  return t
end
function Hotkey.destinationNKEY(op, x, y)
  local t = {}
  local f = {1, 3, 5, "2,4", 6, 7}
  local margin = 8
  for i, v in ipairs(f) do
    utils.mergeArray(t, {
      {id = "hotkey_"..v.."KEY", op = op, filter = 1, dst = { {x = x, y = y - (Target.fontSize + margin) * (i - 1), w = 500, h = Target.fontSize} }}
    })
  end
  return t
end

local Option = Object.new()
Option.selector = Selector.new()
Option.target = Target.new()
Option.hotkey = Hotkey.new()
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
function Option.text()
  return Option.hotkey.text()
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
    utils.mergeArray(t2, Option.hotkey.destination(op, 1436, 1010))
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
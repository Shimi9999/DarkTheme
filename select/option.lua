local utils = require "utils"
local header = require "header"

local selector = {}
do
  local w = 220
  local function selector_h(selection_num)
    return 10 + 60 * selection_num
  end

  selector.source = {
    {id = "src_option_selector", path = "image/option_selector.png"}
  }

  do
    local src = "src_option_selector"
    local x = 0 local base_y = 540 local diff_y = 60
    selector.image = {}
    local function selector_img(selection_num)
      for i = 1, selection_num do
        table.insert(selector.image, {id = "option_selector_"..selection_num.."_"..i, src = src,
          x = x, y = base_y - diff_y * (i - 1), w = w, h = selector_h(selection_num)})
      end
    end
    selector_img(2)
    selector_img(3)
    selector_img(4)
    selector_img(5)
    selector_img(6)
    selector_img(10)
  end

  do
    local function selector_images(num)
      local t = {}
      for i = 1, num do
        table.insert(t, "option_selector_"..num.."_"..i)
      end
      return t
    end
    selector.imageset = {
      {id = "option_random_1", ref = 42, images = selector_images(10)},
      {id = "option_random_2", ref = 43, images = selector_images(10)},
      {id = "option_gauge", ref = 40, images = selector_images(6)},
      {id = "option_hsfix", ref = 55, images = selector_images(5)},
      {id = "option_dp", ref = 54, images = selector_images(4)},

      {id = "option_exjudge", ref = 301, images = selector_images(2)},
      {id = "option_constant", ref = 302, images = selector_images(2)},
      {id = "option_judgearea", ref = 303, images = selector_images(2)},
      {id = "option_legacy", ref = 304, images = selector_images(2)},
      {id = "option_marknote", ref = 305, images = selector_images(2)},
      {id = "option_bpmguide", ref = 306, images = selector_images(2)},
      {id = "option_nomine", ref = 307, images = selector_images(2)},

      {id = "option_bga", ref = 72, images = selector_images(3)},
      {id = "option_gas", ref = 78, images = selector_images(5)},
    }
  end

  function selector.destination(option_num, op)
    local function selector_dst(id, selection_num, x, y)
      return {id = id, op = op, blend = 2, dst = {
        {x = x, y = y, w = w, h = selector_h(selection_num)}
      }}
    end
    if option_num == 1 then
      local base_x = 510 local base_y = 70
      return {
        selector_dst("option_random_1", 10, base_x, base_y),
        selector_dst("option_gauge", 6, base_x + 230 * 1, base_y + 60 * (10 - 6)),
        selector_dst("option_hsfix", 5, base_x + 230 * 2, base_y + 60 * (10 - 5)),
        selector_dst("option_random_2", 10, base_x + 230 * 3, base_y),
        selector_dst("option_dp", 4, 850, 20)
      }
    elseif option_num == 2 then
      local bottom_x = 510 local bottom_y = 230 local top_x = 630 local top_y = 720 local diff_x = 230
      return {
        selector_dst("option_exjudge", 2, bottom_x + diff_x * 0, bottom_y),
        selector_dst("option_judgearea", 2, bottom_x + diff_x * 1, bottom_y),
        selector_dst("option_marknote", 2, bottom_x + diff_x * 2, bottom_y),
        selector_dst("option_nomine", 2, bottom_x + diff_x * 3, bottom_y),
        selector_dst("option_constant", 2, top_x + diff_x * 0, top_y),
        selector_dst("option_legacy", 2, top_x + diff_x * 1, top_y),
        selector_dst("option_bpmguide", 2, top_x + diff_x * 2, top_y),
      }
    elseif option_num == 3 then
      local x = 540
      return {
        selector_dst("option_bga", 3, x, 170),
        selector_dst("option_gas", 5, x, 540),
      }
    end
  end
end

local target = {}
do
  local w = 310
  local h = 430

  target.source = {
    {id = "src_target", path = "image/target.png"}
  }

  do
    local src = "src_target"
    local x = 0 local base_y = 0 local diff_y = 40
    target.image = {}
    for i = 1, 11 do
      table.insert(target.image, {id = "option_target_"..i, src = src, x = x, y = base_y + diff_y * (i - 1), w = w, h = h})
    end
  end

  target.imageset = {
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

  function target.destination(op)
    return {
      {id = "option_target", op = op, dst = {
        {x = 130, y = 320, w = w, h = h}
      }}
    }
  end
end

local hotkey = {}
do
  local fontSize = 30

  do
    local function hotkey_txt(key, text)
      return {id = "hotkey_"..key, font = "font_koruri", size = fontSize, constantText = key.."  "..text, overflow = 1}
    end
    hotkey.text = {
      hotkey_txt("1", "Change key mode filter"),
      hotkey_txt("2", "Change sort mode"),
      hotkey_txt("3", "Change LN mode"),
      hotkey_txt("4", "Select replay log"),
      hotkey_txt("5", "Show detail option"),
      hotkey_txt("6", "Open key config"),
      hotkey_txt("7", "Change rival lamps"),
      hotkey_txt("8", "Open same song folder"),
      hotkey_txt("9", "Display song text file"),

      hotkey_txt("F1", "Show/hide FPS"),
      hotkey_txt("F2", "Reload folder/table"),
      hotkey_txt("F3", "Open folder with file viewer"),
      hotkey_txt("F4", "Change fullscreen/windowed"),
      hotkey_txt("F6", "Take a screen shot"),
      hotkey_txt("F8", "Set song as favorite song"),
      hotkey_txt("F9", "Set song as favorite chart"),
      hotkey_txt("F10", "Autoplay all songs in folder"),
      hotkey_txt("F11", "Open IR chart page"),
      hotkey_txt("F12", "Open skin config"),

      hotkey_txt("1KEY", "Play"),
      hotkey_txt("3KEY", "Practice"),
      hotkey_txt("5KEY", "Auto play"),
      hotkey_txt("2,4KEY", "Close folder"),
      hotkey_txt("6KEY", "Select replay log"),
      hotkey_txt("7KEY", "Replay")
    }
  end

  function hotkey.destination(op, x, y)
    local padding = 10
    local t = {}
    utils.append_all(t, {
      {id = -111, op = op, dst = { {x = x, y = 0, w = 550, h = 1080, r = 34, g = 34, b = 34} }}
    })
    utils.append_all(t, hotkey.destinationNumberKeys(op, x + padding, y))
    utils.append_all(t, hotkey.destinationFunctionKeys(op, x + padding, y - 380))
    utils.append_all(t, hotkey.destinationControllerKeys(op, x + padding, y - 380 - 420))
    return t
  end
  function hotkey.destinationNumberKeys(op, x, y)
    local t = {}
    local margin = 8
    for i = 1, 9 do
      utils.append_all(t, {
        {id = "hotkey_"..i, op = op, filter = 1, dst = {
          {x = x, y = y - (fontSize + margin) * (i - 1), w = 500, h = fontSize}
        }}
      })
    end
    return t
  end
  function hotkey.destinationFunctionKeys(op, x, y)
    local t = {}
    local f = {1, 2, 3, 4, 6, 8, 9, 10, 11, 12}
    local margin = 8
    for i, v in ipairs(f) do
      utils.append_all(t, {
        {id = "hotkey_F"..v, op = op, filter = 1, dst = {
          {x = x, y = y - (fontSize + margin) * (i - 1), w = 500, h = fontSize}
        }}
      })
    end
    return t
  end
  function hotkey.destinationControllerKeys(op, x, y)
    local t = {}
    local f = {1, 3, 5, "2,4", 6, 7}
    local margin = 8
    for i, v in ipairs(f) do
      utils.append_all(t, {
        {id = "hotkey_"..v.."KEY", op = op, filter = 1, dst = {
          {x = x, y = y - (fontSize + margin) * (i - 1), w = 500, h = fontSize}
        }}
      })
    end
    return t
  end
end

local option = {}
do
  option.source = {
    {id = "src_option_play", path = "image/option_play.png"},
    {id = "src_option_assist", path = "image/option_assist.png"},
    {id = "src_option_detailed", path = "image/option_detailed.png"}
  }

  option.image = {
    {id = "option_play", src = "src_option_play", x = 0, y = 0, w = -1, h = -1},
    {id = "option_assist", src = "src_option_assist", x = 0, y = 0, w = -1, h = -1},
    {id = "option_detailed", src = "src_option_detailed", x = 0, y = 0, w = -1, h = -1},
    {id = "option_bg_1", src = "src_bg", x = 0, y = 0, w = -1, h = -1},
    {id = "option_bg_2", src = "src_bg", x = 0, y = 0, w = -1, h = -1},
    {id = "option_bg_3", src = "src_bg", x = 0, y = 0, w = -1, h = -1}
  }

  option.value = {
    utils.generateValue({id = "option_duration", digit = 4, ref = 312}),
    utils.generateValue({id = "option_greennumber", digit = 4, ref = 313}),
    utils.generateValueXY({id = "option_judgetiming", digit = 3, ref = 12}, 12, 2)
  }

  do
    option.destination = {}

    utils.append_all(option.destination, (function()
      local op = {21}
      local t1 = {
        {id = "option_bg_1", op = op, dst = {
          {x = 0, y = 0, w = header.w, h = header.h, a = 200}
        }},
        {id = "option_play", op = op, dst = {
          {x = 0, y = 0, w = header.w, h = header.h}
        }}
      }
      utils.append_all(t1, selector.destination(1, op))
      utils.append_all(t1, target.destination(op))
      return t1
    end)())

    utils.append_all(option.destination, (function()
      local op = {22}
      local t2 = {
        {id = "option_bg_2", op = op, dst = {
          {x = 0, y = 0, w = header.w, h = header.h, a = 200}
        }},
        {id = "option_assist", op = op, dst = {
          {x = 0, y = 0, w = header.w, h = header.h}
        }},
      }
      utils.append_all(t2, selector.destination(2, op))
      utils.append_all(t2, hotkey.destination(op, 1430, 1010))
      return t2
    end)())

    utils.append_all(option.destination, (function()
      local op = {23}
      local nscale = 0.5
      local nw = 48 * nscale local nh = 64 * nscale
      local t3 = {
        {id = "option_bg_3", op = op, dst = {
          {x = 0, y = 0, w = header.w, h = header.h, a = 200}
        }},
        {id = "option_detailed", op = op, dst = {
          {x = 0, y = 0, w = header.w, h = header.h}
        }},

        {id = "option_duration", op = op, dst = {
          {x = 1048, y = 740, w = nw, h = nh}
        }},
        {id = "option_greennumber", op = op, dst = {
          {x = 1160, y = 740, w = nw, h = nh, r = 127, g = 204, b = 101}
        }},
        {id = "option_judgetiming", op = op, dst = {
          {x = 1110, y = 310, w = nw, h = nh}
        }},
      }
      utils.append_all(t3, selector.destination(3, op))
      return t3
    end)())
  end
end

local skin = {}

local parts = {
  selector,
  target,
  hotkey,
  option
}
for _, part in ipairs(parts) do
  utils.merge_all_whitout_function(skin, part)
end

return skin
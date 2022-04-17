local utils = require "utils"
local header = require "header"
local property = require "property"

local function main()
  if not skin_config then
    return {}
  end

  local skin = {}
  for k, v in pairs(header) do
    skin[k] = v
  end

  skin.source = {
    {id = 0, path = "image/bg.png"},
    {id = 1, path = "image/bar.png"},
    {id = 2, path = "image/number.png"},
    {id = 3, path = "image/white.png"},
    {id = 4, path = "image/text.png"},
    {id = 5, path = "image/playbutton.png"},
    {id = 6, path = "image/score.png"},
    {id = 7, path = "image/label.png"},
    {id = 8, path = "image/lampgraph.png"},
    {id = 9, path = "image/trophy.png"},
    {id = 10, path = "image/infotext.png"},
    {id = 11, path = "image/option_selector.png"},
    {id = 12, path = "image/option_play.png"},
    {id = 13, path = "image/option_assist.png"},
    {id = 14, path = "image/option_detailed.png"},
    {id = 15, path = "image/target.png"},
    {id = 16, path = "image/course.png"},
    {id = 17, path = "image/volumetext.png"},
  }
  if property.isBackgroundCustomize() then
    table.insert(skin.source, {id = "src_background_custom", path = "customize/background/*.png"})
  end

  skin.font = {
    {id = 0, path = "../common/font/Koruri-Semibold.ttf"},
    {id = 1, path = "../common/font/GenShinGothic-Bold.ttf"}
  }

  skin.image = {}
  do
    local src = 0
    if property.isBackgroundCustomize() then src = "src_background_custom" end
    table.insert(skin.image, {id = "background", src = src, x = 0, y = 0, w = -1, h = -1})
  end
  utils.append_all(skin.image, (function()
    local src = 2
    local w = 48 local h = 64
    local y = h * 2
    return {
      {id = "dot", src = src, x = w * 0, y = y, w = w, h = h},
      {id = "colon", src = src, x = w * 1, y = y, w = w, h = h},
      {id = "wavedash", src = src, x = w * 2, y = y, w = w, h = h},
      {id = "slash", src = src, x = w * 4, y = y, w = w, h = h},
      {id = "percent", src = src, x = w * 5, y = y, w = w, h = h},
      {id = "minus", src = src, x = w * 11, y = h, w = w, h = h},
    }
  end)())

  skin.destination = {
    {id = "background", dst = {
      {x = 0, y = 0, w = header.w, h = header.h, a = 255 - property.backgroundDarkness()}
    }}
  }

  local modules = {
    require "songinfo",
    require "score",
    require "songlist",
    require "option",
    require "scrollbar",
    require "volumeslider",
    require "button",
    require "search",
    require "bottominfo",
  }
  for _, mod in ipairs(modules) do
    utils.merge_all(skin, mod)
  end

  return skin
end

return {
  header = header,
  main = main
}

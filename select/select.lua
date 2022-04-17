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
    {id = "src_bg", path = "image/bg.png"},
    {id = "src_number", path = "image/number.png"},
    {id = "src_white", path = "image/white.png"},
    {id = "src_text", path = "image/text.png"},
    {id = "src_label", path = "image/label.png"},
    {id = "src_infotext", path = "image/infotext.png"},
  }
  if property.isBackgroundCustomize() then
    table.insert(skin.source, {id = "src_background_custom", path = "customize/background/*.png"})
  end

  skin.font = {
    {id = "font_koruri", path = "../common/font/Koruri-Semibold.ttf"},
    {id = "font_genshingothic", path = "../common/font/GenShinGothic-Bold.ttf"}
  }

  skin.image = {}
  do
    local src = "src_bg"
    if property.isBackgroundCustomize() then
      src = "src_background_custom"
    end
    table.insert(skin.image, {id = "background", src = src, x = 0, y = 0, w = -1, h = -1})
  end
  utils.append_all(skin.image, (function()
    local src = "src_number"
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

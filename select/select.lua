local utils = require "utils"
local header = require "header"
local property = require "property"

local Objects = require "objects"
local SongInfo = require "songinfo"
local Score = require "score"
local SongList = require "songlist"
local Option = require "option"
local ScrollBar = require "scrollbar"
local Button = require "button"
local Search = require "search"
local BottomInfo = require "bottominfo"

local function main()
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
    {id = 8, path = "image/lampgraph.png"},
    {id = 7, path = "image/label.png"},
    {id = 9, path = "image/trophy.png"},
    {id = 10, path = "image/infotext.png"},
    {id = 11, path = "image/option_selector.png"},
    {id = 12, path = "image/option_play.png"},
    {id = 13, path = "image/option_assist.png"},
    {id = 14, path = "image/option_detailed.png"},
    {id = 15, path = "image/target.png"},
    {id = 16, path = "image/course.png"},
  }
  if property.isBackgroundCustomize() then
    table.insert(skin.source, {id = "source_background_custom", path = "customize/background/*.png"})
  end

  skin.font = {
    {id = 0, path = "../common/font/Koruri-Semibold.ttf"}
  }

  local songinfo = SongInfo.new()
  local songlist = SongList.new()
  local score = Score.new()
  local scrollbar = ScrollBar.new()
  local option = Option.new()
  local bottominfo = BottomInfo.new()
  local playbutton = Button.PlayButton.new()
  local sortbutton = Button.SortButton.new()
  local keymodebutton = Button.KeyModeButton.new()
  local lnmodebutton = Button.LNModeButton.new()
  local search = Search.new()

  local parts = Objects.new({SongInfo, SongList, Score, ScrollBar, Option, BottomInfo,
    Button.PlayButton, Button.SortButton, Button.KeyModeButton, Button.LNModeButton, Search})

  skin.image = {}
  do
    local src = 0
    if property.isBackgroundCustomize() then src = "source_background_custom" end
    table.insert(skin.image, {id = "background", src = src, x = 0, y = 0, w = -1, h = -1})
  end
  utils.mergeArray(skin.image, (function()
    local src = 2 local w = 48 local h = 64
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
  utils.mergeArray(skin.image, parts:image())

  skin.imageset = {}
  utils.mergeArray(skin.imageset, parts:imageset())

  skin.value = {}
  utils.mergeArray(skin.value, parts:value())

  skin.text = {}
  utils.mergeArray(skin.text, parts:text())

  skin.slider = {}
  utils.mergeArray(skin.slider, parts:slider())

  skin.graph = {}
  utils.mergeArray(skin.graph, parts:graph())

  skin.songlist = SongList.songlist()

  skin.judgegraph = {}
  utils.mergeArray(skin.judgegraph, SongInfo.judgegraph())

  skin.bpmgraph = {}
  utils.mergeArray(skin.bpmgraph, SongInfo.bpmgraph())

  skin.destination = {
    {id = "background", dst = { {x = 0, y = 0, w = header.w, h = header.h, a = 255 - property.backgroundDarkness()} }},
  }
  utils.mergeArray(skin.destination, songinfo.destination())
  utils.mergeArray(skin.destination, score.destination())
  utils.mergeArray(skin.destination, songlist.destination())
  utils.mergeArray(skin.destination, playbutton.destination())
  utils.mergeArray(skin.destination, sortbutton.destination())
  utils.mergeArray(skin.destination, keymodebutton.destination())
  utils.mergeArray(skin.destination, lnmodebutton.destination())
  utils.mergeArray(skin.destination, scrollbar.destination())
  utils.mergeArray(skin.destination, search.destination())
  utils.mergeArray(skin.destination, option.destination())
  utils.mergeArray(skin.destination, bottominfo.destination())

  return skin
end

return {
  header = header,
  main = main
}

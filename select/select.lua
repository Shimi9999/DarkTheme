local utils = require "utils"
local header = require "header"

local SongInfo = require "songinfo"
local Score = require "score"
local SongList = require "songlist"
local Option = require "option"
local ScrollBar = require "scrollbar"
local Button = require "button"
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
  }
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

  skin.image = {
    {id = "background", src = 0, x = 0, y = 0, w = -1, h = -1},

    {id = "search_frame", src = 3, x = 0, y = 0, w = 500, h = 32},
  }
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
  utils.mergeArray(skin.image, songinfo.image())
  utils.mergeArray(skin.image, score.image())
  utils.mergeArray(skin.image, songlist.image())
  utils.mergeArray(skin.image, scrollbar.image())
  utils.mergeArray(skin.image, playbutton.image())
  utils.mergeArray(skin.image, sortbutton.image())
  utils.mergeArray(skin.image, keymodebutton.image())
  utils.mergeArray(skin.image, lnmodebutton.image())
  utils.mergeArray(skin.image, option.image())
  utils.mergeArray(skin.image, bottominfo.image())

  skin.imageset = {}
  utils.mergeArray(skin.imageset, songlist.imageset())
  utils.mergeArray(skin.imageset, option.imageset())

  skin.value = {}
  utils.mergeArray(skin.value, songinfo.value())
  utils.mergeArray(skin.value, score.value())
  utils.mergeArray(skin.value, option.value())
  utils.mergeArray(skin.value, songlist.value())
  utils.mergeArray(skin.value, bottominfo.value())

  skin.text = {
    {id = "search", font = 0, size = 32, ref = 30}
  }
  utils.mergeArray(skin.text, songinfo.text())
  utils.mergeArray(skin.text, songlist.text())

  skin.slider = {}
  utils.mergeArray(skin.slider, scrollbar.slider())

  skin.graph = {}
  utils.mergeArray(skin.graph, songlist.graph())

  skin.songlist = songlist.songlist()

  skin.judgegraph = {}
  utils.mergeArray(skin.judgegraph, songinfo.judgegraph())

  skin.bpmgraph = {}
  utils.mergeArray(skin.bpmgraph, songinfo.bpmgraph())

  skin.destination = {
    {id = "background", dst = { {x = 0, y = 0, w = header.w, h = header.h} }},
  }
  utils.mergeArray(skin.destination, songlist.destination())
  utils.mergeArray(skin.destination, songinfo.destination())
  utils.mergeArray(skin.destination, score.destination())
  utils.mergeArray(skin.destination, playbutton.destination())
  utils.mergeArray(skin.destination, sortbutton.destination())
  utils.mergeArray(skin.destination, keymodebutton.destination())
  utils.mergeArray(skin.destination, lnmodebutton.destination())
  utils.mergeArray(skin.destination, scrollbar.destination())
  utils.mergeArray(skin.destination, (function()
    return {
      {id = "keys", dst = { {x = 700, y = 1000, w = 142, h = 32} }},
      {id = "sort", dst = { {x = 880, y = 1000, w = 200, h = 32} }},

      {id = "search_frame", dst = { {x = 42, y = 42, w = 500, h = 46, r = 16, g = 16, b = 16} }},
      {id = "search", filter = 1, dst = { {x = 50, y = 50, w = 500, h = 32} }},
    }
  end)())
  utils.mergeArray(skin.destination, option.destination())
  utils.mergeArray(skin.destination, bottominfo.destination())

  return skin
end

return {
  header = header,
  main = main
}

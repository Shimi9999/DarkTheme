local utils = require "utils"
local Object = require "object"
local Objects = require "objects"

local Bar = Object.new()
Bar.w = 800
Bar.h = 60
function Bar.image()
  local function img(id, num)
    return {id = id, src = 1, x = 0, y = Bar.h * num, w = Bar.w, h = Bar.h}
  end
  return {
    img("bar_song", 0),
    img("bar_nosong", 4),
    img("bar_folder", 1),
    img("bar_table", 2),
    img("bar_grade", 0),
    img("bar_nograde", 4),
    img("bar_command", 3),
    img("bar_search", 0)
  }
end
function Bar.imageset()
  return {
    {id = "bar", images = {"bar_song","bar_folder","bar_table","bar_grade","bar_nograde","bar_command","bar_search","bar_nosong"}}
  }
end
function Bar.destination(num, x, y)
  local base_x = 1150 local base_y = 510
  local list = {}
  for i = 1, num do
    list[i] = {id = "bar", dst = {
		  {x = base_x + x, y = base_y + y - Bar.h * (i - 1), w = Bar.w, h = Bar.h},
		}}
  end
  return list
end

local BarText = Object.new()
function BarText.text()
  return {
    {id = "bar_text", font = 0, size = 40}
  }
end
function BarText.destination()
  local base_x = 24
  local function bartext(x, r, g, b)
    local y = 8 local w = 24 local h = 36
    return
      {id = "bar_text", filter = 1, dst = {
        {x = x, y = y, w = w, h = h, r = r, g = g, b = b}
      }}
  end
  return {
    -- normal song
    bartext(base_x + 82, 255,255,255),
    -- new song
    bartext(base_x + 76, 255,255,200),
    -- normal song (beatoraja)
    bartext(base_x + 82, 255,255,255),
    -- new song (beatoraja)
    bartext(base_x + 82, 255,255,200),
    -- normal folder
    bartext(base_x, 255,255,255),
    -- new folder
    bartext(base_x, 255,255,200),
    -- table folder
    bartext(base_x, 255,255,255),
    -- class
    bartext(base_x + 76, 255,255,255),
    -- no song
    bartext(base_x + 76, 255,0,0),
    -- command, container
    bartext(base_x, 255,255,255),
    -- search word
    bartext(base_x, 255,255,255)
  }
end

local BarLevel = Object.new()
BarLevel.w = 30
BarLevel.h = 38
function BarLevel.value()
  return {
    utils.generateValue({id = "bar_level", digit = 2})
  }
end
function BarLevel.destination()
  local function barlevel(r, g, b)
    local x = 24 local y = 12
    return {id = "bar_level", filter = 1, dst = {
      {x = x, y = y, w = BarLevel.w, h = BarLevel.h, r = r, g = g, b = b}
    }}
  end
  return {
    -- unknown
    barlevel(178,178,178),
    -- biginner
    barlevel(178,216,140),
    -- normal
    barlevel(140,178,216),
    -- hyper
    barlevel(216,216,140),
    -- another
    barlevel(216,140,140),
    -- insane
    barlevel(197,140,216)
  }
end

local BarLamp = Object.new()
BarLamp.w = 20
BarLamp.h = 60
function BarLamp.image()
  return {
    {id = "lamp", src = 3, x = 0, y = 0, w = BarLamp.w, h = BarLamp.h}
  }
end
function BarLamp.destination(x, y, h)
  local function barlamp(r, g, b)
    return {id = "lamp", blend = 0, dst = {
      {x = x, y = y, w = BarLamp.w, h = h, r = r, g = g, b = b}
    }}
  end
  return {
    -- noplay
    barlamp(34,0,0),
    -- failed
    barlamp(68,68,68),
    -- assist
    barlamp(204,0,204),
    -- lassist
    barlamp(170,34,170),
    -- easy
    barlamp(34,170,34),
    -- normal
    barlamp(170,170,34),
    -- hard
    barlamp(255,255,255),
    -- exhard
    barlamp(250,0,0),
    -- fc
    barlamp(34,170,170),
    -- perfect
    barlamp(51,204,204),
    -- max
    barlamp(71,224,224)
  }
end

local Label = Object.new()
Label.w = 150
Label.h = 64
function Label.image()
  local src = 7 local x = 0 local w = Label.w local h = Label.h
  return {
    {id = "label_ln", src = src, x = x, y = h * 0, w = w, h = h},
    {id = "label_cn", src = src, x = x, y = h * 1, w = w, h = h},
    {id = "label_hcn", src = src, x = x, y = h * 2 , w = w, h = h},
    {id = "label_mine", src = src, x = x, y = h * 3, w = w, h = h},
    {id = "label_random", src = src, x = x, y = h * 4, w = w, h = h}
  }
end
function Label.destination()
  local scale = 0.4
  local y = 16 local w = Label.w * scale local h = Label.h * scale
  return {
    {id = "label_ln", dst = { {x = -110, y = y, w = w, h = h} }},
    {id = "label_random", dst = { {x = -40, y = y, w = w, h = h} }},
    {id = "label_mine", dst = { {x = -50, y = y, w = w, h = h} }},
    {id = "label_cn", dst = { {x = -110, y = y, w = w, h = h} }},
    {id = "label_hcn", dst = { {x = -110, y = y, w = w, h = h} }}
  }
end

local Trophy = Object.new()
Trophy.size = 60
function Trophy.image()
  local src = 9 local x = 0 local y = 0 local w = Trophy.size local h = Trophy.size
  return {
    {id = "trophy_bronze", src = src, x = x + w * 0, y = y, w = w, h = h},
    {id = "trophy_silver", src = src, x = x + w * 1, y = y, w = w, h = h},
    {id = "trophy_gold", src = src, x = x + w * 2, y = y, w = w, h = h}
  }
end
function Trophy.destination()
  local scale = 0.7
  local dst = { {x = 20, y = (Trophy.size * (1 - scale)) / 2 , w = Trophy.size * scale, h = Trophy.size * scale} }
  return {
    {id = "trophy_bronze", filter = 1, dst = dst},
    {id = "trophy_silver", filter = 1, dst = dst},
    {id = "trophy_gold", filter = 1, dst = dst}
  }
end

local LampGraph = Object.new()
LampGraph.h = 8
function LampGraph.graph()
  return {
    {id = "graph_lamp", src = 8, x = 0, y = 0, w = 11, h = LampGraph.h, divx = 11, type = -1}
  }
end
function LampGraph.destination()
  return {id = "graph_lamp", dst = { {x = 0, y = 0, w = 650, h = LampGraph.h} }}
end

local SongList = Objects.new({Bar, BarText, BarLevel, BarLamp, Label, Trophy, LampGraph})
SongList.bar = Bar.new()
SongList.bartext = BarText.new()
SongList.barlevel = BarLevel.new()
SongList.barlamp = BarLamp.new()
SongList.playerlamp = BarLamp.new()
SongList.rivallamp = BarLamp.new()
SongList.label = Label.new()
SongList.trophy = Trophy.new()
SongList.lampgraph = LampGraph.new()
function SongList.songlist()
  return {
    id = "songlist",
    center = 10,
    clickable = {2,3,4,5,6,7,8,9,10,11,12,13,14},
    listoff = SongList.bar.destination(22, 0, 600),
    liston = SongList.bar.destination(22, -30, 600),
    text = SongList.bartext.destination(),
    level = SongList.barlevel.destination(),
    lamp = SongList.barlamp.destination(-20, 0, 60),
    playerlamp = SongList.playerlamp.destination(-20, 0, 30),
    rivallamp = SongList.rivallamp.destination(-20, 30, 30),
    trophy = SongList.trophy.destination(),
    label = SongList.label.destination(),
    graph = SongList.lampgraph.destination()
  }
end
function SongList.destination()
  return {
    {id = "songlist"}
  }
end

return SongList
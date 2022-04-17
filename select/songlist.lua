local utils = require "utils"

local bar = {}
do
  local w = 810
  local h = 60

  bar.source = {
    {id = "src_bar", path = "image/bar.png"},
  }

  do
    local function img(id, num)
      return {id = id, src = "src_bar", x = 0, y = h * num, w = w, h = h}
    end
    bar.image = {
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

  bar.imageset = {
    {id = "bar", images = {"bar_song","bar_folder","bar_table","bar_grade","bar_nograde","bar_command","bar_search","bar_nosong"}}
  }

  function bar.destination(num, x, y)
    local base_x = 1150 local base_y = 510
    local dsts = {}
    for i = 1, num do
      table.insert(dsts, {id = "bar", dst = {
        {x = base_x + x, y = base_y + y - h * (i - 1), w = w, h = h},
      }})
    end
    return dsts
  end
end

local barText = {}
do
  barText.text = {
    {id = "bar_text", font = "font_koruri", size = 40}
  }

  function barText.destination()
    local base_x = 24
    local function bartext_dst(x, r, g, b)
      local y = 8 local w = 24 local h = 36
      return
        {id = "bar_text", filter = 1, dst = {
          {x = x, y = y, w = w, h = h, r = r, g = g, b = b}
        }}
    end
    return {
      -- normal song
      bartext_dst(base_x + 82, 255,255,255),
      -- new song
      bartext_dst(base_x + 76, 255,255,200),
      -- normal song (beatoraja)
      bartext_dst(base_x + 82, 255,255,255),
      -- new song (beatoraja)
      bartext_dst(base_x + 82, 255,255,200),
      -- normal folder
      bartext_dst(base_x, 255,255,255),
      -- new folder
      bartext_dst(base_x, 255,255,200),
      -- table folder
      bartext_dst(base_x, 255,255,255),
      -- class
      bartext_dst(base_x + 76, 255,255,255),
      -- no song
      bartext_dst(base_x + 76, 255,0,0),
      -- command, container
      bartext_dst(base_x, 255,255,255),
      -- search word
      bartext_dst(base_x, 255,255,255)
    }
  end
end

local barLevel = {}
do
  local w = 30
  local h = 38

  barLevel.value = {
    utils.generateValue({id = "bar_level", digit = 2})
  }

  function barLevel.destination()
    local function barlevel_dst(r, g, b)
      local x = 24 local y = 12
      return {id = "bar_level", filter = 1, dst = {
        {x = x, y = y, w = w, h = h, r = r, g = g, b = b}
      }}
    end
    return {
      -- unknown
      barlevel_dst(178,178,178),
      -- biginner
      barlevel_dst(178,216,140),
      -- normal
      barlevel_dst(140,178,216),
      -- hyper
      barlevel_dst(216,216,140),
      -- another
      barlevel_dst(216,140,140),
      -- insane
      barlevel_dst(197,140,216)
    }
  end
end

local barLamp = {}
do
  local w = 20
  local img_h = 60

  barLamp.image = {
    {id = "lamp", src = "src_white", x = 0, y = 0, w = w, h = img_h}
  }

  function barLamp.destination(x, y, h)
    local function barlamp_dst(r, g, b)
      return {id = "lamp", blend = 0, dst = {
        {x = x, y = y, w = w, h = h, r = r, g = g, b = b}
      }}
    end
    return {
      -- noplay
      barlamp_dst(34,0,0),
      -- failed
      barlamp_dst(68,68,68),
      -- assist
      barlamp_dst(204,0,204),
      -- lassist
      barlamp_dst(170,34,170),
      -- easy
      barlamp_dst(34,170,34),
      -- normal
      barlamp_dst(170,170,34),
      -- hard
      barlamp_dst(255,255,255),
      -- exhard
      barlamp_dst(250,0,0),
      -- fc
      barlamp_dst(34,170,170),
      -- perfect
      barlamp_dst(51,204,204),
      -- max
      barlamp_dst(71,224,224)
    }
  end
end

local label = {}
do
  local w = 150
  local h = 64

  do
    local src = "src_label"
    label.image = {
      {id = "label_ln", src = src, x = 0, y = h * 0, w = w, h = h},
      {id = "label_cn", src = src, x = 0, y = h * 1, w = w, h = h},
      {id = "label_hcn", src = src, x = 0, y = h * 2 , w = w, h = h},
      {id = "label_mine", src = src, x = 0, y = h * 3, w = w, h = h},
      {id = "label_random", src = src, x = 0, y = h * 4, w = w, h = h}
    }
  end

  function label.destination()
    local scale = 0.4
    local y = 16 local w = w * scale local h = h * scale
    return {
      {id = "label_ln", dst = {
        {x = -110, y = y, w = w, h = h}
      }},
      {id = "label_random", dst = {
        {x = -40, y = y, w = w, h = h}
      }},
      {id = "label_mine", dst = {
        {x = -50, y = y, w = w, h = h}
      }},
      {id = "label_cn", dst = {
        {x = -110, y = y, w = w, h = h}
      }},
      {id = "label_hcn", dst = {
        {x = -110, y = y, w = w, h = h}
      }}
    }
  end
end

local trophy = {}
do
  local size = 60

  trophy.source = {
    {id = "src_trophy", path = "image/trophy.png"}
  }

  do
    local src = "src_trophy"
    local x = 0 local y = 0 local w = size local h = size
    trophy.image = {
      {id = "trophy_bronze", src = src, x = x + w * 0, y = y, w = w, h = h},
      {id = "trophy_silver", src = src, x = x + w * 1, y = y, w = w, h = h},
      {id = "trophy_gold", src = src, x = x + w * 2, y = y, w = w, h = h}
    }
  end

  function trophy.destination()
    local scale = 0.7
    local dst = { {x = 20, y = (size * (1 - scale)) / 2 , w = size * scale, h = size * scale} }
    return {
      {id = "trophy_bronze", filter = 1, dst = dst},
      {id = "trophy_silver", filter = 1, dst = dst},
      {id = "trophy_gold", filter = 1, dst = dst}
    }
  end
end

local lampGraph = {}
do
  local h = 8

  lampGraph.source = {
    {id = "src_lampgraph", path = "image/lampgraph.png"}
  }

  lampGraph.graph = {
    {id = "graph_lamp", src = "src_lampgraph", x = 0, y = 0, w = 11, h = h, divx = 11, type = -1}
  }

  function lampGraph.destination()
    return {id = "graph_lamp", dst = {
      {x = 0, y = 0, w = 650, h = h}
    }}
  end
end

local songList = {}
do
  songList.songlist = {
    id = "songlist",
    center = 10,
    clickable = {2,3,4,5,6,7,8,9,10,11,12,13,14},
    listoff = bar.destination(22, 0, 600),
    liston = bar.destination(22, -30, 600),
    text = barText.destination(),
    level = barLevel.destination(),
    lamp = barLamp.destination(-20, 0, 60),
    playerlamp = barLamp.destination(-20, 0, 30),
    rivallamp = barLamp.destination(-20, 30, 30),
    trophy = trophy.destination(),
    label = label.destination(),
    graph = lampGraph.destination()
  }

  songList.destination = {
    {id = "songlist"}
  }
end

local skin = {}

local parts = {
  bar,
  barText,
  barLevel,
  barLamp,
  label,
  trophy,
  lampGraph,
}
for _, part in ipairs(parts) do
  utils.merge_all_whitout_function(skin, part)
end

utils.merge_all(skin, songList)

return skin
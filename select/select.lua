local utils = require "utils"
local header = require "header"

local SongInfo = require "songinfo"
local SongList = require "songlist"
local Option = require "option"
local ScrollBar = require "scrollbar"

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
  local scrollbar = ScrollBar.new()
  local option = Option.new()

  skin.image = {
    {id = "background", src = 0, x = 0, y = 0, w = -1, h = -1},

    {id = "search_frame", src = 3, x = 0, y = 0, w = 500, h = 32},

    {id = "keys", src = 4, x = 1410, y = 0, w = 284, h = 64*8, divy = 8, len = 8, ref = 11, act = 11},
    {id = "sort", src = 4, x = 1010, y = 0, w = 400, h = 64*8, divy = 8, len = 8, ref = 12, act = 12},

    {id = "lnmode", src = 7, x = 0, w = 150, h = 64 * 3, divy = 3, len = 3, ref = 308, act = 308},
    {id = "lnmode_frame", src = 3, x = 0, y = 0, w = 150, h = 64},
  }
  utils.mergeArray(skin.image, songinfo.image())
  utils.mergeArray(skin.image, songlist.image())
  utils.mergeArray(skin.image, scrollbar.image())
  utils.mergeArray(skin.image, option.image())
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
  utils.mergeArray(skin.image, (function()
    local src = 4 x = 600 w = 400 h = 64
    local t = {}
    for i = 1, 11 do
      t[i] = {id = "cleartype_"..i, src = src, x = x, y = h * (i-1), w = w, h = h}
    end
    return t
  end)())
  utils.mergeArray(skin.image, (function()
    local src = 5 base_x = 0 y = 0 w = 64 h = 64
    return {
      {id = "play", src = src, x = base_x + w * 0, y = y, w = w, h = h, ref = 15, act = 15},
      {id = "auto", src = src, x = base_x + w * 1, y = y, w = w, h = h, ref = 16, act = 16},
      {id = "practice", src = src, x = base_x + w * 2, y = y, w = w, h = h, ref = 315, act = 315},
      {id = "replay_1", src = src, x = base_x + w * 3, y = y, w = w, h = h, ref = 19, act = 19},
      {id = "replay_2", src = src, x = base_x + w * 4, y = y, w = w, h = h, ref = 316, act = 316},
      {id = "replay_3", src = src, x = base_x + w * 5, y = y, w = w, h = h, ref = 317, act = 317},
      {id = "replay_4", src = src, x = base_x + w * 6, y = y, w = w, h = h, ref = 318, act = 318}
    }
  end)())
  utils.mergeArray(skin.image, (function()
    local src = 6 y = 0 h = 64
    return {
      {id = "judges", src = src, x = 0, y = y, w = 254, h = h * 6},
      {id = "scores", src = src, x = 300, y = y, w = 400, h = h * 5}
    }
  end)())
  utils.mergeArray(skin.image, (function()
    local src = 6 x = 740 y = 0 w = 140 h = 64
    local t = {}
    for i = 1, 9 do
      t[i] = {id = "rank_"..i, src = src, x = x, y = h * (i-1), w = w, h = h}
    end
    return t
  end)())
  utils.mergeArray(skin.image, (function()
    local src = 6 x = 900 y = 0 w = 450 h = 64
    local t = {}
    for i = 1, 10 do
      t[i] = {id = "clearoption_"..i, src = src, x = x, y = h * (i-1), w = w, h = h}
    end
    return t
  end)())
  utils.mergeArray(skin.image, (function()
    local src = 10 x = 0 y = 0 w = 526 h = 64
    return {
      {id = "uptime", src = src, x = x, y = y + h * 0, w = w, h = h},
      {id = "total_playnotes", src = src, x = x, y = y + h * 1, w = w, h = h},
      {id = "total_playcount", src = src, x = x, y = y + h * 2, w = w, h = h},
      {id = "total_clearcount", src = src, x = x, y = y + h * 3, w = w, h = h},
      {id = "total_playtime", src = src, x = x, y = y + h * 4, w = w, h = h},
      {id = "songs", src = src, x = x, y = y + h * 6, w = w, h = h},
    }
  end)())

  skin.imageset = {}
  utils.mergeArray(skin.imageset, songlist.imageset())
  utils.mergeArray(skin.imageset, option.imageset())

  skin.value = (function()
    local v = {
      utils.generateValue({id = "songs_num", digit = 5, ref = 300}),
      utils.generateValue({id = "uptime_hour_num", digit = 2, ref = 27}),
      utils.generateValueX({id = "uptime_minute_num", digit = 2, ref = 28}, 11),
      utils.generateValueX({id = "uptime_second_num", digit = 2, ref = 29}, 11),
      utils.generateValue({id = "total_playtime_hour_num", digit = 4, ref = 17}),
      utils.generateValueX({id = "total_playtime_minute_num", digit = 2, ref = 18}, 11),
      utils.generateValueX({id = "total_playtime_second_num", digit = 2, ref = 19}, 11),
      utils.generateValue({id = "total_playnotes_num", digit = 10, ref = 333}),
      utils.generateValue({id = "total_playcount_num", digit = 4, ref = 30}),
      utils.generateValue({id = "total_clearcount_num", digit = 4, ref = 31}),

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
      utils.generateValue({id = "nextrank_num", digit = 4, ref = 154}),

      utils.generateValue({id = "exscore_rival_num", digit = 5, ref = 271}),

      utils.generateValue({id = "scorerate_num", digit = 3, ref = 102}),
      utils.generateValueX({id = "scorerate_afterdot_num", digit = 2, ref = 103}, 11),

      utils.generateValue({id = "fps_num", digit = 4, ref = 20})
    }
    for i = 1, 6 do
      local ref = 109 + i
      if i == 6 then ref = 420 end
      utils.mergeArray(v, { utils.generateValue({id = "judge_num_"..i, digit = 4, ref = ref}) } )
    end

    return v
  end)()
  utils.mergeArray(skin.value, songinfo.value())
  utils.mergeArray(skin.value, option.value())
  utils.mergeArray(skin.value, songlist.value())

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
  utils.mergeArray(skin.destination, (function()
    local base_x = 50 base_y = 460 w = 24 h = 32
    return {
      {id = "scorerate_num", op = {5, -100}, dst = { {x = base_x, y = base_y - 40 , w = w, h = h} }},
      {id = "dot", op = {5, -100}, dst = { {x = base_x + 50, y = base_y - 40 , w = w, h = h} }},
      {id = "scorerate_afterdot_num", op = {5, -100}, dst = { {x = base_x + 70, y = base_y - 40, w = w, h = h} }},
      {id = "percent", op = {5, -100}, dst = { {x = base_x + 110, y = base_y - 40 , w = w, h = h} }}
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    local scale = 0.4
    local base_x = 30 base_y = 250 h = 64 * scale
    return {
      {id = "judges", op = {5}, dst = { {x = base_x, y = base_y, w = 254 * scale, h = h * 6} }},
      {id = "scores", op = {5}, dst = { {x = base_x + 200, y = base_y + h, w = 400 * scale, h = h * 5} }}
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    local scale = 0.4
    local x = 140 base_y = 250 w = 48 * scale h = 64 * scale
    local t = {}
    for i = 1, 6 do
      t[i] = {id = "judge_num_"..i, op = {5}, dst = { {x = x, y = base_y + h * (i - 1), w = w, h = h} }}
    end
    return t
  end)())
  utils.mergeArray(skin.destination, (function()
    local scale = 0.4
    local x = 400 m = 70 w = 48 * scale h = 64 * scale
    local base_y = 250 + h * 5
    return {
      {id = "exscore_num", op = {2}, dst = { {x = x, y = base_y - h * 0, w = w, h = h} }},
      {id = "maxcombo_num", op = {5}, dst = { {x = x, y = base_y - h * 1, w = w, h = h} }},
      {id = "totalnotes_num", op = {5}, dst = { {x = x + m, y = base_y - h * 1, w = w, h = h} }},
      {id = "combobreak_num", op = {5}, dst = { {x = x, y = base_y - h * 2, w = w, h = h} }},
      {id = "misscount_num", op = {5}, dst = { {x = x + m, y = base_y - h * 2, w = w, h = h} }},
      {id = "clearcount_num", op = {5}, dst = { {x = x, y = base_y - h * 3, w = w, h = h} }},
      {id = "playcount_num", op = {5}, dst = { {x = x + m, y = base_y - h * 3, w = w, h = h} }},
      {id = "fast_num", op = {5}, dst = { {x = x, y = base_y - h * 4, w = w, h = h} }},
      {id = "slow_num", op = {5}, dst = { {x = x + m, y = base_y - h * 4, w = w, h = h} }},

      {id = "djpoint_num", op = {5}, dst = { {x = x - 100, y = base_y - h * 5, w = w, h = h} }},
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    local x = 30 y = 460 w = 200 h = 32
    local ops = {100, 101, 1100, 1101, 102, 103, 104, 1102, 105, 1103, 1104}
    local t = {}
    for i = 1, 11 do
      t[i] = {id = "cleartype_"..i, op = {5, ops[i]}, dst = { {x = x, y = y, w = w, h = h} }}
    end
    return t
  end)())
  utils.mergeArray(skin.destination, (function()
    -- OK : NORMAL,MIRROR,RANDOM,SRANDOM,RRANDOM,SPIRAL
    -- NG : HRANDOM,ALLSCR,ECRANDOM,EXSRANDOM
    local scale = 0.3
    local x = 50 y = 220 w = 450 * scale h = 64 * scale
    local ops = {126, 127, 128, 129, 130, 131, 1128, 1129, 1130, 1131}
    local t = {}
    for i = 1, 10 do
      t[i] = {id = "clearoption_"..i, op = {5, ops[i]}, dst = {
         {x = x + (w + 10) * math.floor(i / 5) , y = y - h * (i % 5 - 1), w = w, h = h}
      }}
    end
    return t
  end)())
  utils.mergeArray(skin.destination, (function()
    local x = 240 y = 430 w = 130 h = 64
    local t = {}
    for i = 1, 8 do
      t[i] = {id = "rank_"..i + 1, op = {199 + i}, dst = { {x = x, y = y, w = w, h = h} }}
    end
    return t
  end)())
  utils.mergeArray(skin.destination, (function()
    local scale = 0.4
    local x = 360 y = 420 w = 48 * scale h = 64 * scale
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
  end)())
  utils.mergeArray(skin.destination, (function()
    local x = 50 y = 100 w = 38 h = 38 margin = 10
    local function dst(pos) return { {x = x + (w + margin) * pos, y = y, w = w, h = h} } end
    return {
      {id = "play", op = {5}, filter = 1, dst = dst(0)},
      {id = "auto", op = {5}, filter = 1, dst = dst(1)},
      {id = "practice", op = {5}, filter = 1, dst = dst(2)},
      {id = "replay_1", op = {5, 197}, filter = 1, dst = dst(3)},
      {id = "replay_2", op = {5, 1197}, filter = 1, dst = dst(4)},
      {id = "replay_3", op = {5, 1200}, filter = 1, dst = dst(5)},
      {id = "replay_4", op = {5, 1203}, filter = 1, dst = dst(6)}
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    local scale = 0.6
    local x = 800 y = 50 w = 150 * scale h = 64 * scale
    return {
      {id = "lnmode_frame", dst = { {x = x, y = y, w = w, h = h, r = 16, g = 16, b = 16} }},
      {id = "lnmode", dst = { {x = x, y = y, w = w, h = h} }}
    }
  end)())
  utils.mergeArray(skin.destination, scrollbar.destination())
  utils.mergeArray(skin.destination, (function()
    local scale = 0.5 op = {1}
    local base_x = 400 y = 640 w = 20 h = 64 * scale
    return {
      {id = "songs_num", op = op, dst = { {x = base_x, y = y, w = 48 * scale, h = h} }},
      {id = "songs", op = op, dst = { {x = base_x + 100, y = y, w = 526 * scale, h = h} }},
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    local scale = 0.5 op = {1}
    local base_x = 300 base_y = 400 w = 526 * scale h = 64 * scale
    local nx = base_x + w + 20 nw = 48 * scale
    return {
      {id = "total_playtime", op = op, dst = { {x = base_x, y = base_y - h * 0, w = w, h = h} }},
      {id = "total_playnotes", op = op, dst = { {x = base_x, y = base_y - h * 1, w = w, h = h} }},
      {id = "total_playcount", op = op, dst = { {x = base_x, y = base_y - h * 2, w = w, h = h} }},
      {id = "total_clearcount", op = op, dst = { {x = base_x, y = base_y - h * 3, w = w, h = h} }},

      {id = "total_playtime_hour_num", op = op, dst = { {x = nx, y = base_y - h * 0, w = nw, h = h} }},
      {id = "colon", op = op, dst = { {x = nx + 10 + 60 * 1, y = base_y - h * 0, w = nw, h = h} }},
      {id = "total_playtime_minute_num", op = op, dst = { {x = nx + 30 + 60 * 1, y = base_y - h * 0, w = nw, h = h} }},
      {id = "colon", op = op, dst = { {x = nx + 10 + 60 * 2, y = base_y - h * 0, w = nw, h = h} }},
      {id = "total_playtime_second_num", op = op, dst = { {x = nx + 30 + 60 * 2, y = base_y - h * 0, w = nw, h = h} }},
      {id = "total_playnotes_num", op = op, dst = { {x = nx, y = base_y - h * 1, w = nw, h = h} }},
      {id = "total_playcount_num", op = op, dst = { {x = nx, y = base_y - h * 2, w = nw, h = h} }},
      {id = "total_clearcount_num", op = op, dst = { {x = nx, y = base_y - h * 3, w = nw, h = h} }},
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    return {
      {id = "keys", dst = { {x = 700, y = 1000, w = 142, h = 32} }},
      {id = "sort", dst = { {x = 880, y = 1000, w = 200, h = 32} }},

      {id = "search_frame", dst = { {x = 42, y = 42, w = 500, h = 46, r = 16, g = 16, b = 16} }},
      {id = "search", filter = 1, dst = { {x = 50, y = 50, w = 500, h = 32} }},
    }
  end)())
  utils.mergeArray(skin.destination, option.destination())
  utils.mergeArray(skin.destination, (function()
    local scale = 0.45
    local base_x = 4 y = 4 nw = 48 * scale h = 64 * scale
    local uptime_x = base_x + 140 uptimenum_x = uptime_x + 76
    local info_color = {r = 105, g = 105, b = 105}
    return {
      {id = "fps_num", dst = { utils.mergeMap({x = base_x, y = y, w = nw, h = h}, info_color) }},

      {id = "uptime", dst = { utils.mergeMap({x = uptime_x, y = y, w = 526 * scale, h = h}, info_color) }},
      {id = "uptime_hour_num", dst = { utils.mergeMap({x = uptimenum_x + 50 * 1, y = y, w = nw, h = h}, info_color) }},
      {id = "colon", dst = { utils.mergeMap({x = uptimenum_x + 32 + 50 * 1, y = y, w = nw, h = h}, info_color) }},
      {id = "uptime_minute_num", dst = { utils.mergeMap({x = uptimenum_x + 50 * 2, y = y, w = nw, h = h}, info_color) }},
      {id = "colon", dst = { utils.mergeMap({x = uptimenum_x + 32 + 50 * 2, y = y, w = nw, h = h}, info_color) }},
      {id = "uptime_second_num", dst = { utils.mergeMap({x = uptimenum_x + 50 * 3, y = y, w = nw, h = h}, info_color) }}
    }
  end)())

  return skin
end

return {
  header = header,
  main = main
}

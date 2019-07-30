local utils = require "utils"
local header = require "header"

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

  local scrollbar = ScrollBar.new()

  skin.image = {
    {id = "background", src = 0, x = 0, y = 0, w = -1, h = -1},

    {id = "lamp", src = 3, x = 0, y = 0, w = 16, h = 60},
    {id = "search_frame", src = 3, x = 0, y = 0, w = 500, h = 32},

    {id = "keys", src = 4, x = 1410, y = 0, w = 284, h = 64*8, divy = 8, len = 8, ref = 11, act = 11},
    {id = "sort", src = 4, x = 1010, y = 0, w = 400, h = 64*8, divy = 8, len = 8, ref = 12, act = 12},

    {id = "lnmode", src = 7, x = 0, w = 150, h = 64 * 3, divy = 3, len = 3, ref = 308, act = 308},
    {id = "lnmode_frame", src = 3, x = 0, y = 0, w = 150, h = 64},

    {id = "option_play", src = 12, x = 0, y = 0, w = header.w, h = header.h},
    {id = "option_assist", src = 13, x = 0, y = 0, w = header.w, h = header.h},
    {id = "option_detailed", src = 14, x = 0, y = 0, w = header.w, h = header.h},
    {id = "option_bg_1", src = 0, x = 0, y = 0, w = -1, h = -1},
    {id = "option_bg_2", src = 0, x = 0, y = 0, w = -1, h = -1},
    {id = "option_bg_3", src = 0, x = 0, y = 0, w = -1, h = -1},
  }
  utils.mergeArray(skin.image, (function()
    local src = 11 x = 0 base_y = 540 diff_y = 60 w = 220
    local t = {}
    local function selector(selection_num)
      local h = 10 + diff_y * selection_num
      for i = 1, selection_num do
        table.insert(t, {id = "option_selector_"..selection_num.."_"..i, src = src, x = x, y = base_y - diff_y * (i - 1), w = w, h = h})
      end
    end
    selector(2)
    selector(3)
    selector(4)
    selector(5)
    selector(6)
    selector(10)
    return t
  end)())
  utils.mergeArray(skin.image, (function()
    local src = 15 x = 0 base_y = 0 diff_y = 40 w = 310 h = 430
    local t = {}
    for i = 1, 11 do
      table.insert(t, {id = "option_target_"..i, src = src, x = x, y = base_y + diff_y * (i - 1), w = w, h = h})
    end
    return t
  end)())
  utils.mergeArray(skin.image, scrollbar.image())
  utils.mergeArray(skin.image, (function()
    local src = 2 w = 48 h = 64
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
    local src = 1 x = 0 w = 800 h = 60
    return {
      {id = "bar_song", src = src, x = x, y = h * 0, w = w, h = h},
      {id = "bar_nosong", src = src, x = x, y = h * 4, w = w, h = h},
      {id = "bar_folder", src = src, x = x, y = h * 1 , w = w, h = h},
      {id = "bar_table", src = src, x = x, y = h * 2, w = w, h = h},
      {id = "bar_grade", src = src, x = x, y = h * 0, w = w, h = h},
      {id = "bar_nograde", src = src, x = x, y = h * 4, w = w, h = h},
      {id = "bar_command", src = src, x = x, y = h * 3, w = w, h = h},
      {id = "bar_search", src = src, x = x, y = h * 0, w = w, h = h}
    }
  end)())
  utils.mergeArray(skin.image, (function()
    local src = 7 x = 0 w = 150 h = 64
    return {
      {id = "label_ln", src = src, x = x, y = h * 0, w = w, h = h},
      {id = "label_cn", src = src, x = x, y = h * 1, w = w, h = h},
      {id = "label_hcn", src = src, x = x, y = h * 2 , w = w, h = h},
      {id = "label_mine", src = src, x = x, y = h * 3, w = w, h = h},
      {id = "label_random", src = src, x = x, y = h * 4, w = w, h = h}
    }
  end)())
  utils.mergeArray(skin.image, (function()
    local src = 4 x = 248 w = 350 h = 64
    return {
      {id = "veryhard_judge", src = src, x = x, y = h * 0, w = w, h = h},
      {id = "hard_judge", src = src, x = x, y = h * 1 , w = w, h = h},
      {id = "normal_judge", src = src, x = x, y = h * 2, w = w, h = h},
      {id = "easy_judge", src = src, x = x, y = h * 3, w = w, h = h},
      {id = "veryeasy_judge", src = src, x = x, y = h * 4, w = w, h = h},

      {id = "bpm", src = src, x = x, y = h * 7, w = w, h = h},
      {id = "total", src = src, x = x, y = h * 8, w = w, h = h},
    }
  end)())
  utils.mergeArray(skin.image, (function()
    local src = 4 x = 0 w = 250 h = 64
    return {
      {id = "7keys", src = src, x = x, y = h * 0, w = w, h = h},
      {id = "5keys", src = src, x = x, y = h * 1 , w = w, h = h},
      {id = "14keys", src = src, x = x, y = h * 2, w = w, h = h},
      {id = "10keys", src = src, x = x, y = h * 3, w = w, h = h},
      {id = "9keys", src = src, x = x, y = h * 4, w = w, h = h},
      {id = "24keys", src = src, x = x, y = h * 4, w = w, h = h},
      {id = "48keys", src = src, x = x, y = h * 4, w = w, h = h}
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
    local src = 4 x = 1700 w = 290 h = 64
    return {
      {id = "peak", src = src, x = x, y = h * 0, w = w, h = h},
      {id = "end", src = src, x = x, y = h * 1 , w = w, h = h},
      {id = "average", src = src, x = x, y = h * 2, w = w, h = h},
      {id = "note", src = src, x = x, y = h * 4, w = w, h = h},
      {id = "scratch", src = src, x = x, y = h * 5, w = w, h = h},
      {id = "ln", src = src, x = x, y = h * 6, w = w, h = h},
      {id = "bss", src = src, x = x, y = h * 7, w = w, h = h}
    }
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
    local src = 9 x = 0 y = 0 w = 60 h = 60
    return {
      {id = "trophy_bronze", src = src, x = x + w * 0, y = y, w = w, h = h},
      {id = "trophy_silver", src = src, x = x + w * 1, y = y, w = w, h = h},
      {id = "trophy_gold", src = src, x = x + w * 2, y = y, w = w, h = h}
    }
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
  skin.imageset = {
    {id = "bar", images = {"bar_song","bar_folder","bar_table","bar_grade","bar_nograde","bar_command","bar_search","bar_nosong"}},

    {id = "option_target", ref = 77, images = (function()
      local t = {}
      for i = 1, 11 do
        table.insert(t, "option_target_"..i)
      end
      return t
    end)()},
  }
  utils.mergeArray(skin.imageset, (function()
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
  end)())
  skin.value = (function()
    local function value(param_table)
      local src = 2 x = 0 y = 0 w = 480 h = 64 divx = 10 space = -4
      local t = {src = src, x = x, y = y, w = w, h = h, divx = divx, space = space}
      return utils.mergeMap(t, param_table)
    end
    local v = {
      value({id = "bar_level", digit = 2}),

      value({id = "songs_num", digit = 5, ref = 300}),
      value({id = "uptime_hour_num", digit = 2, ref = 27}),
      value({id = "uptime_minute_num", digit = 2, ref = 28, w = w + 48, divx = 11}),
      value({id = "uptime_second_num", digit = 2, ref = 29, w = w + 48, divx = 11}),
      value({id = "total_playtime_hour_num", digit = 4, ref = 17}),
      value({id = "total_playtime_minute_num", digit = 2, ref = 18, w = w + 48, divx = 11}),
      value({id = "total_playtime_second_num", digit = 2, ref = 19, w = w + 48, divx = 11}),
      value({id = "total_playnotes_num", digit = 10, ref = 333}),
      value({id = "total_playcount_num", digit = 4, ref = 30}),
      value({id = "total_clearcount_num", digit = 4, ref = 31}),

      value({id = "bpm_num", digit = 3, ref = 91}),
      value({id = "bpm_max_num", digit = 3, ref = 90}),
      value({id = "bpm_min_num", digit = 3, ref = 91}),
      value({id = "bpm_main_num", digit = 3, ref = 92}),

      value({id = "songtime_minute", digit = 2, ref = 1163}),
      value({id = "songtime_second", digit = 2, ref = 1164, w = w + 48, divx = 11}),

      value({id = "density_peak", digit = 2, ref = 360}),
      value({id = "density_end", digit = 2, ref = 362}),
      value({id = "density_end_afterdot", digit = 2, ref = 363, w = w + 48, divx = 11}),
      value({id = "density_average", digit = 2, ref = 364}),
      value({id = "density_peak_afterdot", digit = 2, ref = 365, w = w + 48, divx = 11}),

      value({id = "total_num", digit = 3, ref = 368}),

      value({id = "note_num", digit = 4, ref = 350}),
      value({id = "ln_num", digit = 4, ref = 351}),
      value({id = "scratch_num", digit = 4, ref = 352}),
      value({id = "bss_num", digit = 4, ref = 353}),
      value({id = "mine_num", digit = 4, ref = 354}),

      value({id = "exscore_num", digit = 4, ref = 71}),
      value({id = "maxcombo_num", digit = 4, ref = 75}),
      value({id = "totalnotes_num", digit = 4, ref = 74}),
      value({id = "combobreak_num", digit = 4, ref = 425}),
      value({id = "misscount_num", digit = 4, ref = 76}),
      value({id = "clearcount_num", digit = 4, ref = 78}),
      value({id = "playcount_num", digit = 4, ref = 77}),
      value({id = "fast_num", digit = 4, ref = 423}),
      value({id = "slow_num", digit = 4, ref = 424}),
      value({id = "djpoint_num", digit = 6, ref = 100}),
      value({id = "nextrank_num", digit = 4, ref = 154}),

      value({id = "exscore_rival_num", digit = 5, ref = 271}),

      value({id = "scorerate_num", digit = 3, ref = 102}),
      value({id = "scorerate_afterdot_num", digit = 2, ref = 103, w = w + 48, divx = 11}),

      value({id = "option_duration", digit = 4, ref = 312}),
      value({id = "option_greennumber", digit = 4, ref = 313}),
      value({id = "option_judgetiming", digit = 3, ref = 12, w = w + 48 * 2, h = h * 2, divx = 12, divy = 2}),

      value({id = "fps_num", digit = 4, ref = 20})
    }
    for i = 1, 6 do
      local ref = 109 + i
      if i == 6 then ref = 420 end
      utils.mergeArray(v, { value({id = "judge_num_"..i, digit = 4, ref = ref}) } )
    end

    return v
  end)()
  skin.text = {
    {id = "bar_text", font = 0, size = 40},

    {id = "title", font = 0, size = 90, align = 1, overflow = 1, shadowOffsetX = 4, shadowOffsetY = 4, ref = 10},
    {id = "subtitle", font = 0, size = 48, align = 1, overflow = 1, shadowOffsetX = 2, shadowOffsetY = 2, ref = 11},
    {id = "artist", font = 0, size = 32, align = 1, overflow = 1, ref = 16},
    {id = "subartist", font = 0, size = 44, align = 1, overflow = 1, ref = 15},
    {id = "genre", font = 0, size = 32, align = 1, overflow = 1, ref = 13},
    {id = "directory", font = 0, size = 32, align = 1, overflow = 1, ref = 1000},
    {id = "coursetitle1", font = 0, size = 90, align = 1, overflow = 1, ref = 150},
    {id = "coursetitle2", font = 0, size = 38, align = 1, overflow = 1, ref = 151},
    {id = "coursetitle3", font = 0, size = 38, align = 1, overflow = 1, ref = 152},
    {id = "coursetitle4", font = 0, size = 38, align = 1, overflow = 1, ref = 153},
    {id = "coursetitle5", font = 0, size = 38, align = 1, overflow = 1, ref = 154},

    {id = "search", font = 0, size = 32, ref = 30}
  }
  skin.graph = {
    {id = "graph_lamp", src = 8, x = 0, y = 0, w = 11, h = 10, divx = 11, type = -1}
  }

  skin.slider = {}
  utils.mergeArray(skin.slider, scrollbar.slider())


  function generateSongList(x, y)
    local base_x = 1150 base_y = 510 w = 800 h = 60
    local list = {}
    for i = 1, 22 do
      list[i] = {id = "bar", dst = {
			  {x = base_x + x, y = base_y + y - h * (i - 1), w = w, h = h},
			}}
    end
    return list
  end
  skin.songlist = {
    id = "songlist",
    center = 10,
    clickable = {2,3,4,5,6,7,8,9,10,11,12,13,14},
    listoff = generateSongList(0, 600),
    liston = generateSongList(-30, 600),
		text = (function()
      local base_x = 24
      local function bartext(x, r, g, b)
        local y = 8 w = 24 h = 36
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
    end)(),
    level = (function()
      local function barlevel(r, g, b)
        local x = 24 y = 12 w = 30 h = 38
        return {id = "bar_level", filter = 1, dst = {
  				{x = x, y = y, w = w, h = h, r = r, g = g, b = b}
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
    end)(),
    lamp = (function()
      local function barlamp(r, g, b)
        local x = -20 y = 0 w = 20 h = 60
        return {id = "lamp", blend = 2, dst = {
  				{x = x, y = y, w = w, h = h, r = r, g = g, b = b}
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
    end)(),
    trophy = (function()
      local scale = 0.7 size = 60
      local dst = { {x = 20, y = (size * (1 - scale)) / 2 , w = size * scale, h = size * scale} }
      return {
        {id = "trophy_bronze", filter = 1, dst = dst},
        {id = "trophy_silver", filter = 1, dst = dst},
        {id = "trophy_gold", filter = 1, dst = dst}
      }
    end)(),
    label = (function()
      local scale = 0.4
      local y = 16 w = 150 * scale h = 64 * scale
      return {
        {id = "label_ln", dst = { {x = -110, y = y, w = w, h = h} }},
        {id = "label_random", dst = { {x = -40, y = y, w = w, h = h} }},
        {id = "label_mine", dst = { {x = -50, y = y, w = w, h = h} }},
        {id = "label_cn", dst = { {x = -110, y = y, w = w, h = h} }},
        {id = "label_hcn", dst = { {x = -110, y = y, w = w, h = h} }}
      }
    end)(),
    graph = {
			id = "graph_lamp", dst = { {x = 0, y = 0, w = 650, h = 8} }
		}
  }
  skin.judgegraph = {
    {id = "notesgraph", noGap = 1, type = 0}
  }
  skin.bpmgraph = {
    {id = "bpmgraph"}
  }

  skin.destination = {
    {id = "background", dst = { {x = 0, y = 0, w = header.w, h = header.h} }},

    -- banner
    {id = -102, stretch = 1, dst = { {x = 60, y = 940, w = 300, h = 80} }},

    -- stagefile
    {id = -100, stretch = 1, filter = 1, dst = { {x = 50, y = 540, w = 400, h = 300} }},

    {id = "songlist"},

    {id = "bpm", op = {2}, filter = 1, dst = { {x = 480, y = 560, w = 350 * 0.5, h = 32} }},
    {id = "bpm_num", op = {2,176}, filter = 1, dst = { {x = 480 + 100, y = 560, w = 22, h = 32} }},
    {id = "bpm_min_num", op = {2,177}, filter = 1, dst = { {x = 480 + 100, y = 560, w = 22, h = 32} }},
    {id = "wavedash", op = {2,177}, filter = 1, dst = { {x = 536 + 100, y = 560, w = 22, h = 32} }},
    {id = "bpm_max_num", op = {2,177}, filter = 1, dst = { {x = 560 + 100, y = 560, w = 22, h = 32} }},
    {id = "bpm_main_num", op = {2,177}, filter = 1, dst = { {x = 640 + 100, y = 560, w = 22, h = 32, r = 127, g = 204, b = 101} }},

    {id = "songtime_minute", op = {2}, dst = { {x = 480, y = 520, w = 24, h = 32} }},
    {id = "colon", op = {2}, dst = { {x = 520, y = 520, w = 24, h = 32} }},
    {id = "songtime_second", op = {2}, dst = { {x = 540, y = 520, w = 24, h = 32} }},

    {id = "total", op = {2}, filter = 1, dst = { {x = 480, y = 480, w = 350 * 0.5, h = 32} }},
    {id = "total_num", op = {2}, dst = { {x = 480 + 120, y = 480, w = 24, h = 32} }}
  }
  utils.mergeArray(skin.destination, (function()
    local base_x = 540 base_y = 706 w = 1000 h = 32
    local course_h = 40
    return {
      {id = "directory", filter = 1, dst = { {x = base_x - 40, y = base_y + 140, w = w, h = h} }},
      {id = "genre", filter = 1, dst = { {x = base_x, y = base_y + 92, w = w, h = h} }},
      {id = "title", filter = 1, dst = { {x = base_x, y = base_y, w = w, h = 76} }},
      {id = "subtitle", filter = 1, dst = { {x = base_x, y = base_y - 44, w = w, h = 48} }},
      {id = "artist", filter = 1, dst = { {x = base_x, y = base_y - 84, w = w, h = h} }},
      {id = "coursetitle1", filter = 1, dst = { {x = base_x, y = base_y - (course_h + 4) * 0, w = w, h = course_h} }},
      {id = "coursetitle2", filter = 1, dst = { {x = base_x, y = base_y - (course_h + 4) * 1, w = w, h = course_h} }},
      {id = "coursetitle3", filter = 1, dst = { {x = base_x, y = base_y - (course_h + 4) * 2, w = w, h = course_h} }},
      {id = "coursetitle4", filter = 1, dst = { {x = base_x, y = base_y - (course_h + 4) * 3, w = w, h = course_h} }},
      {id = "coursetitle5", filter = 1, dst = { {x = base_x, y = base_y - (course_h + 4) * 4, w = w, h = course_h} }}
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    local base_x = 550 y = 400 w = 30 h = 40 op = {2, 5}
    local peak_color = {r = 201, g = 101, b = 101}
    local end_color = {r = 204, g = 204, b = 101}
    local average_color = {r = 101, g = 178, b = 204}
    local tscale = 0.3
    local tw = 290 * tscale th = 64 * tscale
    local ty = y - 20
    return {
      {id = "density_peak", op = op, filter = 1, dst = { utils.mergeMap({x = base_x, y = y, w = w, h = h}, peak_color) }},
      {id = "density_end", op = op, filter = 1, dst = { utils.mergeMap({x = base_x + 100, y = y, w = w, h = h}, end_color) }},
      {id = "dot", op = op, filter = 1, dst = { utils.mergeMap({x = base_x + 140, y = y, w = w, h = h}, end_color) }},
      {id = "density_end_afterdot", op = op, filter = 1, dst = { utils.mergeMap({x = base_x + 160, y = y, w = w*0.7, h = h*0.7}, end_color) }},
      {id = "density_average", op = op, filter = 1, dst = { utils.mergeMap({x = base_x + 240, y = y, w = w, h = h}, average_color) }},
      {id = "dot", op = op, filter = 1, dst = { utils.mergeMap({x = base_x + 280, y = y, w = w, h = w}, average_color) }},
      {id = "density_peak_afterdot", filter = 1, op = op, dst = { utils.mergeMap({x = base_x + 300, y = y, w = w*0.7, h = h*0.7}, average_color) }},

      {id = "peak", op = op, dst = { utils.mergeMap({x = base_x, y = ty, w = tw, h = th}, peak_color) }},
      {id = "end", op = op, dst = { utils.mergeMap({x = base_x + 140, y = ty, w = tw, h = th}, end_color) }},
      {id = "average", op = op, dst = { utils.mergeMap({x = base_x + 260, y = ty, w = tw, h = th}, average_color) }}
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    local dst = { {x = 850, y = 560, w = 170, h = 32} }
    return {
      {id = "veryhard_judge", op = {180}, dst = dst},
      {id = "hard_judge", op = {181}, dst = dst},
      {id = "normal_judge", op = {182}, dst = dst},
      {id = "easy_judge", op = {183}, dst = dst},
      {id = "veryeasy_judge", op = {184}, dst = dst}
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    local dst = { { x = 850, y = 520, w = 125, h = 32} }
    return {
      {id = "7keys", op = {160}, dst = dst},
      {id = "5keys", op = {161}, dst = dst},
      {id = "14keys", op = {162}, dst = dst},
      {id = "10keys", op = {163}, dst = dst},
      {id = "9keys", op = {164}, dst = dst},
      {id = "24keys", op = {1160}, dst = dst},
      {id = "48keys", op = {1161}, dst = dst},
    }
  end)())
  utils.mergeArray(skin.destination, (function()
    local base_x = 550 base_y = 200 num_y = base_y - 40 w = 24 h = 32 margin = 100
    local tscale = 0.3
    local tw = 290 * tscale th = 64 * tscale
    local ty = num_y - 20
    local color_note = {r = 255, g = 255, b = 255}
    local color_scratch = {r = 204, g = 101, b = 101}
    local color_ln = {r = 101, g = 153, b = 204}
    local color_bss = {r = 204, g = 127, b = 101}
    return {
      {id = "notesgraph", op = {2}, dst = { {x = base_x, y = base_y, w = 500, h = 140} }},
      {id = "bpmgraph", op = {2, 177}, dst = { {x = base_x, y = base_y, w = 500, h = 140} }},

      {id = "note_num", op = {5}, dst = { utils.mergeMap({x = base_x + margin * 0, y = num_y, w = w, h = h}, color_note) }},
      {id = "scratch_num", op = {5}, dst = { utils.mergeMap({x = base_x + margin * 1, y = num_y, w = w, h = h}, color_scratch) }},
      {id = "ln_num", op = {5}, dst = { utils.mergeMap({x = base_x + margin * 2, y = num_y, w = w, h = h}, color_ln) }},
      {id = "bss_num", op = {5}, dst = { utils.mergeMap({x = base_x + margin * 3, y = num_y, w = w, h = h, }, color_bss) }},
      --{id = "mine_num", op = {5}, dst = { {x = base_x + 400, y = num_y, w = w, h = h} }}

      {id = "note", op = {5}, dst = { utils.mergeMap({x = base_x + margin * 0, y = ty, w = tw, h = th}, color_note) }},
      {id = "scratch", op = {5}, dst = { utils.mergeMap({x = base_x + margin * 1, y = ty, w = tw, h = th}, color_scratch) }},
      {id = "ln", op = {5}, dst = { utils.mergeMap({x = base_x + margin * 2, y = ty, w = tw, h = th}, color_ln) }},
      {id = "bss", op = {5}, dst = { utils.mergeMap({x = base_x + margin * 3, y = ty, w = tw, h = th, }, color_bss) }},
    }
  end)())
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
  utils.mergeArray(skin.destination, (function()
    local selector_w = 220
    local function h(selection_num) return 10 + 60 * selection_num end
    local t = {}
    utils.mergeArray(t, (function()
      local op = {21} base_x = 510 base_y = 70
      return {
        {id = "option_bg_2", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h, a = 200} }},
        {id = "option_play", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h} }},

        {id = "option_target", op = op, dst = { {x = 130, y = 320, w = 310, h = 430} }},

        {id = "option_random_1", op = op, blend = 2, dst = { {x = base_x, y = base_y, w = selector_w, h = h(10)} }},
        {id = "option_gauge", op = op, blend = 2, dst = { {x = base_x + 230 * 1, y = base_y + 60 * (10 - 6), w = selector_w, h = h(6)} }},
        -- beatoraja bug : option_hsfix don't work
        {id = "option_hsfix", op = op, blend = 2, dst = { {x = base_x + 230 * 2, y = base_y + 60 * (10 - 5), w = selector_w, h = h(5)} }},
        {id = "option_random_2", op = op, blend = 2, dst = { {x = base_x + 230 * 3, y = base_y, w = selector_w, h = h(10)} }},
        {id = "option_dp", op = op, blend = 2, dst = { {x = 850, y = 20, w = selector_w, h = h(4)} }},
      }
    end)())
    utils.mergeArray(t, (function()
      local op = {22} bottom_x = 510 bottom_y = 230 top_x = 630 top_y = 720
      return {
        {id = "option_bg_2", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h, a = 200} }},
        {id = "option_assist", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h} }},

        {id = "option_exjudge", op = op, blend = 2, dst = { {x = bottom_x, y = bottom_y, w = selector_w, h = h(2)} }},
        {id = "option_judgearea", op = op, blend = 2, dst = { {x = bottom_x + 230 * 1, y = bottom_y, w = selector_w, h = h(2)} }},
        {id = "option_marknote", op = op, blend = 2, dst = { {x = bottom_x + 230 * 2, y = bottom_y, w = selector_w, h = h(2)} }},
        {id = "option_nomine", op = op, blend = 2, dst = { {x = bottom_x + 230 * 3, y = bottom_y, w = selector_w, h = h(2)} }},
        {id = "option_constant", op = op, blend = 2, dst = { {x = top_x, y = top_y, w = selector_w, h = h(2)} }},
        {id = "option_legacy", op = op, blend = 2, dst = { {x = top_x + 230 * 1, y = top_y, w = selector_w, h = h(2)} }},
        {id = "option_bpmguide", op = op, blend = 2, dst = { {x = top_x + 230 * 2, y = top_y, w = selector_w, h = h(2)} }},
      }
    end)())
    utils.mergeArray(t, (function()
      local op = {23} x = 540
      local nscale = 0.5
      local nw = 48 * nscale nh = 64 * nscale
      return {
        {id = "option_bg_3", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h, a = 200} }},
        {id = "option_detailed", op = op, dst = { {x = 0, y = 0, w = header.w, h = header.h} }},

        {id = "option_bga", op = op, blend = 2, dst = { {x = x, y = 170, w = selector_w, h = h(3)} }},
        {id = "option_gas", op = op, blend = 2, dst = { {x = x, y = 540, w = selector_w, h = h(5)} }},

        {id = "option_duration", op = op, dst = { {x = 1048, y = 740, w = nw, h = nh} }},
        {id = "option_greennumber", op = op, dst = { {x = 1160, y = 740, w = nw, h = nh, r = 127, g = 204, b = 101} }},
        {id = "option_judgetiming", op = op, dst = { {x = 1110, y = 310, w = nw, h = nh} }},
      }
    end)())
    return t
  end)())
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

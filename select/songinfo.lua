local utils = require "utils"
local property = require "property"
local header = require "header"

local songText = {}
do
  do
    local font = "font_koruri"
    songText.text = {
      {id = "title", font = font, size = 90, align = 1, overflow = 1, shadowOffsetX = 4, shadowOffsetY = 4, ref = 10},
      {id = "subtitle", font = font, size = 48, align = 1, overflow = 1, shadowOffsetX = 2, shadowOffsetY = 2, ref = 11},
      {id = "artist", font = font, size = 32, align = 1, overflow = 1, ref = 16},
      --{id = "subartist", font = font, size = 44, align = 1, overflow = 1, ref = 15},
      {id = "genre", font = font, size = 32, align = 1, overflow = 1, ref = 13},
      {id = "directory", font = font, size = 32, align = 1, overflow = 1, ref = 1000},
      {id = "coursetitle1", font = font, size = 90, align = 1, overflow = 1, ref = 150},
      {id = "coursetitle2", font = font, size = 38, align = 1, overflow = 1, ref = 151},
      {id = "coursetitle3", font = font, size = 38, align = 1, overflow = 1, ref = 152},
      {id = "coursetitle4", font = font, size = 38, align = 1, overflow = 1, ref = 153},
      {id = "coursetitle5", font = font, size = 38, align = 1, overflow = 1, ref = 154}
    }
  end

  function songText.destination(base_x, base_y)
    local w = 1000 local h = 32
    local course_h = 40
    return {
      {id = "directory", filter = 1, dst = {
        {x = base_x - 40, y = base_y + 140, w = w, h = h}
      }},
      {id = "genre", filter = 1, dst = {
        {x = base_x, y = base_y + 92, w = w, h = h}
      }},
      {id = "title", filter = 1, dst = {
        {x = base_x, y = base_y, w = w, h = 76}
      }},
      {id = "subtitle", filter = 1, dst = {
        {x = base_x, y = base_y - 44, w = w, h = 48}
      }},
      {id = "artist", filter = 1, dst = {
        {x = base_x, y = base_y - 84, w = w, h = h}
      }},
      {id = "coursetitle1", filter = 1, dst = {
        {x = base_x, y = base_y - (course_h + 4) * 0, w = w, h = course_h}
      }},
      {id = "coursetitle2", filter = 1, dst = {
        {x = base_x, y = base_y - (course_h + 4) * 1, w = w, h = course_h}
      }},
      {id = "coursetitle3", filter = 1, dst = {
        {x = base_x, y = base_y - (course_h + 4) * 2, w = w, h = course_h}
      }},
      {id = "coursetitle4", filter = 1, dst = {
        {x = base_x, y = base_y - (course_h + 4) * 3, w = w, h = course_h}
      }},
      {id = "coursetitle5", filter = 1, dst = {
        {x = base_x, y = base_y - (course_h + 4) * 4, w = w, h = course_h}
      }}
    }
  end
end

local songParam = {}
do
  local text_w = 350
  local num_w = 48
  local h = 64

  do
    local src = "src_text"
    local x = 248 local w = text_w local h = h
    songParam.image = {
      {id = "bpm", src = src, x = x, y = h * 7, w = w, h = h},
      {id = "total", src = src, x = x, y = h * 8, w = w, h = h},
      {id = "time", src = src, x = x, y = h * 9, w = w, h = h},
    }
  end

  songParam.value = {
    utils.generateValue({id = "bpm_num", digit = 3, ref = 91}),
    utils.generateValue({id = "bpm_max_num", digit = 3, ref = 90}),
    utils.generateValue({id = "bpm_min_num", digit = 3, ref = 91}),
    utils.generateValue({id = "bpm_main_num", digit = 3, ref = 92}),

    utils.generateValue({id = "songtime_minute", digit = 2, ref = 1163}),
    utils.generateValueX({id = "songtime_second", digit = 2, ref = 1164}, 11),

    utils.generateValue({id = "total_num", digit = 4, ref = 368}),
  }

  function songParam.destination(base_x, base_y)
    local scale = 0.5
    local text_w = text_w * scale local num_w = num_w * scale local h = h * scale
    local bpm_y = base_y local songtime_y = base_y - 40 * 1 local total_y = base_y - 40 * 2
    return {
      {id = "bpm", op = {2}, filter = 1, dst = {
        {x = base_x, y = bpm_y, w = text_w, h = h}
      }},
      {id = "bpm_num", op = {2,176}, filter = 1, dst = {
        {x = base_x + 100, y = bpm_y, w = num_w, h = h}
      }},
      {id = "bpm_min_num", op = {2,177}, filter = 1, dst = {
        {x = base_x + 100, y = bpm_y, w = num_w, h = h}
      }},
      {id = "wavedash", op = {2,177}, filter = 1, dst = {
        {x = base_x + 158, y = bpm_y, w = num_w, h = h}
      }},
      {id = "bpm_max_num", op = {2,177}, filter = 1, dst = {
        {x = base_x + 180, y = bpm_y, w = num_w, h = h}
      }},
      {id = "bpm_main_num", op = {2,177}, filter = 1, dst = {
        {x = base_x + 260, y = bpm_y, w = num_w, h = h, r = 127, g = 204, b = 101}
      }},

      {id = "time", op = {2}, filter = 1, dst = {
        {x = base_x, y = songtime_y, w = text_w, h = h}
      }},
      {id = "songtime_minute", op = {2}, dst = {
        {x = base_x + 100, y = songtime_y, w = num_w, h = h}
      }},
      {id = "colon", op = {2}, dst = {
        {x = base_x + 100 + 40, y = songtime_y, w = num_w, h = h}
      }},
      {id = "songtime_second", op = {2}, dst = {
        {x = base_x + 100 + 60, y = songtime_y, w = num_w, h = h}
      }},

      {id = "total", op = {2}, filter = 1, dst = {
        {x = base_x, y = total_y, w = text_w, h = h}
      }},
      {id = "total_num", op = {2}, dst = {
        {x = base_x + 120, y = total_y, w = num_w, h = h}
      }}
    }
  end
end

local judge = {}
do
  local w = 350
  local h = 64

  do
    local src = "src_text"
    local x = 248
    judge.image = {
      {id = "veryhard_judge", src = src, x = x, y = h * 0, w = w, h = h},
      {id = "hard_judge", src = src, x = x, y = h * 1 , w = w, h = h},
      {id = "normal_judge", src = src, x = x, y = h * 2, w = w, h = h},
      {id = "easy_judge", src = src, x = x, y = h * 3, w = w, h = h},
      {id = "veryeasy_judge", src = src, x = x, y = h * 4, w = w, h = h},
    }
  end

  function judge.destination(x, y)
    local judgeInfos = {
      {name = "veryhard", op = 180, color = {r = 229, g = 153, b = 255}},
      {name = "hard",     op = 181, color = {r = 255, g = 153, b = 153}},
      {name = "normal",   op = 182, color = {r = 255, g = 255, b = 153}},
      {name = "easy",     op = 183, color = {r = 153, g = 255, b = 153}},
      {name = "veryeasy", op = 184, color = {r = 153, g = 255, b = 255}},
    }
    local scale = 0.5
    local dsts = {}
    for _, jdg in ipairs(judgeInfos) do
      table.insert(dsts, {id = jdg.name.."_judge", op = {5, jdg.op}, dst = {
        utils.merge_all({x = x, y = y, w = w * scale, h = h * scale}, jdg.color)
      }})
    end
    return dsts
  end
end

local keys = {}
do
  local w = 250
  local h = 64

  do
    local src = "src_text"
    local x = 0
    keys.image = {
      {id = "7keys", src = src, x = x, y = h * 0, w = w, h = h},
      {id = "5keys", src = src, x = x, y = h * 1 , w = w, h = h},
      {id = "14keys", src = src, x = x, y = h * 2, w = w, h = h},
      {id = "10keys", src = src, x = x, y = h * 3, w = w, h = h},
      {id = "9keys", src = src, x = x, y = h * 4, w = w, h = h},
      {id = "24keys", src = src, x = x, y = h * 5, w = w, h = h},
      {id = "48keys", src = src, x = x, y = h * 6, w = w, h = h}
    }
  end

  function keys.destination(x, y)
    local scale = 0.5
    local dst = {
      {x = x, y = y, w = w * scale, h = h * scale}
    }
    return {
      {id = "7keys", op = {160}, dst = dst},
      {id = "5keys", op = {161}, dst = dst},
      {id = "14keys", op = {162}, dst = dst},
      {id = "10keys", op = {163}, dst = dst},
      {id = "9keys", op = {164}, dst = dst},
      {id = "24keys", op = {1160}, dst = dst},
      {id = "48keys", op = {1161}, dst = dst},
    }
  end
end

local density = {}
do
  local text_w = 290
  local num_w = 48
  local h = 64

  do
    local src = "src_text"
    local x = 1700
    density.image = {
      {id = "peak", src = src, x = x, y = h * 0, w = text_w, h = h},
      {id = "end", src = src, x = x, y = h * 1 , w = text_w, h = h},
      {id = "average", src = src, x = x, y = h * 2, w = text_w, h = h}
    }
  end

  density.value = {
    utils.generateValue({id = "density_peak", digit = 2, ref = 360}),
    utils.generateValue({id = "density_end", digit = 2, ref = 362}),
    utils.generateValueX({id = "density_end_afterdot", digit = 2, ref = 363}, 11),
    utils.generateValue({id = "density_average", digit = 2, ref = 364}),
    utils.generateValueX({id = "density_average_afterdot", digit = 2, ref = 365}, 11),
  }

  function density.destination(base_x, y)
    local num_scale = 0.625
    local nw = num_w * num_scale local nh = h * num_scale
    local afterdot_scale = 0.7
    local aw = nw * afterdot_scale local ah = nw * afterdot_scale
    local text_scale = 0.3
    local tw = text_w * text_scale local th = h * text_scale
    local ty = y - 20
    local op = {2, 5}
    local peak_x = base_x local end_x = base_x + 100 local average_x = base_x + 240
    local peak_color = {r = 201, g = 101, b = 101}
    local end_color = {r = 204, g = 204, b = 101}
    local average_color = {r = 101, g = 178, b = 204}
    return {
      {id = "density_peak", op = op, filter = 1, dst = {
        utils.merge_all({x = peak_x, y = y, w = nw, h = nh}, peak_color)
      }},
      {id = "peak", op = op, dst = {
        utils.merge_all({x = peak_x + 4, y = ty, w = tw, h = th}, peak_color)
      }},

      {id = "density_end", op = op, filter = 1, dst = {
        utils.merge_all({x = end_x, y = y, w = nw, h = nh}, end_color)
      }},
      {id = "dot", op = op, filter = 1, dst = {
        utils.merge_all({x = end_x + 40, y = y, w = nw, h = nh}, end_color)
      }},
      {id = "density_end_afterdot", op = op, filter = 1, dst = {
        utils.merge_all({x = end_x + 60, y = y, w = aw, h = ah}, end_color)
      }},
      {id = "end", op = op, dst = {
        utils.merge_all({x = end_x + 38, y = ty, w = tw, h = th}, end_color)
      }},

      {id = "density_average", op = op, filter = 1, dst = {
        utils.merge_all({x = average_x, y = y, w = nw, h = nh}, average_color)
      }},
      {id = "dot", op = op, filter = 1, dst = {
        utils.merge_all({x = average_x + 40, y = y, w = nw, h = nh}, average_color)
      }},
      {id = "density_average_afterdot", filter = 1, op = op, dst = {
        utils.merge_all({x = average_x + 60, y = y, w = aw, h = ah}, average_color)
      }},
      {id = "average", op = op, dst = {
        utils.merge_all({x = average_x + 12, y = ty, w = tw, h = th}, average_color)
      }}
    }
  end
end

local notesGraph = {}
do
  notesGraph.judgegraph = {
    {id = "notesgraph", noGap = 1, type = 0}
  }

  notesGraph.bpmgraph = {
    {id = "bpmgraph"}
  }

  function notesGraph.destination(x, y)
    return {
      {id = "notesgraph", op = {2, 5}, dst = {
        {x = x, y = y, w = 500, h = 140}
      }},
      {id = "bpmgraph", op = {2, 5, 177}, dst = {
        {x = x, y = y, w = 500, h = 140}
      }},
    }
  end
end

local notesType = {}
do
  local text_w = 290
  local num_w = 48
  local h = 64

  do
    local src = "src_text"
    local x = 1700
    notesType.image = {
      {id = "note", src = src, x = x, y = h * 4, w = text_w, h = h},
      {id = "scratch", src = src, x = x, y = h * 5, w = text_w, h = h},
      {id = "ln", src = src, x = x, y = h * 6, w = text_w, h = h},
      {id = "bss", src = src, x = x, y = h * 7, w = text_w, h = h}
    }
  end

  notesType.value = {
    utils.generateValue({id = "note_num", digit = 4, ref = 350}),
    utils.generateValue({id = "ln_num", digit = 4, ref = 351}),
    utils.generateValue({id = "scratch_num", digit = 4, ref = 352}),
    utils.generateValue({id = "bss_num", digit = 4, ref = 353}),
    --utils.generateValue({id = "mine_num", digit = 4, ref = 354}),
  }

  function notesType.destination(base_x, base_y)
    local num_y = base_y - 40
    local num_scale = 0.5
    local nw = num_w * num_scale local nh = h * num_scale
    local text_scale = 0.3
    local tw = text_w * text_scale local th = h * text_scale
    local ty = num_y - 20
    local margin = 100
    local op = {2, 5}

    local dsts = {}
    local nts = {
      {name = "note",    color = {r = 255, g = 255, b = 255}},
      {name = "scratch", color = {r = 204, g = 101, b = 101}},
      {name = "ln",      color = {r = 101, g = 153, b = 204}},
      {name = "bss",     color = {r = 204, g = 127, b = 101}},
    }
    for i, nt in ipairs(nts) do
      utils.append_all(dsts, {
        {id = nt.name.."_num", op = op, dst = {
          utils.merge_all({x = base_x + margin * (i - 1), y = num_y, w = nw, h = nh}, nt.color)
        }},
        {id = nt.name, op = op, dst = {
          utils.merge_all({x = base_x + margin * (i - 1), y = ty, w = tw, h = th}, nt.color)
        }}
      })
    end
    return dsts
  end
end

local irInfo = {}
do
  local w = 48
  local h = 64

  irInfo.value = {
    utils.generateValue({id = "ir_rank_num", digit = 4, ref = 179}),
    utils.generateValue({id = "ir_totalplayer_num", digit = 4, align = 1, ref = 180}),
    utils.generateValue({id = "ir_clearrate_num", digit = 3, ref = 227}),
    utils.generateValue({id = "ir_clearrate_num_afterdot", digit = 1, ref = 241}),
  }

  do
    local font = "font_genshingothic"
    irInfo.text = {
      {id = "irinfo_slash", font = font, size = h, constantText = "/"},
      {id = "irinfo_dot", font = font, size = h, constantText = "."},
      {id = "irinfo_ranking", font = font, size = h, constantText = "IR RANKING"},
      {id = "irinfo_clearrate", font = font, size = h, constantText = "CLEAR RATE"},
    }
  end

  function irInfo.destination(x, y)
    local scale = 0.4
    local w = w * scale local h = h * scale
    local op = {2, 5, 51}
    return {
      {id = "irinfo_ranking", op = op, dst = {
        {x = x + 20, y = y - h * 0.7 - 6, w = 1, h = h * 0.7}
      }},
      {id = "ir_rank_num", op = op, dst = {
        {x = x, y = y, w = w, h = h}
      }},
      {id = "irinfo_slash", op = op, dst = {
        {x = x + 64, y = y - 4, w = 1, h = h}
      }},
      {id = "ir_totalplayer_num", op = op, dst = {
        {x = x + 74, y = y, w = w, h = h}
      }},

      {id = "irinfo_clearrate", op = op, dst = {
        {x = x + 182, y = y - h * 0.7 - 6, w = 1, h = h * 0.7}
      }},
      {id = "ir_clearrate_num", op = op, dst = {
        {x = x + 186, y = y, w = w, h = h}
      }},
      {id = "irinfo_dot", op = op, dst = {
        {x = x + 235, y = y - 4, w = 1, h = h}
      }},
      {id = "ir_clearrate_num_afterdot", op = op, dst = {
        {x = x + 240, y = y, w = w, h = h}
      }}
    }
  end
end

local courseConstraint = {}
do
  local w = 500
  local h = 64

  courseConstraint.source = {
    {id = "src_cource", path = "image/course.png"}
  }

  do
    local src = "src_cource"
    local function img(id, num)
      return {id = id, src = src, x = 0, y = h * num, w = w, h = h}
    end
    courseConstraint.image = {
      img("const_class", 0),
      img("const_mirror", 1),
      img("const_random", 2),
      img("const_nospeed", 3),
      img("const_nogood", 4),
      img("const_nogreat", 5),
      img("const_gauge_lr2", 6),
      img("const_gauge_5keys", 7),
      img("const_gauge_7keys", 8),
      img("const_gauge_9keys", 9),
      img("const_gauge_24keys", 10),
      img("const_ln", 11),
      img("const_cn", 12),
      img("const_hcn", 13)
    }
  end

  function courseConstraint.destination(base_x, y)
    local scale = 0.5
    local w = w * scale local h = h * scale

    local consCategory = {
      {
        {name = "class", op = 1002},
        {name = "mirror", op = 1003},
        {name = "random", op = 1004}
      },
      {
        {name = "nospeed", op = 1005},
        {name = "nogood", op = 1006},
        {name = "nogreat", op = 1007}
      },
      {
        {name = "gauge_lr2", op = 1010},
        {name = "gauge_5keys", op = 1011},
        {name = "gauge_7keys", op = 1012},
        {name = "gauge_9keys", op = 1013},
        {name = "gauge_24keys", op = 1014}
      },
      {
        {name = "ln", op = 1015},
        {name = "cn", op = 1016},
        {name = "hcn", op = 1017},
      },
    }

    local dsts = {}
    for i, cons in ipairs(consCategory) do
      for _, con in ipairs(cons) do
        table.insert(dsts, {id = "const_"..con.name, op = {con.op}, dst = {
          {x = base_x, y = y - h * (i - 1), w = w, h = h}
        }})
      end
    end
    return dsts
  end
end

local folderSongs = {}
do
  local w = 526
  local h = 64

  folderSongs.image = {
    {id = "songs", src = "src_infotext", x = 0, y = h * 6, w = w, h = h},
  }

  folderSongs.value = {
    utils.generateValue({id = "songs_num", digit = 5, ref = 300}),
  }

  function folderSongs.destination(base_x, y)
    local scale = 0.5
    local op = {1}
    local h = h * scale
    return {
      {id = "songs_num", op = op, dst = {
        {x = base_x, y = y, w = 48 * scale, h = h}
      }},
      {id = "songs", op = op, dst = {
        {x = base_x + 100, y = y, w = w * scale, h = h}
      }},
    }
  end
end

local totalInfo = {}
do
  local text_w = 526
  local num_w = 48
  local h = 64

  do
    local src = "src_infotext"
    local x = 0 local y = 0 local w = text_w
    totalInfo.image = {
      {id = "total_playnotes", src = src, x = x, y = y + h * 1, w = w, h = h},
      {id = "total_playcount", src = src, x = x, y = y + h * 2, w = w, h = h},
      {id = "total_clearcount", src = src, x = x, y = y + h * 3, w = w, h = h},
      {id = "total_playtime", src = src, x = x, y = y + h * 4, w = w, h = h},
    }
  end

  totalInfo.value = {
    utils.generateValue({id = "total_playtime_hour_num", digit = 4, ref = 17}),
    utils.generateValueX({id = "total_playtime_minute_num", digit = 2, ref = 18}, 11),
    utils.generateValueX({id = "total_playtime_second_num", digit = 2, ref = 19}, 11),
    utils.generateValue({id = "total_playnotes_num", digit = 10, ref = 333}),
    utils.generateValue({id = "total_playcount_num", digit = 4, ref = 30}),
    utils.generateValue({id = "total_clearcount_num", digit = 4, ref = 31}),
  }

  function totalInfo.destination(base_x, base_y)
    local scale = 0.5 local op = {1}
    local w = text_w * scale local h = h * scale
    local nx = base_x + w + 20 local nw = num_w * scale
    return {
      {id = "total_playtime", op = op, dst = {
        {x = base_x, y = base_y - h * 0, w = w, h = h}
      }},
      {id = "total_playnotes", op = op, dst = {
        {x = base_x, y = base_y - h * 1, w = w, h = h}
      }},
      {id = "total_playcount", op = op, dst = {
        {x = base_x, y = base_y - h * 2, w = w, h = h}
      }},
      {id = "total_clearcount", op = op, dst = {
        {x = base_x, y = base_y - h * 3, w = w, h = h}
      }},

      {id = "total_playtime_hour_num", op = op, dst = {
        {x = nx, y = base_y - h * 0, w = nw, h = h}
      }},
      {id = "colon", op = op, dst = {
        {x = nx + 15 + 60 * 1, y = base_y - h * 0, w = nw, h = h}
      }},
      {id = "total_playtime_minute_num", op = op, dst = {
        {x = nx + 35 + 60 * 1, y = base_y - h * 0, w = nw, h = h}
      }},
      {id = "colon", op = op, dst = {
        {x = nx + 15 + 60 * 2, y = base_y - h * 0, w = nw, h = h}
      }},
      {id = "total_playtime_second_num", op = op, dst = {
        {x = nx + 35 + 60 * 2, y = base_y - h * 0, w = nw, h = h}
      }},
      {id = "total_playnotes_num", op = op, dst = {
        {x = nx, y = base_y - h * 1, w = nw, h = h}
      }},
      {id = "total_playcount_num", op = op, dst = {
        {x = nx, y = base_y - h * 2, w = nw, h = h}
      }},
      {id = "total_clearcount_num", op = op, dst = {
        {x = nx, y = base_y - h * 3, w = nw, h = h}
      }},
    }
  end
end

local banner = {}
function banner.destination()
  return {
    {id = -102, stretch = 1, dst = {
      {x = 60, y = 940, w = 300, h = 80}
    }}
  }
end

local stagefile = {}
do
  stagefile.image = {
    {id = "stagefile_darkness", src = "src_white", x = 0, y = 0, w = -1, h = -1}
  }

  function stagefile.destination()
    if property.isStagefileFull() or (property.isStagefileRandom() and math.random(2) == 1) then
      return {
        {id = -100, stretch = 4, filter = 1, dst = {
          {x = 0, y = 0, w = header.w, h = header.h}
        }},
        {id = "stagefile_darkness", dst = {
          {x = 0, y = 0, w = header.w, h = header.h, r = 0, g = 0, b = 0, a = property.backgroundDarkness()}
        }}
      }
    else
      return {
        {id = -100, stretch = 1, filter = 1, dst = {
          {x = 50, y = 540, w = 400, h = 300}
        }}
      }
    end
  end
end

local skin = {}
skin.destination = {}

local parts = {
  songText,
  songParam,
  judge,
  keys,
  density,
  notesGraph,
  notesType,
  irInfo,
  courseConstraint,
  folderSongs,
  totalInfo,
  banner,
  stagefile
}
for _, part in ipairs(parts) do
  utils.merge_all_whitout_function(skin, part)
end

local destinations = {
  banner.destination(),
  stagefile.destination(),
  songText.destination(540, 706),
  songParam.destination(480, 560),
  judge.destination(846, 560),
  keys.destination(850, 520),
  density.destination(550, 412),
  notesGraph.destination(550, 230),
  notesType.destination(550, 230),
  irInfo.destination(550, 120),
  courseConstraint.destination(550, 400),

  folderSongs.destination(400, 640),
  totalInfo.destination(300, 400)
}
for _, destination in ipairs(destinations) do
  utils.append_all(skin.destination, destination)
end

return skin
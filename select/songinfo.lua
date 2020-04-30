local utils = require "utils"
local property = require "property"
local header = require "header"
local Object = require "object"
local Objects = require "objects"

local SongText = Object.new()
function SongText.text()
  return {
    {id = "title", font = 0, size = 90, align = 1, overflow = 1, shadowOffsetX = 4, shadowOffsetY = 4, ref = 10},
    {id = "subtitle", font = 0, size = 48, align = 1, overflow = 1, shadowOffsetX = 2, shadowOffsetY = 2, ref = 11},
    {id = "artist", font = 0, size = 32, align = 1, overflow = 1, ref = 16},
    --{id = "subartist", font = 0, size = 44, align = 1, overflow = 1, ref = 15},
    {id = "genre", font = 0, size = 32, align = 1, overflow = 1, ref = 13},
    {id = "directory", font = 0, size = 32, align = 1, overflow = 1, ref = 1000},
    {id = "coursetitle1", font = 0, size = 90, align = 1, overflow = 1, ref = 150},
    {id = "coursetitle2", font = 0, size = 38, align = 1, overflow = 1, ref = 151},
    {id = "coursetitle3", font = 0, size = 38, align = 1, overflow = 1, ref = 152},
    {id = "coursetitle4", font = 0, size = 38, align = 1, overflow = 1, ref = 153},
    {id = "coursetitle5", font = 0, size = 38, align = 1, overflow = 1, ref = 154}
  }
end
function SongText.destination(base_x, base_y)
  local w = 1000 local h = 32
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
end

local SongParam = Object.new()
SongParam.text_w = 350
SongParam.num_w = 48
SongParam.h = 64
function SongParam.image()
  local src = 4 local x = 248 local w = SongParam.text_w local h = SongParam.h
  return {
    {id = "bpm", src = src, x = x, y = h * 7, w = w, h = h},
    {id = "total", src = src, x = x, y = h * 8, w = w, h = h},
    {id = "time", src = src, x = x, y = h * 9, w = w, h = h},
  }
end
function SongParam.value()
  return {
    utils.generateValue({id = "bpm_num", digit = 3, ref = 91}),
    utils.generateValue({id = "bpm_max_num", digit = 3, ref = 90}),
    utils.generateValue({id = "bpm_min_num", digit = 3, ref = 91}),
    utils.generateValue({id = "bpm_main_num", digit = 3, ref = 92}),

    utils.generateValue({id = "songtime_minute", digit = 2, ref = 1163}),
    utils.generateValueX({id = "songtime_second", digit = 2, ref = 1164}, 11),

    utils.generateValue({id = "total_num", digit = 3, ref = 368}),
  }
end
function SongParam.destination(base_x, base_y)
  local scale = 0.5
  local text_w = SongParam.text_w * scale local num_w = SongParam.num_w * scale local h = SongParam.h * scale
  local bpm_y = base_y local songtime_y = base_y - 40 * 1 local total_y = base_y - 40 * 2
  return {
    {id = "bpm", op = {2}, filter = 1, dst = { {x = base_x, y = bpm_y, w = text_w, h = h} }},
    {id = "bpm_num", op = {2,176}, filter = 1, dst = { {x = base_x + 100, y = bpm_y, w = num_w, h = h} }},
    {id = "bpm_min_num", op = {2,177}, filter = 1, dst = { {x = base_x + 100, y = bpm_y, w = num_w, h = h} }},
    {id = "wavedash", op = {2,177}, filter = 1, dst = { {x = base_x + 158, y = bpm_y, w = num_w, h = h} }},
    {id = "bpm_max_num", op = {2,177}, filter = 1, dst = { {x = base_x + 180, y = bpm_y, w = num_w, h = h} }},
    {id = "bpm_main_num", op = {2,177}, filter = 1, dst = { {x = base_x + 260, y = bpm_y, w = num_w, h = h, r = 127, g = 204, b = 101} }},

    {id = "time", op = {2}, filter = 1, dst = { {x = base_x, y = songtime_y, w = text_w, h = h} }},
    {id = "songtime_minute", op = {2}, dst = { {x = base_x + 100, y = songtime_y, w = num_w, h = h} }},
    {id = "colon", op = {2}, dst = { {x = base_x + 100 + 40, y = songtime_y, w = num_w, h = h} }},
    {id = "songtime_second", op = {2}, dst = { {x = base_x + 100 + 60, y = songtime_y, w = num_w, h = h} }},

    {id = "total", op = {2}, filter = 1, dst = { {x = base_x, y = total_y, w = text_w, h = h} }},
    {id = "total_num", op = {2}, dst = { {x = base_x + 120, y = total_y, w = num_w, h = h} }}
  }
end

local Judge = Object.new()
Judge.w = 350
Judge.h = 64
function Judge.image()
  local src = 4 local x = 248 local w = Judge.w local h = Judge.h
  return {
    {id = "veryhard_judge", src = src, x = x, y = h * 0, w = w, h = h},
    {id = "hard_judge", src = src, x = x, y = h * 1 , w = w, h = h},
    {id = "normal_judge", src = src, x = x, y = h * 2, w = w, h = h},
    {id = "easy_judge", src = src, x = x, y = h * 3, w = w, h = h},
    {id = "veryeasy_judge", src = src, x = x, y = h * 4, w = w, h = h},
  }
end
function Judge.destination(x, y)
  local scale = 0.5
  local dst = {x = x, y = y, w = Judge.w * scale, h = Judge.h * scale}
  local veryhard_color = {r = 229, g = 153, b = 255}
  local hard_color = {r = 255, g = 153, b = 153}
  local normal_color = {r = 255, g = 255, b = 153}
  local easy_color = {r = 153, g = 255, b = 153}
  local veryeasy_color = {r = 153, g = 255, b = 255}
  return {
    {id = "veryhard_judge", op = {5, 180}, dst = { utils.mergeMap(veryhard_color, dst) }},
    {id = "hard_judge", op = {5, 181}, dst = { utils.mergeMap(hard_color, dst) }},
    {id = "normal_judge", op = {5, 182}, dst = { utils.mergeMap(normal_color, dst) }},
    {id = "easy_judge", op = {5, 183}, dst = { utils.mergeMap(easy_color, dst) }},
    {id = "veryeasy_judge", op = {5, 184}, dst = { utils.mergeMap(veryeasy_color, dst) }}
  }
end

local Keys = Object.new()
Keys.w = 250
Keys.h = 64
function Keys.image()
  local src = 4 local x = 0 local w = Keys.w local h = Keys.h
  return {
    {id = "7keys", src = src, x = x, y = h * 0, w = w, h = h},
    {id = "5keys", src = src, x = x, y = h * 1 , w = w, h = h},
    {id = "14keys", src = src, x = x, y = h * 2, w = w, h = h},
    {id = "10keys", src = src, x = x, y = h * 3, w = w, h = h},
    {id = "9keys", src = src, x = x, y = h * 4, w = w, h = h},
    {id = "24keys", src = src, x = x, y = h * 5, w = w, h = h},
    {id = "48keys", src = src, x = x, y = h * 6, w = w, h = h}
  }
end
function Keys.destination(x, y)
  local scale = 0.5
  local dst = { { x = x, y = y, w = Keys.w * scale, h = Keys.h * scale} }
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

local Density = Object.new()
Density.text_w = 290
Density.num_w = 48
Density.h = 64
function Density.image()
  local src = 4 local x = 1700 local w = Density.text_w local h = Density.h
  return {
    {id = "peak", src = src, x = x, y = h * 0, w = w, h = h},
    {id = "end", src = src, x = x, y = h * 1 , w = w, h = h},
    {id = "average", src = src, x = x, y = h * 2, w = w, h = h}
  }
end
function Density.value()
  return {
    utils.generateValue({id = "density_peak", digit = 2, ref = 360}),
    utils.generateValue({id = "density_end", digit = 2, ref = 362}),
    utils.generateValueX({id = "density_end_afterdot", digit = 2, ref = 363}, 11),
    utils.generateValue({id = "density_average", digit = 2, ref = 364}),
    utils.generateValueX({id = "density_average_afterdot", digit = 2, ref = 365}, 11),
  }
end
function Density.destination(base_x, y)
  local num_scale = 0.625
  local nw = Density.num_w * num_scale local nh = Density.h * num_scale
  local afterdot_scale = 0.7
  local aw = nw * afterdot_scale local ah = nw * afterdot_scale
  local text_scale = 0.3
  local tw = Density.text_w * text_scale local th = Density.h * text_scale
  local ty = y - 20
  local op = {2, 5}
  local peak_x = base_x local end_x = base_x + 100 local average_x = base_x + 240
  local peak_color = {r = 201, g = 101, b = 101}
  local end_color = {r = 204, g = 204, b = 101}
  local average_color = {r = 101, g = 178, b = 204}
  return {
    {id = "density_peak", op = op, filter = 1, dst = { utils.mergeMap({x = peak_x, y = y, w = nw, h = nh}, peak_color) }},
    {id = "density_end", op = op, filter = 1, dst = { utils.mergeMap({x = end_x, y = y, w = nw, h = nh}, end_color) }},
    {id = "dot", op = op, filter = 1, dst = { utils.mergeMap({x = end_x + 40, y = y, w = nw, h = nh}, end_color) }},
    {id = "density_end_afterdot", op = op, filter = 1, dst = { utils.mergeMap({x = end_x + 60, y = y, w = aw, h = ah}, end_color) }},
    {id = "density_average", op = op, filter = 1, dst = { utils.mergeMap({x = average_x, y = y, w = nw, h = nh}, average_color) }},
    {id = "dot", op = op, filter = 1, dst = { utils.mergeMap({x = average_x + 40, y = y, w = nw, h = nh}, average_color) }},
    {id = "density_average_afterdot", filter = 1, op = op, dst = { utils.mergeMap({x = average_x + 60, y = y, w = aw, h = ah}, average_color) }},

    {id = "peak", op = op, dst = { utils.mergeMap({x = peak_x + 4, y = ty, w = tw, h = th}, peak_color) }},
    {id = "end", op = op, dst = { utils.mergeMap({x = end_x + 38, y = ty, w = tw, h = th}, end_color) }},
    {id = "average", op = op, dst = { utils.mergeMap({x = average_x + 12, y = ty, w = tw, h = th}, average_color) }}
  }
end

local NotesGraph = Object.new()
function NotesGraph.judgegraph()
  return {
    {id = "notesgraph", noGap = 1, type = 0}
  }
end
function NotesGraph.bpmgraph()
  return {
    {id = "bpmgraph"}
  }
end
function NotesGraph.destination(x, y)
  return {
    {id = "notesgraph", op = {2, 5}, dst = { {x = x, y = y, w = 500, h = 140} }},
    {id = "bpmgraph", op = {2, 5, 177}, dst = { {x = x, y = y, w = 500, h = 140} }},
  }
end

local NotesType = Object.new()
NotesType.text_w = 290
NotesType.num_w = 48
NotesType.h = 64
function NotesType.image()
  local src = 4 local x = 1700 local w = NotesType.text_w local h = NotesType.h
  return {
    {id = "note", src = src, x = x, y = h * 4, w = w, h = h},
    {id = "scratch", src = src, x = x, y = h * 5, w = w, h = h},
    {id = "ln", src = src, x = x, y = h * 6, w = w, h = h},
    {id = "bss", src = src, x = x, y = h * 7, w = w, h = h}
  }
end
function NotesType.value()
  return {
    utils.generateValue({id = "note_num", digit = 4, ref = 350}),
    utils.generateValue({id = "ln_num", digit = 4, ref = 351}),
    utils.generateValue({id = "scratch_num", digit = 4, ref = 352}),
    utils.generateValue({id = "bss_num", digit = 4, ref = 353}),
    --utils.generateValue({id = "mine_num", digit = 4, ref = 354}),
  }
end
function NotesType.destination(base_x, base_y)
  local num_y = base_y - 40
  local num_scale = 0.5
  local nw = NotesType.num_w * num_scale local nh = NotesType.h * num_scale
  local text_scale = 0.3
  local tw = NotesType.text_w * text_scale local th = NotesType.h * text_scale
  local ty = num_y - 20
  local margin = 100
  local op = {2, 5}
  local color_note = {r = 255, g = 255, b = 255}
  local color_scratch = {r = 204, g = 101, b = 101}
  local color_ln = {r = 101, g = 153, b = 204}
  local color_bss = {r = 204, g = 127, b = 101}
  return {
    {id = "note_num", op = op, dst = { utils.mergeMap({x = base_x + margin * 0, y = num_y, w = nw, h = nh}, color_note) }},
    {id = "scratch_num", op = op, dst = { utils.mergeMap({x = base_x + margin * 1, y = num_y, w = nw, h = nh}, color_scratch) }},
    {id = "ln_num", op = op, dst = { utils.mergeMap({x = base_x + margin * 2, y = num_y, w = nw, h = nh}, color_ln) }},
    {id = "bss_num", op = op, dst = { utils.mergeMap({x = base_x + margin * 3, y = num_y, w = nw, h = nh, }, color_bss) }},
    --{id = "mine_num", op = op, dst = { {x = base_x + 400, y = num_y, w = w, h = h} }}

    {id = "note", op = op, dst = { utils.mergeMap({x = base_x + margin * 0, y = ty, w = tw, h = th}, color_note) }},
    {id = "scratch", op = op, dst = { utils.mergeMap({x = base_x + margin * 1, y = ty, w = tw, h = th}, color_scratch) }},
    {id = "ln", op = op, dst = { utils.mergeMap({x = base_x + margin * 2, y = ty, w = tw, h = th}, color_ln) }},
    {id = "bss", op = op, dst = { utils.mergeMap({x = base_x + margin * 3, y = ty, w = tw, h = th, }, color_bss) }},
  }
end

local IRInfo = Object.new()
IRInfo.w = 48
IRInfo.h = 64
function IRInfo.value()
  return {
    utils.generateValue({id = "ir_rank_num", digit = 4, ref = 179}),
    utils.generateValue({id = "ir_totalplayer_num", digit = 4, align = 1, ref = 180}),
    utils.generateValue({id = "ir_clearrate_num", digit = 3, ref = 227}),
    utils.generateValue({id = "ir_clearrate_num_afterdot", digit = 1, ref = 241}),
  }
end
function IRInfo.text()
  return {
    {id = "irinfo_slash", font = 1, size = IRInfo.h, constantText = "/"},
    {id = "irinfo_dot", font = 1, size = IRInfo.h, constantText = "."},
    {id = "irinfo_ranking", font = 1, size = IRInfo.h, constantText = "IR RANKING"},
    {id = "irinfo_clearrate", font = 1, size = IRInfo.h, constantText = "CLEAR RATE"},
  }
end
function IRInfo.destination(x, y)
  local scale = 0.4
  local w = IRInfo.w * scale local h = IRInfo.h * scale
  local op = {2, 5, 51}
  return {
    {id = "irinfo_ranking", op = op, dst = { {x = x + 20, y = y - h * 0.7 - 6, w = 1, h = h * 0.7} }},
    {id = "ir_rank_num", op = op, dst = { {x = x, y = y, w = w, h = h} }},
    {id = "irinfo_slash", op = op, dst = { {x = x + 64, y = y - 4, w = 1, h = h} }},
    {id = "ir_totalplayer_num", op = op, dst = { {x = x + 74, y = y, w = w, h = h} }},

    {id = "irinfo_clearrate", op = op, dst = { {x = x + 182, y = y - h * 0.7 - 6, w = 1, h = h * 0.7} }},
    {id = "ir_clearrate_num", op = op, dst = { {x = x + 186, y = y, w = w, h = h} }},
    {id = "irinfo_dot", op = op, dst = { {x = x + 235, y = y - 4, w = 1, h = h} }},
    {id = "ir_clearrate_num_afterdot", op = op, dst = { {x = x + 240, y = y, w = w, h = h} }}
  }
end

local CourseConstraint = Object.new()
CourseConstraint.w = 500
CourseConstraint.h = 64
function CourseConstraint.image()
  local src = 16 local x = 0 local y = 0 local w = CourseConstraint.w local h = CourseConstraint.h
  local function img(id, num)
    return {id = id, src = src, x = x, y = y + h * num, w = w, h = h}
  end
  return {
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
function CourseConstraint.destination(base_x, y)
  local scale = 0.5
  local w = CourseConstraint.w * scale local h = CourseConstraint.h * scale
  return {
    {id = "const_class", op = {1002}, dst = { {x = base_x, y = y, w = w, h = h} }},
    {id = "const_mirror", op = {1003}, dst = { {x = base_x, y = y, w = w, h = h} }},
    {id = "const_random", op = {1004}, dst = { {x = base_x, y = y, w = w, h = h} }},

    {id = "const_nospeed", op = {1005}, dst = { {x = base_x, y = y - h, w = w, h = h} }},
    {id = "const_nogood", op = {1006}, dst = { {x = base_x, y = y - h, w = w, h = h} }},
    {id = "const_nogreat", op = {1007}, dst = { {x = base_x, y = y - h, w = w, h = h} }},

    {id = "const_gauge_lr2", op = {1010}, dst = { {x = base_x, y = y - h * 2, w = w, h = h} }},
    {id = "const_gauge_5keys", op = {1011}, dst = { {x = base_x, y = y - h * 2, w = w, h = h} }},
    {id = "const_gauge_7keys", op = {1012}, dst = { {x = base_x, y = y - h * 2, w = w, h = h} }},
    {id = "const_gauge_9keys", op = {1013}, dst = { {x = base_x, y = y - h * 2, w = w, h = h} }},
    {id = "const_gauge_24keys", op = {1014}, dst = { {x = base_x, y = y - h * 2, w = w, h = h} }},

    {id = "const_ln", op = {1015}, dst = { {x = base_x, y = y - h * 3, w = w, h = h} }},
    {id = "const_cn", op = {1016}, dst = { {x = base_x, y = y - h * 3, w = w, h = h} }},
    {id = "const_hcn", op = {1017}, dst = { {x = base_x, y = y - h * 3, w = w, h = h} }},
  }
end

local FolderSongs = Object.new()
function FolderSongs.image()
  local src = 10 local x = 0 local y = 0 local w = 526 local h = 64
  return {
    {id = "songs", src = src, x = x, y = y + h * 6, w = w, h = h},
  }
end
function FolderSongs.value()
  return {
    utils.generateValue({id = "songs_num", digit = 5, ref = 300}),
  }
end
function FolderSongs.destination(base_x, y)
  local scale = 0.5 local op = {1}
  local h = 64 * scale
  return {
    {id = "songs_num", op = op, dst = { {x = base_x, y = y, w = 48 * scale, h = h} }},
    {id = "songs", op = op, dst = { {x = base_x + 100, y = y, w = 526 * scale, h = h} }},
  }
end

local TotalInfo = Object.new()
TotalInfo.text_w = 526
TotalInfo.num_w = 48
TotalInfo.h = 64
function TotalInfo.image()
  local src = 10 local x = 0 local y = 0 local w = TotalInfo.text_w local h = TotalInfo.h
  return {
    {id = "total_playnotes", src = src, x = x, y = y + h * 1, w = w, h = h},
    {id = "total_playcount", src = src, x = x, y = y + h * 2, w = w, h = h},
    {id = "total_clearcount", src = src, x = x, y = y + h * 3, w = w, h = h},
    {id = "total_playtime", src = src, x = x, y = y + h * 4, w = w, h = h},
  }
end
function TotalInfo.value()
  return {
    utils.generateValue({id = "total_playtime_hour_num", digit = 4, ref = 17}),
    utils.generateValueX({id = "total_playtime_minute_num", digit = 2, ref = 18}, 11),
    utils.generateValueX({id = "total_playtime_second_num", digit = 2, ref = 19}, 11),
    utils.generateValue({id = "total_playnotes_num", digit = 10, ref = 333}),
    utils.generateValue({id = "total_playcount_num", digit = 4, ref = 30}),
    utils.generateValue({id = "total_clearcount_num", digit = 4, ref = 31}),
  }
end
function TotalInfo.destination(base_x, base_y)
  local scale = 0.5 local op = {1}
  local w = TotalInfo.text_w * scale local h = TotalInfo.h * scale
  local nx = base_x + w + 20 local nw = TotalInfo.num_w * scale
  return {
    {id = "total_playtime", op = op, dst = { {x = base_x, y = base_y - h * 0, w = w, h = h} }},
    {id = "total_playnotes", op = op, dst = { {x = base_x, y = base_y - h * 1, w = w, h = h} }},
    {id = "total_playcount", op = op, dst = { {x = base_x, y = base_y - h * 2, w = w, h = h} }},
    {id = "total_clearcount", op = op, dst = { {x = base_x, y = base_y - h * 3, w = w, h = h} }},

    {id = "total_playtime_hour_num", op = op, dst = { {x = nx, y = base_y - h * 0, w = nw, h = h} }},
    {id = "colon", op = op, dst = { {x = nx + 15 + 60 * 1, y = base_y - h * 0, w = nw, h = h} }},
    {id = "total_playtime_minute_num", op = op, dst = { {x = nx + 35 + 60 * 1, y = base_y - h * 0, w = nw, h = h} }},
    {id = "colon", op = op, dst = { {x = nx + 15 + 60 * 2, y = base_y - h * 0, w = nw, h = h} }},
    {id = "total_playtime_second_num", op = op, dst = { {x = nx + 35 + 60 * 2, y = base_y - h * 0, w = nw, h = h} }},
    {id = "total_playnotes_num", op = op, dst = { {x = nx, y = base_y - h * 1, w = nw, h = h} }},
    {id = "total_playcount_num", op = op, dst = { {x = nx, y = base_y - h * 2, w = nw, h = h} }},
    {id = "total_clearcount_num", op = op, dst = { {x = nx, y = base_y - h * 3, w = nw, h = h} }},
  }
end

local SongInfo = Objects.new({SongText, SongParam, Judge, Keys, Density, NotesGraph, NotesType, IRInfo, CourseConstraint, FolderSongs, TotalInfo})
SongInfo.songtext = SongText.new()
SongInfo.songparam = SongParam.new()
SongInfo.judge = Judge.new()
SongInfo.keys = Keys.new()
SongInfo.density = Density.new()
SongInfo.notesgraph = NotesGraph.new()
SongInfo.notestype = NotesType.new()
SongInfo.irinfo = IRInfo.new()
SongInfo.courseconstraint = CourseConstraint.new()
SongInfo.foldersongs = FolderSongs.new()
SongInfo.totalinfo = TotalInfo.new()
SongInfo.superimage = SongInfo:image()
function SongInfo.image()
  local t = SongInfo.superimage
  table.insert(t, {id = "stagefile_darkness", src = 3, x = 0, y = 0, w = -1, h = -1})
  return t
end
function SongInfo.judgegraph()
  local t = {}
  utils.mergeArray(t, SongInfo.notesgraph.judgegraph())
  return t
end
function SongInfo.bpmgraph()
  local t = {}
  utils.mergeArray(t, SongInfo.notesgraph.bpmgraph())
  return t
end
function SongInfo.destination()
  local t = {
    -- banner
    {id = -102, stretch = 1, dst = { {x = 60, y = 940, w = 300, h = 80} }},
  }
  -- stagefile
  utils.mergeArray(t, (function()
    if property.isStagefileFull() or (property.isStagefileRandom() and math.random(2) == 1) then
      return {
        {id = -100, stretch = 4, filter = 1, dst = { {x = 0, y = 0, w = header.w, h = header.h} }},
        {id = "stagefile_darkness", dst = { {x = 0, y = 0, w = header.w, h = header.h, r = 0, g = 0, b = 0, a = property.backgroundDarkness()} }}
      }
    else
      return {
        {id = -100, stretch = 1, filter = 1, dst = { {x = 50, y = 540, w = 400, h = 300} }}
      }
    end
  end)())
  utils.mergeArray(t, SongInfo.songtext.destination(540, 706))
  utils.mergeArray(t, SongInfo.songparam.destination(480, 560))
  utils.mergeArray(t, SongInfo.judge.destination(846, 560))
  utils.mergeArray(t, SongInfo.keys.destination(850, 520))
  utils.mergeArray(t, SongInfo.density.destination(550, 412))
  utils.mergeArray(t, SongInfo.notesgraph.destination(550, 230))
  utils.mergeArray(t, SongInfo.notestype.destination(550, 230))
  utils.mergeArray(t, SongInfo.irinfo.destination(550, 120))
  utils.mergeArray(t, SongInfo.courseconstraint.destination(550, 400))

  utils.mergeArray(t, SongInfo.foldersongs.destination(400, 640))
  utils.mergeArray(t, SongInfo.totalinfo.destination(300, 400))
  return t
end

return SongInfo
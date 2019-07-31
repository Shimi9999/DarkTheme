local Search = {}
Search.w = 500
Search.frame_h = 46
Search.text_h = 32
function Search.new()
  local obj = {}
  return setmetatable(obj, {__index = Search})
end
function Search.image()
  return {
    {id = "search_frame", src = 3, x = 0, y = 0, w = Search.w, h = Search.frame_h}
  }
end
function Search.text()
  return {
    {id = "search", font = 0, size = Search.text_h, ref = 30}
  }
end
function Search.destination()
  local base_x = 50 local base_y = 50
  return {
    {id = "search_frame", dst = { {x = base_x - 8, y = base_y - 8, w = Search.w, h = Search.frame_h, r = 16, g = 16, b = 16} }},
    {id = "search", filter = 1, dst = { {x = base_x, y = base_y, w = Search.w, h = Search.text_h} }},
  }
end

return Search
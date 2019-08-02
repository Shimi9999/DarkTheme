local utils = {}

function utils.mergeArray(first, second)
  for i = 1, #second do
    first[#first + 1] = second[i]
  end
  return first
end

function utils.mergeMap(first, second)
  for k, v in pairs(second) do
    first[k] = v
  end
  return first
end

function utils.generateValue(param_table)
  return utils.generateValueX(param_table, 10)
end
function utils.generateValueX(param_table, divx)
  return utils.generateValueXY(param_table, divx, 1)
end
function utils.generateValueXY(param_table, divx, divy)
  local src = 2 local x = 0 local y = 0 local w = 48 local h = 64 local space = -4
  local t = {src = src, x = x, y = y, w = w * divx, h = h * divy, divx = divx, divy = divy, space = space}
  return utils.mergeMap(t, param_table)
end

return utils

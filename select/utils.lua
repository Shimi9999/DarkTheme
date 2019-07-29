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

return utils

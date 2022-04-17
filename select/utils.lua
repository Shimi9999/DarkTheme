local utils = {}

function utils.append_all(list, list1)
	for _, v in ipairs(list1) do
		table.insert(list, v)
	end
end

function utils.merge_all(table, table1)
	for k, v in pairs(table1) do
		if type(k) == "number" and k % 1 == 0 then
			table[#table + 1] = v
		elseif table[k] and type(table[k]) == "table" and type(v) == "table" then
			utils.merge_all(table[k], v)
		else
			table[k] = v
		end
	end
	return table
end

function utils.merge_all_whitout_function(table, table1)
	for k, v in pairs(table1) do
    if type(v) == "function" then
      -- continue
		elseif type(k) == "number" and k % 1 == 0 then
			table[#table + 1] = v
		elseif table[k] and type(table[k]) == "table" and type(v) == "table" then
			utils.merge_all_whitout_function(table[k], v)
		else
			table[k] = v
		end
	end
	return table
end

function utils.generateValue(param_table)
  return utils.generateValueX(param_table, 10)
end
function utils.generateValueX(param_table, divx)
  return utils.generateValueXY(param_table, divx, 1)
end
function utils.generateValueXY(param_table, divx, divy)
  local w = 48 local h = 64 local space = -4
  local t = {src = "src_number", x = 0, y = 0, w = w * divx, h = h * divy, divx = divx, divy = divy, space = space}
  return utils.merge_all(t, param_table)
end

return utils

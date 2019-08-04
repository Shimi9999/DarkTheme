local property = {}

property.property = {
  {name = "BACKGROUND", item = {
      {name = "DEFAULT", op = 900},
      {name = "CUSTOMIZE", op = 901},
    }},
  {name = "STAGEFILE", item = {
    {name = "NORMAL SIZE", op = 902},
    {name = "FULL SCREEN", op = 903},
  }},
}

-- random = -1
function property.isBackgroundDefault()
  return skin_config.option["BACKGROUND"] == 900
end
function property.isBackgroundCustomize()
  return skin_config.option["BACKGROUND"] == 901
end

function property.isStagefileNormal()
  return skin_config.option["STAGEFILE"] == 902
end
function property.isStagefileFull()
  return skin_config.option["STAGEFILE"] == 903
end
function property.isStagefileRandom()
  return skin_config.option["STAGEFILE"] == -1
end

property.filepath = {
  {name = "BACKGROUND(CUSTOMIZE)", path = "customize/background/*.png",},
}

property.offset = {
	{name = "BACKGROUND DARKNESS (0~255)", id = 0, a = true}
}
function property.backgroundDarkness()
  return skin_config.offset["BACKGROUND DARKNESS (0~255)"].a
end

return property
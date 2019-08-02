local utils = require "utils"

Objects = {}
function Objects.new(classes)
  local new_class = {classes = classes}
  function new_class.new()
    return setmetatable({}, {__index = new_class})
  end

  setmetatable(new_class, {__index = Objects})
  return new_class
end
function Objects:image()
  local t = {}
  for i = 1, #self.classes do
    utils.mergeArray(t, self.classes[i]:image())
  end
  return t
end
function Objects:imageset()
  local t = {}
  for i = 1, #self.classes do
    utils.mergeArray(t, self.classes[i]:imageset())
  end
  return t
end
function Objects:value()
  local t = {}
  for i = 1, #self.classes do
    utils.mergeArray(t, self.classes[i]:value())
  end
  return t
end
function Objects:text()
  local t = {}
  for i = 1, #self.classes do
    utils.mergeArray(t, self.classes[i]:text())
  end
  return t
end
function Objects:slider()
  local t = {}
  for i = 1, #self.classes do
    utils.mergeArray(t, self.classes[i]:slider())
  end
  return t
end
function Objects:graph()
  local t = {}
  for i = 1, #self.classes do
    utils.mergeArray(t, self.classes[i]:graph())
  end
  return t
end

return Objects
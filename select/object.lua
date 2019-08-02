Object = {}
function Object.new()
  local new_class = {}
  function new_class.new()
    return setmetatable({}, {__index = new_class})
  end

  setmetatable(new_class, {__index = Object})
  return new_class
end
function Object.image() return{} end
function Object.imageset() return{} end
function Object.value() return{} end
function Object.text() return{} end
function Object.slider() return{} end
function Object.graph() return{} end

return Object
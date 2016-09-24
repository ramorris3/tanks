--DRAW COMPONENT CLASS--
local function DrawComponent()
  local self = {}

  --private fields--
  local _layers = {}
  local _numLayers = 5

  --init drawing layers
  for i = 0,_numLayers do
    _layers[i] = {}
  end

  --public methods--
  function self.addDrawable(d, layer)
    local l = layer or _numLayers
    table.insert(_layers[l], d)
  end

  function self.draw()
    for i = 0, #_layers do
      for j = 0, #_layers[i] do
        local drawable = _layers[i][j]
        if drawable ~= nil then drawable.draw() end
      end
    end
  end

  return self
end

return DrawComponent

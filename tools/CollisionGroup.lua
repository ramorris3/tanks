-- COLLISION GROUP --
local function CollisionGroup()
  local self = {}

  local _objects = {}

  function self.add(s)
    table.insert(_objects, s)
  end

  function self.collideWith(other, onCollide)
    for i = 0, #_objects do
      if _objects[i] ~= nil then
        if _objects[i].collideWith(other) then
          if onCollide ~= nil then
            onCollide()
          end
          return true
        end
      end
    end
    return false
  end

  function self.reset()
    _objects = {}
  end

  return self
end

return CollisionGroup

-- COLLISION GROUP --
local function CollisionGroup()
  local self = {}

  local _objects = {}

  function self.add(s)
    table.insert(_objects, s)
  end

  function self.collideWith(other, onCollide)
    for i = 1, #_objects do
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

  function self.getFirstInactive()
    for i=1,#_objects do
      if not _objects[i].active then return _objects[i] end
    end
    return nil
  end

  return self
end

return CollisionGroup

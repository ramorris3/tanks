--UPDATE COMPONENT CLASS--
local function UpdateComponent()
  local self = {}

  --private
  local _updatables = {}

  --public 
  function self.addUpdatable(u)
    table.insert(_updatables, u)
  end

  function self.update(dt)
    for i = 0, #_updatables do
      if _updatables[i] ~= nil then _updatables[i].update(dt) end
    end
  end

  function self.reset()
    _updatables = {}
  end

  return self
end

return UpdateComponent

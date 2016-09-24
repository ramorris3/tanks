Player = require 'objects.Player'

local function GameState()
  self = {}

  -- init player
  local _player = Player()

  -- update and draw
  gUpdateComponent.addUpdatable(self)

  function self.update(dt)
    if love.keyboard.isDown("escape") then
      gStateManager.startState('menu')
    end
  end

  return self
end

return GameState
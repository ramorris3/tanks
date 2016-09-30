Player = require 'objects.Player'
TileLoader = require 'tools.TileLoader'
CollisionGroup = require 'tools.CollisionGroup'

local function GameState()
  local self = {
    -- init collision groups
    solidGroup = CollisionGroup(),
    playerBullets = CollisionGroup(),
  }

  -- load tiles
  local _tileLoader = TileLoader(self)
  _tileLoader.loadTiles()

  -- init player
  local _player = Player(self)

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
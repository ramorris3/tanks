Player = require 'objects.Player'
TileLoader = require 'tools.TileLoader'

local function GameState()
  local self = {}

  -- load tiles
  local _tileLoader = TileLoader()
  _tileLoader.loadTiles()

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
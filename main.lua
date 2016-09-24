-- load component modules
UpdateComponent = require 'components.UpdateComponent'
DrawComponent = require 'components.DrawComponent'

-- create global components
gUpdateComponent = UpdateComponent()
gDrawComponent = DrawComponent()

-- load object modules
Player = require 'objects.Player'

function love.load()
  Player()
end

function love.update(dt)
  gUpdateComponent.update(dt)
end

function love.draw()
  gDrawComponent.draw()
end
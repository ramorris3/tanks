-- load math overrides
require 'tools.math'

-- load component modules
ScaleComponent = require 'components.ScaleComponent'
UpdateComponent = require 'components.UpdateComponent'
DrawComponent = require 'components.DrawComponent'

-- load manager and tool modules
StateManager = require 'tools.StateManager'
CollisionGroup = require 'tools.CollisionGroup'

-- create global constants
gGameWidth = 320
gGameHeight = 248
gGameScale = 3

-- create global components
gScaleComponent = ScaleComponent()
gUpdateComponent = UpdateComponent()
gDrawComponent = DrawComponent()

-- create global collision
gSolidGroup = CollisionGroup()
gPlayerBullets = CollisionGroup()

-- create state manager and load state modules
gStateManager = StateManager()
MenuState = require 'states.MenuState'
GameState = require 'states.GameState'


function love.load()
  -- init game states
  gStateManager.addState('menu', MenuState)
  gStateManager.addState('game', GameState)
  -- start menu state
  gStateManager.startState('menu')

  love.mouse.setVisible(false) -- make default mouse invisible

end

function love.update(dt)
  gUpdateComponent.update(dt)
end

function love.draw()
  -- set up virtual canvas
  gScaleComponent.preDraw()

  -- draw to virtual canvas
  gDrawComponent.draw()

  -- draw virtual canvas to game
  gScaleComponent.postDraw()
end
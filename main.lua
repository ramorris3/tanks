-- load component modules
ScaleComponent = require 'components.ScaleComponent'
UpdateComponent = require 'components.UpdateComponent'
DrawComponent = require 'components.DrawComponent'

-- load manager modules
StateManager = require 'tools.StateManager'

-- create global constants
gGameWidth = 320
gGameHeight = 240

-- create global components
gScaleComponent = ScaleComponent()
gUpdateComponent = UpdateComponent()
gDrawComponent = DrawComponent()

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
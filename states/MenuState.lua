local function MenuState()
  local self = {}

  -- update and draw
  gUpdateComponent.addUpdatable(self)
  gDrawComponent.addDrawable(self)

  function self.update(dt)
    if love.keyboard.isDown('return') then
      gStateManager.startState('game')
    end
  end

  function self.draw()
    love.graphics.printf(
      {{0,0,0}, "MORE TANKS!\n\npress enter to start game"},
      0, 100, gGameWidth, 'center')
  end

  return self
end

return MenuState
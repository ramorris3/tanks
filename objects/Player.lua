local function Player()
  local self = {
    x = 0,
    y = 0,
    w = 50,
    h = 50,
    s = 500
  }

  gUpdateComponent.addUpdatable(self)
  gDrawComponent.addDrawable(self)

  function self.update(dt)
    if love.keyboard.isDown("w") then
      self.y = self.y - self.s * dt
    elseif love.keyboard.isDown("s") then
      self.y = self.y + self.s * dt
    end

    if love.keyboard.isDown("a") then
      self.x = self.x - self.s * dt
    elseif love.keyboard.isDown("d") then
      self.x = self.x + self.s * dt
    end
  end

  function self.draw(dt)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  end

  return self
end

return Player
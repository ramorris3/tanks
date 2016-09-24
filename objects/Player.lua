Actor = require "objects.Actor"

local function Player()
  local self = Actor(16, 24, 12, 8)

  local _img = love.graphics.newImage('assets/img/tank.png')

  local _speed = 27

  gUpdateComponent.addUpdatable(self)
  gDrawComponent.addDrawable(self,2)

  function self.update(dt)
    if love.keyboard.isDown("w") then
      self.moveY(-_speed * dt)
    elseif love.keyboard.isDown("s") then
      self.moveY(_speed * dt)
    end

    if love.keyboard.isDown("a") then
      self.moveX(-_speed * dt)
    elseif love.keyboard.isDown("d") then
      self.moveX(_speed * dt)
    end
  end

  function self.draw()
    love.graphics.draw(_img,self.x, self.y)
  end

  return self
end

return Player
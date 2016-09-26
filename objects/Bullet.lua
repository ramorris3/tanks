Actor = require 'objects.Actor'
Vector2 = require 'tools.Vector2'

local function Bullet()
  local self = Actor(0, 0, 2, 2)

  local _img = love.graphics.newImage('assets/img/bullet.png')
  local _velocity = Vector2()
  local _speed = 60
  _velocity.x = 1
  _velocity.y = 1
  _velocity.normalize()
  _velocity.scale(_speed)

  local function _bounceX()
    _velocity.x = _velocity.x * -1
  end

  local function _bounceY()
    _velocity.y = _velocity.y * -1
  end

  gUpdateComponent.addUpdatable(self)
  gDrawComponent.addDrawable(self, 3)

  function self.update(dt)
    self.moveX(_velocity.x * dt, _bounceX)
    self.moveY(_velocity.y * dt, _bounceY)
  end

  function self.draw()
    love.graphics.draw(_img, self.x, self.y)
  end

  return self
end

return Bullet
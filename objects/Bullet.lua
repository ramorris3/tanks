Actor = require 'objects.Actor'
Vector2 = require 'tools.Vector2'

local function Bullet()
  local self = Actor(0, 0, 2, 2)

  local _img = love.graphics.newImage('assets/img/bullet.png')
  local _speed = 60
  local _velocity = Vector2()
  _velocity.x = 1
  _velocity.y = 1
  _velocity.normalize()
  _velocity.scale(_speed)
  local _bounced = false

  local function _bounceX()
    if _bounced then
      _bounced = false
      self.active = false
      return
    end
    _bounced = true
    _velocity.x = _velocity.x * -1
  end

  local function _bounceY()
    if _bounced then
      _bounced = false
      self.active = false
      return
    end
    _bounced = true
    _velocity.y = _velocity.y * -1
  end

  gUpdateComponent.addUpdatable(self)
  gDrawComponent.addDrawable(self, 3)

  function self.update(dt)
    if not self.active then return end
    self.moveX(_velocity.x * dt, _bounceX)
    self.moveY(_velocity.y * dt, _bounceY)
  end

  function self.draw()
    if not self.active then return end
    love.graphics.draw(_img, self.x, self.y)
  end

  function self.fireAt(x, y, targetX, targetY)
    self.active = true
    self.x = x
    self.y = y
    _velocity.x = targetX - self.x
    _velocity.y = targetY - self.y
    _velocity.normalize()
    _velocity.scale(_speed)
  end

  return self
end

return Bullet
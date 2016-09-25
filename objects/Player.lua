Actor = require "objects.Actor"

local function Player()
  local self = Actor(16, 24, 22, 15)

  local _turret_img = love.graphics.newImage('assets/img/turret.png')
  local _base_img = love.graphics.newImage('assets/img/tank-base.png')

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

    local x, y = love.mouse.getPosition() -- get the position of the mouse
    local angle = math.atan2(y/gGameScale - self.y, x/gGameScale - self.x)
    _turret_img = love.graphics.newImage( self.get_img(angle) )
  end

  function self.draw()
    love.graphics.draw(_base_img,self.x, self.y)
    love.graphics.draw(_turret_img,self.x, self.y)
  end

  function self.get_img(angle)
    angle = angle / math.pi
    if (angle < -7 / 8) then
      return 'assets/img/turret/lr.png' end
    if (angle < -5 / 8) then
      return 'assets/img/turret/backslash.png' end
    if (angle < -3 / 8) then
      return 'assets/img/turret/ud.png' end
    if (angle < -1 / 8) then
      return 'assets/img/turret/slash.png' end
    if (angle < 1 / 8) then
      return 'assets/img/turret/lr.png' end
    if (angle < 3 / 8) then
      return 'assets/img/turret/backslash.png' end
    if (angle < 5 / 8) then
      return 'assets/img/turret/ud.png' end
    if (angle < 7 / 8) then
      return 'assets/img/turret/slash.png' end
    return 'assets/img/turret/lr.png'
  end

  return self
end

return Player
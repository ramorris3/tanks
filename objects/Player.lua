Actor = require "objects.Actor"

local function Player()
  local self = Actor(16, 24, 20, 22)

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

    local x, y = love.mouse.getPosition() -- get the position of the mouse
    local angle = math.atan2(y/gGameScale - self.y, x/gGameScale - self.x)
    _img = love.graphics.newImage( self.get_img(angle) )
  end

  function self.draw()
    love.graphics.draw(_img,self.x, self.y)
  end

  function self.get_img(angle)
    if (angle < - 7 * math.pi / 8) then
      return 'assets/img/l.png' end
    if (angle < - 5 * math.pi / 8) then
      return 'assets/img/ul.png' end
    if (angle < - 3 * math.pi / 8) then
      return 'assets/img/u.png' end
    if (angle < - 1 * math.pi / 8) then
      return 'assets/img/ur.png' end
    if (angle < math.pi / 8) then
      return 'assets/img/r.png' end
    if (angle < 3 * math.pi / 8) then
      return 'assets/img/dr.png' end
    if (angle < 5 * math.pi / 8) then
      return 'assets/img/d.png' end
    if (angle < 7 * math.pi / 8) then
      return 'assets/img/dl.png' end
    return 'assets/img/l.png'
  end

  return self
end

return Player
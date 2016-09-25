Actor = require "objects.Actor"

local function Player()
  local self = Actor(16, 24, 22, 15)

  local _turret_img = love.graphics.newImage('assets/img/turret/lr.png')
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
    _turret_img = love.graphics.newImage( 'assets/img/turret/'..self.get_img(angle) )
  end

  function self.draw()
    love.graphics.draw(_base_img,self.x, self.y)
    love.graphics.draw(_turret_img,self.x, self.y)
  end

  function self.get_img(angle)
    local img_dict = {
      [-9] = 'lr.png',
      [-7] = 'backslash.png',
      [-5] = 'ud.png',
      [-3] = 'slash.png',
      [-1] = 'lr.png',
      [1] = 'backslash.png',
      [3] = 'ud.png',
      [5] = 'slash.png',
      [7] = 'lr.png',
    }
    local angle = math.floor((angle / math.pi) * 8)
    if (angle % 2 == 0) then angle = angle - 1 end
    return img_dict[angle]
  end

  return self
end

return Player
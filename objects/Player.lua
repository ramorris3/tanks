Actor = require "objects.Actor"
Bullet = require "objects.Bullet"

local function Player()
  local self = Actor(16, 24, 22, 15)

  local _turret_img = love.graphics.newImage('assets/img/turret/r.png')
  local _base_img = love.graphics.newImage('assets/img/base/r.png')

  local _speed = 27

  -- create bullets
  local _cooldown = .25
  local _fireTimer = 0
  for i = 1,5 do
    local bullet = Bullet()
    bullet.active = false
    gPlayerBullets.add(bullet)
  end

  gUpdateComponent.addUpdatable(self)
  gDrawComponent.addDrawable(self,2)

  function self.update(dt)
    -- movement
    local vector = {x=0, y=0}
    if love.keyboard.isDown("w") then
      vector.y = -1
    elseif love.keyboard.isDown("s") then
      vector.y = 1
    end

    if love.keyboard.isDown("a") then
      vector.x = -1
    elseif love.keyboard.isDown("d") then
      vector.x = 1
    end

    local magnitude = math.sqrt(math.abs(vector.x) + math.abs(vector.y)) --no need to square, only 1 or 0
    if magnitude ~= 0 then
      vector = { x=vector.x/magnitude, y=vector.y/magnitude, }
      self.moveX(_speed * vector.x * dt)
      self.moveY(_speed * vector.y * dt)
      local base_angle = math.atan2(vector.y, vector.x)
      _base_img = love.graphics.newImage( 'assets/img/base/'..self.get_img(base_angle) )
    end

    -- rotating the turret
    local mouse_x = love.mouse.getX()/gGameScale
    local mouse_y = love.mouse.getY()/gGameScale
    local turret_angle = math.atan2(mouse_y - self.y, mouse_x - self.x)
    _turret_img = love.graphics.newImage( 'assets/img/turret/'..self.get_img(turret_angle) )

    -- firing a bullet
    if _fireTimer > 0 then _fireTimer = _fireTimer - dt end
    if love.mouse.isDown(1) and _fireTimer <= 0 then
      _fireTimer = _cooldown
      self.fire()
    end
  end

  function self.draw()
    love.graphics.draw(_base_img,self.x, self.y)
    love.graphics.draw(_turret_img,self.x, self.y)
  end

  function self.get_img(angle)
    local img_dict = {
      [-9] = 'l.png',
      [-7] = 'ul.png',
      [-5] = 'u.png',
      [-3] = 'ur.png',
      [-1] = 'r.png',
      [1] = 'dr.png',
      [3] = 'd.png',
      [5] = 'dl.png',
      [7] = 'l.png',
    }
    local angle = math.floor((angle / math.pi) * 8)
    if (angle % 2 == 0) then angle = angle - 1 end
    return img_dict[angle]
  end

  function self.fire()
    local bullet = gPlayerBullets.getFirstInactive()
    if bullet == nil then return end
    bullet.fireAt(self.x, self.y,
      love.mouse.getX(),
      love.mouse.getY())
  end

  return self
end

return Player
Rectangle = require "objects.Rectangle"

-- ACTOR CLASS --
local function Actor(x, y, w, h, ox, oy)
  local self = Rectangle(x, y, w, h)
  -- hitbox offset (optional)
  self.ox = ox or 0
  self.oy = oy or 0
  
  -- method for moving horizontally
  local _xRemainder = 0
  function self.moveX(distance, onCollide)
    _xRemainder = _xRemainder + distance
    local dx = math.round(_xRemainder)

    if dx ~= 0 then
      _xRemainder = _xRemainder - dx
      local sign = math.sign(dx)

      while dx ~= 0 do
        --move and check for collisions
        local prevX = self.x
        self.x = self.x + sign
        if not gSolidGroup.collideWith(self) then
          --no collision, continue incrementing pixel by pixel
          dx = dx - sign
        else
          --collision, move back and call collision callback
          self.x = prevX
          if onCollide ~= nil then onCollide() end
          break
        end
      end
    end
  end

  -- method for moving vertically
  local _yRemainder = 0
  function self.moveY(distance, onCollide)
    _yRemainder = _yRemainder + distance
    local dy = math.round(_yRemainder)

    if dy ~= 0 then
      _yRemainder = _yRemainder - dy
      local sign = math.sign(dy)

      while dy ~= 0 do
        local prevY = self.y
        self.y = self.y + sign
        if not gSolidGroup.collideWith(self) then
          dy = dy - sign
        else
          self.y = prevY
          if onCollide ~= nil then onCollide() end
          break
        end
      end
    end
  end

  return self
end

return Actor
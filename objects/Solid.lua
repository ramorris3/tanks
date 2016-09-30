Rectangle = require "objects.Rectangle"

-- Solid tiles -- 
local function Solid(game,x,y,w,h,img,ox,oy)
  local _ox = ox or 0
  local _oy = oy or 8
  local self = Rectangle(x,y,w,h)

  local _img = love.graphics.newImage(img or "assets/img/block.png")

  gDrawComponent.addDrawable(self)
  game.solidGroup.add(self)

  function self.draw()
    love.graphics.draw(_img,self.x - _ox,self.y - _oy)
  end

  return self
end

return Solid
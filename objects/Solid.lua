Rectangle = require "objects.Rectangle"

-- Solid tiles -- 
local function Solid(x,y,w,h,img)
  local self = Rectangle(x,y,w,h)

  local _img = love.graphics.newImage(img or "assets/img/block.png")

  gDrawComponent.addDrawable(self)
  gSolidGroup.add(self)

  function self.draw()
    love.graphics.draw(_img,self.x,self.y)
  end

  return self
end

return Solid